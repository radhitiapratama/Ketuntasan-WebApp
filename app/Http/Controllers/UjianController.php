<?php

namespace App\Http\Controllers;

use App\Models\Utils;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Psy\CodeCleaner\FunctionReturnInWriteContextPass;

class UjianController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $columnsSearch = ['s.nama', 'u.ruang', 'u.sesi', 'k.nama_kelas'];
            $table = DB::table("ujian as u");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            $query = $table->select('u.*', 's.nama', 's.tingkatan', 'k.nama_kelas')
                ->join('siswa as s', 's.siswa_id', '=', 'u.siswa_id')
                ->join('kelas as k', 'k.kelas_id', '=', 's.kelas_id');

            if ($request->ruang != null) {
                $query->where('u.ruang', $request->ruang);
            }

            if ($request->sesi != null) {
                $query->where('u.sesi', $request->sesi);
            }

            $count = $query->count();

            $result = $query->offset($request->start)
                ->limit($request->length)
                ->orderBy('u.ruang', 'ASC')
                ->orderBy('u.sesi', 'ASC')
                ->orderBy("s.nama", 'ASC')
                ->get();

            $data = [];

            if (!empty($result)) {
                $i = $request->start;
                foreach ($result as $row) {
                    $i++;
                    $subData = [];
                    $subData['no'] = $i;

                    $subData['nama'] = $row->nama;
                    $subData['kelas'] = Utils::checkTingkatan($row->tingkatan) . " " . $row->nama_kelas;
                    $subData['ruang'] = '
                    <div class="text-center">
                        ' . $row->ruang . '
                    </div>
                    ';
                    $subData['sesi'] = '
                    <div class="text-center">
                        ' . $row->sesi . '
                    </div>
                    ';
                    $subData['aksi'] = '
                    <div class="text-center">
                        <a href="/ujian/edit/' . $row->id . '" class="setting-edit m-auto">
                            <i class="ri-pencil-line"></i>
                        </a>
                    </div>
                    ';

                    $data[] = $subData;
                }
            }

            return response()->json([
                'draw' => $request->draw,
                'recordsFiltered' => $count,
                'recordsTotal' => $count,
                'data' => $data,
            ]);
        }

        $dataToView = [
            'sesis' => Utils::$sesis,
            'ruangs' => Utils::$ruangs,
        ];


        return view("pages.ujian.index", $dataToView);
    }

    public function add()
    {
        $sql_siswa_ujian = DB::table("ujian")
            ->select('siswa_id');

        $sql_siswa = DB::table('siswa as s')
            ->join('kelas as k', 'k.kelas_id', '=', 's.kelas_id')
            ->where('s.status', 1)
            ->whereNotIn("s.siswa_id", $sql_siswa_ujian)
            ->get();

        $dataToView = [
            'siswas' => $sql_siswa,
            'ruangs' => Utils::$ruangs,
            'sesis' => Utils::$sesis
        ];

        return view("pages.ujian.add", $dataToView);
    }

    public function store(Request $request)
    {
        $siswa = $request->siswa;
        $ruang = $request->ruang;
        $sesi = $request->sesi;

        for ($i = 0; $i < count($siswa); $i++) {
            $sql_check = DB::table("ujian")
                ->where('siswa_id', $siswa[$i])
                ->first();

            if ($sql_check) {
                continue;
            }

            DB::table('ujian')
                ->insert([
                    'siswa_id' => $siswa[$i],
                    'ruang' => $ruang[$i],
                    'sesi' => $sesi[$i],
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now(),
                ]);
        }

        return redirect()->back()->with("success", "Data berhasil di tambahkan");
    }

    public function checkSiswa(Request $request)
    {
        $siswa_id = $request->siswa_id;

        $sql_siswa = DB::table("ujian as u")
            ->select('u.*', 's.nama')
            ->join('siswa as s', 's.siswa_id', '=', 'u.siswa_id')
            ->where('u.siswa_id', $siswa_id)
            ->first();

        if ($sql_siswa) {
            return response()->json([
                'status' => true,
                'data' => $sql_siswa,
            ]);
        }

        return response()->json([
            'status' => false,
        ]);
    }

    public function edit($id)
    {
        if (!isset($id)) {
            return redirect()->back();
        }

        $sql_ujian = DB::table("ujian as u")
            ->join('siswa as s', 's.siswa_id', '=', 'u.siswa_id')
            ->where('u.id', $id)
            ->first();

        $dataToView = [
            'data_ujian' => $sql_ujian,
            'ruangs' => Utils::$ruangs,
            'sesis' => Utils::$sesis,
        ];

        return view("pages.ujian.edit", $dataToView);
    }

    public function update(Request $request)
    {
        DB::table("ujian")
            ->where('id', $request->id)
            ->update([
                'ruang' => $request->ruang,
                'sesi' => $request->sesi
            ]);

        return redirect()->back()->with("success", "Data berhasil di update");
    }

    public function cetakQr(Request $request)
    {
        if (!isset($request->ruang_cetak) || !isset($request->sesi_cetak)) {
            return redirect()->back();
        }

        $sql_ujian = DB::table("ujian as u")
            ->join('siswa as s', 's.siswa_id', '=', 'u.siswa_id')
            ->join('kelas as k', 'k.kelas_id', '=', 's.kelas_id')
            ->where('u.ruang', $request->ruang_cetak)
            ->where('u.sesi', $request->sesi_cetak)
            ->get();

        $fileName = "QR Ruang " . $request->ruang_cetak . " Sesi " . $request->sesi_cetak;

        $dataToView  = [
            'ujians' => $sql_ujian,
            'ruang' => $request->ruang_cetak,
            'sesi' => $request->sesi_cetak,
        ];

        $pdf = Pdf::loadView("pages.ujian.cetak-barcode", $dataToView);
        $pdf->setPaper("A4", "potrait");
        return $pdf->stream($fileName . ".pdf");
    }
}
