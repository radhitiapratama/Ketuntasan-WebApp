<?php

namespace App\Http\Controllers;

use App\Models\Utils;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use PhpOffice\PhpSpreadsheet\Calculation\Database\DVar;

class KeterlambatanController extends Controller
{
    public function index(Request $request)
    {
        $today_start = date("Y-m-d") . " 00:00:00";
        $today_end = date("Y-m-d") . " 23:59:59";

        if ($request->ajax()) {
            $columnsSearch = ['s.nama', 'u.ruang', 'u.sesi', 'ks.nama_kelas'];

            $table = DB::table("keterlambatan as k");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            if ($request->tgl_start != null) {
                $today_start = $request->tgl_start . " 00:00:00";
                $today_end = $request->tgl_end . " 23:59:59";
            }

            $query = $table->select('s.nama', 's.tingkatan', 'ks.nama_kelas', 'u.*', 'k.*')
                ->join('ujian as u', 'u.id', '=', 'k.ujian_id')
                ->join('siswa as s', 's.siswa_id', '=', 'u.siswa_id')
                ->join('kelas as ks', 'ks.kelas_id', '=', 's.kelas_id')
                ->where('k.created_at', '>=', $today_start)
                ->where('k.created_at', '<=', $today_end);

            if ($request->ruang != null) {
                $query->where('u.ruang', $request->ruang);
            }

            if ($request->sesi != null) {
                $query->where('u.sesi', $request->sesi);
            }

            if ($request->tidak_lanjut != null) {
                $query->where('k.tidak_lanjut', $request->tidak_lanjut);
            }

            $count = $query->count();

            $result = $query->offset($request->start)
                ->limit($request->length)
                ->orderBy('k.id', 'DESC')
                ->orderBy('k.tidak_lanjut', 'ASC')
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

                    if ($row->tidak_lanjut == 1) {
                        $tidak_lanjut = '
                        <div class="text-center">
                            <span class="badge badge-success p-2">
                                Diperbolehkan Masuk
                            </span>
                        </div>';
                    }

                    if ($row->tidak_lanjut == 2) {
                        $tidak_lanjut = '
                        <div class="text-center">
                            <span class="badge badge-warning p-2">
                                Ikut di sesi berikutnya
                            </span>
                        </div>';
                    }

                    $subData['alasan'] = $row->alasan_terlambat;
                    $subData['tidak_lanjut'] = $tidak_lanjut;

                    $subData['aksi'] = '
                    <div class="text-center">
                        <a href="/keterlambatan/edit/' . $row->id . '" class="setting-edit m-auto">
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
            'ruangs' => Utils::$ruangs,
            'sesis' => Utils::$sesis,
            'tidak_lanjuts' => Utils::$tidak_lanjuts,
        ];


        return view("pages.keterlambatan.index", $dataToView);
    }

    public function add()
    {
        $sql_siswa = DB::table("siswa as s")
            ->select('s.siswa_id', 's.nama', 's.tingkatan', 'k.nama_kelas')
            ->join('kelas as k', 'k.kelas_id', '=', 's.kelas_id')
            ->where('s.status', 1)
            ->get();

        $dataToView = [
            'siswas' => $sql_siswa,
            'sesis' => Utils::$sesis,
            'ruangs' => Utils::$ruangs,
            'tidak_lanjuts' => Utils::$tidak_lanjuts
        ];

        return view("pages.keterlambatan.add", $dataToView);
    }

    public function store(Request $request)
    {
        $sql_ujian = DB::table('ujian')
            ->where('siswa_id', $request->siswa)
            ->first();

        if (!$sql_ujian) {
            return redirect()->back()->withInput()->with("siswa_notfound", "Data siswa belum terdaftar di data ujian");
        }

        DB::table("keterlambatan")
            ->insert([
                'ujian_id' => $sql_ujian->id,
                'alasan_terlambat' => $request->alasan,
                'tidak_lanjut' => $request->tidak_lanjut,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]);

        return redirect()->back()->with("success", "Data Siswa terlambat berhasil di tambahkan");
    }

