<?php

namespace App\Http\Controllers;

use App\Models\Utils;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Psy\CodeCleaner\FunctionReturnInWriteContextPass;
use Symfony\Component\CssSelector\Node\FunctionNode;

class KetidakhadiranController extends Controller
{
    public function index(Request $request)
    {
        $today_start = date("Y-m-d") . " 00:00:00";
        $today_end = date("Y-m-d") . " 23:59:59";

        if ($request->ajax()) {
            $columnsSearch = ['s.nama', 'u.ruang', 'u.sesi', 'ks.nama_kelas'];

            $table = DB::table("ketidakhadiran as k");

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
                ->where('k.status', 1)
                ->where('k.created_at', '>=', $today_start)
                ->where('k.created_at', '<=', $today_end);

            if ($request->ruang != null) {
                $query->where('u.ruang', $request->ruang);
            }

            if ($request->sesi != null) {
                $query->where('u.sesi', $request->sesi);
            }

            if ($request->alasan != null) {
                $query->where('k.alasan', $request->alasan);
            }

            $count = $query->count();

            $result = $query->offset($request->start)
                ->limit($request->length)
                ->orderBy('k.id', 'DESC')
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

                    if ($row->alasan == 1) {
                        $subData['alasan'] = '
                       <div class="text-center">
                            <span class="badge badge-success p-2">
                                Izin
                            </span>
                        </div>
                       ';
                    }

                    if ($row->alasan == 2) {
                        $subData['alasan'] = '
                       <div class="text-center">
                            <span class="badge badge-warning p-2">
                                Sakit
                            </span>
                        </div>
                       ';
                    }

                    if ($row->alasan == 3) {
                        $subData['alasan'] = '
                       <div class="text-center">
                            <span class="badge badge-danger p-2">
                                Tanpa Keterangan
                            </span>
                        </div>
                       ';
                    }

                    $subData['waktu'] = date("d-m-Y H:m:s", strtotime($row->created_at));

                    $subData['aksi'] = '
                    <div class="text-center d-flex" style="gap:20px;">
                        <a href="/ketidakhadiran/edit/' . $row->id . '" class="setting-edit m-auto">
                            <i class="ri-pencil-line"></i>
                        </a>
                        <button class="setting-delete m-auto btn-delete"data-id="' . $row->id . '">
                            <i class="ri-delete-bin-line"></i>
                        </button>
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
            'alasans' => Utils::$alasansTidakHadir,
        ];

        return view("pages.ketidakhadiran.index", $dataToView);
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
            'alasans' => Utils::$alasansTidakHadir,
        ];

        return view("pages.ketidakhadiran.add", $dataToView);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'siswa' => "required",
            'alasan' => "required"
        ]);

        if ($validator->fails()) {
            return redirect()->back();
        }

        $sql_ujian = DB::table("ujian")
            ->where('siswa_id', $request->siswa)
            ->first();

        if (!$sql_ujian) {
            return redirect()->back();
        }

        DB::table("ketidakhadiran")
            ->insert([
                'ujian_id' => $sql_ujian->id,
                'alasan' => $request->alasan,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]);


        return redirect()->back()->with("success", "Data berhasil di tambahkan");
    }

    public function edit($id)
    {
        if (!isset($id)) {
            return redirect()->back();
        }

        $sql_tidakhadir = DB::table('ketidakhadiran as k')
            ->select('s.nama', 's.siswa_id', 'k.*', 'u.ruang', 'u.sesi')
            ->join('ujian as u', 'u.id', '=', 'k.ujian_id')
            ->join('siswa as s', 's.siswa_id', '=', 'u.siswa_id')
            ->join('kelas as ks', 'ks.kelas_id', '=', 's.kelas_id')
            ->where('k.id', $id)
            ->where('k.status', 1)
            ->first();

        $sql_siswa = DB::table("siswa")
            ->select('siswa_id', 'nama')
            ->get();

        $dataToView = [
            'data_tidakhadir' => $sql_tidakhadir,
            'siswas' => $sql_siswa,
            'alasans' => Utils::$alasansTidakHadir,
        ];
        return view("pages.ketidakhadiran.edit", $dataToView);
    }

    public function update(Request $request)
    {
        $sql_ujian = DB::table("ujian")
            ->where('siswa_id', $request->siswa)
            ->first();

        DB::table("ketidakhadiran")
            ->where('id', $request->id)
            ->update([
                'ujian_id' => $sql_ujian->id,
                'alasan' => $request->alasan,
            ]);

        return redirect()->back()->with("success", "Data berhasil di update");
    }

    public function addByQr()
    {
        $dataToView = [
            'alasans' => Utils::$alasansTidakHadir,
        ];
        return view("pages.ketidakhadiran.add-by-barcode", $dataToView);
    }

    public function cetak(Request $request)
    {
        $fileName = "Data Siswa Tidak Hadir " . $request->tgl_start . " - " . $request->tgl_end;

        $today_start = date("Y-m-d") . " 00:00:00";
        $today_end = date("Y-m-d") . " 23:59:59";

        if ($request->tgl_start) {
            $today_start = $request->tgl_start . " 00:00:00";
            $today_end = $request->tgl_end . " 23:59:59";
        }

        $sql_tidakhadir = DB::table("ketidakhadiran as k")
            ->select('s.nama', 's.tingkatan', 'ks.nama_kelas', 'u.*', 'k.*')
            ->join('ujian as u', 'u.id', '=', 'k.ujian_id')
            ->join('siswa as s', 's.siswa_id', '=', 'u.siswa_id')
            ->join('kelas as ks', 'ks.kelas_id', '=', 's.kelas_id')
            ->where('k.status', 1)
            ->where('k.created_at', '>=', $today_start)
            ->where('k.created_at', '<=', $today_end);

        if ($request->ruang != null) {
            $sql_tidakhadir->where('u.ruang', $request->ruang);
        }

        if ($request->sesi != null) {
            $sql_tidakhadir->where('u.sesi', $request->sesi);
        }

        if ($request->alasan != null) {
            $sql_tidakhadir->where('k.alasan', $request->alasan);
        }

        $result = $sql_tidakhadir->orderBy('k.created_at', 'ASC')->get();

        $dataToView = [
            'tgl_start' => date("d-m-Y", strtotime($today_start)),
            'tgl_end' => date("d-m-Y", strtotime($today_end)),
            'ruang' => $request->ruang,
            'sesi' => $request->sesi,
            'ketidakhadirans' => $result,
        ];


        $pdf = Pdf::loadView("pages.ketidakhadiran.cetak-pdf", $dataToView);
        $pdf->setPaper("A4", "potrait");
        return $pdf->stream($fileName . ".pdf");
    }

    public function delete(Request $request)
    {
        $id = $request->id;
        DB::table("ketidakhadiran")
            ->where('id', $id)
            ->update([
                'status' => 0,
            ]);

        return response()->json([
            'status' => true,
        ]);
    }
}