    public function edit($id_terlambat)
    {
        if (!isset($id_terlambat)) {
            return redirect()->back();
        }

        $sql_terlambat = DB::table('keterlambatan as k')
            ->select('s.nama', 's.siswa_id', 'k.*', 'u.ruang', 'u.sesi')
            ->join('ujian as u', 'u.id', '=', 'k.ujian_id')
            ->join('siswa as s', 's.siswa_id', '=', 'u.siswa_id')
            ->join('kelas as ks', 'ks.kelas_id', '=', 's.kelas_id')
            ->where('k.id', $id_terlambat)
            ->first();

        $sql_siswa = DB::table("siswa")
            ->select('siswa_id', 'nama')
            ->get();

        $dataToView = [
            'data_terlambat' => $sql_terlambat,
            'siswas' => $sql_siswa,
            'sesis' => Utils::$sesis,
            'ruangs' => Utils::$ruangs,
            'tidak_lanjuts' => Utils::$tidak_lanjuts
        ];

        return view("pages.keterlambatan.edit", $dataToView);
    }

    public function update(Request $request)
    {
        // dd($request->all());
        $sql_ujian = DB::table("ujian")
            ->where('siswa_id', $request->siswa)
            ->first();

        DB::table("keterlambatan")
            ->where('id', $request->id)
            ->update([
                'ujian_id' => $sql_ujian->id,
                'alasan_terlambat' => $request->alasan,
                'tidak_lanjut' => $request->tidak_lanjut,
            ]);

        return redirect()->back()->with("success", "Data berhasil di update");
    }

    public function cetak(Request $request)
    {
        // dd($request->all());

        $fileName = "Data Siswa Terlambat " . $request->tgl_start . " - " . $request->tgl_end;

        $today_start = date("Y-m-d") . " 00:00:00";
        $today_end = date("Y-m-d") . " 23:59:59";

        if ($request->tgl_start) {
            $today_start = $request->tgl_start . " 00:00:00";
            $today_end = $request->tgl_end . " 23:59:59";
        }

        $sql_keterlambatan = DB::table("keterlambatan as k")
            ->select('s.nama', 's.tingkatan', 'ks.nama_kelas', 'u.*', 'k.*')
            ->join('ujian as u', 'u.id', '=', 'k.ujian_id')
            ->join('siswa as s', 's.siswa_id', '=', 'u.siswa_id')
            ->join('kelas as ks', 'ks.kelas_id', '=', 's.kelas_id')
            ->where('k.created_at', '>=', $today_start)
            ->where('k.created_at', '<=', $today_end);

        if ($request->ruang != null) {
            $sql_keterlambatan->where('u.ruang', $request->ruang);
        }

        if ($request->sesi != null) {
            $sql_keterlambatan->where('u.sesi', $request->sesi);
        }

        if ($request->tidak_lanjut != null) {
            $sql_keterlambatan->where('k.tidak_lanjut', $request->tidak_lanjut);
        }

        $result = $sql_keterlambatan->orderBy('k.created_at', 'ASC')->get();

        $dataToView = [
            'tgl_start' => date("d-m-Y", strtotime($today_start)),
            'tgl_end' => date("d-m-Y", strtotime($today_end)),
            'ruang' => $request->ruang,
            'sesi' => $request->sesi,
            'keterlambatans' => $result,
        ];


        $pdf = Pdf::loadView("pages.keterlambatan.cetak-pdf", $dataToView);
        $pdf->setPaper("A4", "potrait");
        return $pdf->stream($fileName . ".pdf");
    }

    public function addByQr()
    {
        $dataToView = [
            'tidak_lanjuts' => Utils::$tidak_lanjuts,
        ];
        return view("pages.keterlambatan.add-by-barcode", $dataToView);
    }
}
