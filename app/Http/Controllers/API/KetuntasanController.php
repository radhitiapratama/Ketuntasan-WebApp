<?php

namespace App\Http\Controllers\API;

use Carbon\Carbon;
use App\Models\Siswa;
use App\Models\TahunAjaran;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class KetuntasanController extends Controller
{
    protected $tahun;

    public function __construct()
    {
        $this->tahun = TahunAjaran::select("tahun_ajaran_id")->where("user_aktif", 1)->first();
    }

    public function index(Request $request)
    {
        $tuntas = $request->query("tuntas");
        $semester = $request->query("semester");

        // Jika yg login siswa
        if (Auth::user()->siswa_id) {
            $select_column = ['m.nama_mapel', 'g.nama', 'k.desc', 'k.tuntas', 'k.semester', 'k.tgl_tuntas'];
            $sql_ketuntasan = DB::table('ketuntasan as k')
                ->select($select_column)
                ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
                ->join('guru_mapel as gm', 'gm.guru_mapel_id', '=', 'km.guru_mapel_id')
                ->join("guru as g", 'g.guru_id', '=', 'gm.guru_id')
                ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
                ->where('km.status', 1)
                ->where('gm.status', 1)
                ->where('m.status', 1)
                ->where('g.status', 1)
                ->where('k.tahun_ajaran_id', $this->tahun->tahun_ajaran_id)
                ->where('k.semester', $semester)
                ->where('k.siswa_id', Auth::user()->siswa_id);

            if (isset($tuntas)) {
                $sql_ketuntasan->where("k.tuntas", $tuntas);
            }

            $query_result = $sql_ketuntasan->get();

            $responseKetuntasan =  [];

            if (!empty($query_result)) {
                foreach ($query_result as $row) {
                    $subKetuntasan = [
                        'nama_mapel' => $row->nama_mapel,
                        'nama_guru' => $row->nama,
                        'tuntas' => $row->tuntas,
                        'deskripsi' => $row->desc,
                        'tgl_tuntas' => $row->tgl_tuntas,
                        'semester' => $row->semester,
                    ];

                    $responseKetuntasan[] = $subKetuntasan;
                }
            }

            return response()->json([
                'status' => true,
                'message' => "success",
                'data' => $query_result,
            ]);
        }

        if (Auth::user()->guru_id) {
        }

        // $page = $request->query("page");
        // $siswa_id = $request->query("siswa");
        // $semester = $request->query("semester");
        // $status = $request->query("status");

        // $guru_id = $request->query("guru");
        // $mapel_id = $request->query('mapel');
        // $tingkatan = $request->query('tingkatan');
        // $jurusan_id = $request->query('jurusan');
        // $kelas_id = $request->query('kelas');

        // if (isset($siswa_id) && $page == "ketuntasan-siswa") {
        //     $select_column = ['m.nama_mapel', 'g.nama', 'k.*'];

        //     $sql_ketuntasan = DB::table("ketuntasan as k")
        //         ->select($select_column)
        //         ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
        //         ->join('guru_mapel as gm', 'gm.guru_mapel_id', '=', 'km.guru_mapel_id')
        //         ->join('guru as g', 'g.guru_id', '=', 'gm.guru_id')
        //         ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
        //         ->where('k.tahun_ajaran_id', $this->tahun->tahun_ajaran_id)
        //         ->where('k.siswa_id', $siswa_id)
        //         ->where('k.semester', $semester);

        //     if (isset($status)) {
        //         $sql_ketuntasan->where("k.tuntas", $status);
        //     }

        //     return response()->json([
        //         'status' => "success",
        //         'data' => $sql_ketuntasan->get(),
        //     ]);
        // }

        // if (isset($guru_id) && $page == "ketuntasan-mapel") {
        //     $sql_guruMapel = DB::table("guru_mapel as gm")
        //         ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
        //         ->where('gm.guru_id', $guru_id)
        //         ->where("gm.status", 1)
        //         ->select('m.mapel_id', 'm.nama_mapel')
        //         ->get();

        //     return response()->json([
        //         'status' => "success",
        //         'data' => $sql_guruMapel,
        //     ]);
        // }

        // if (isset($guru_id) && $page == "ketuntasan-kelas") {
        //     $sql_kelas = DB::table("kelas_mapel as km")
        //         ->join('guru_mapel as gm', 'gm.guru_mapel_id', '=', 'km.guru_mapel_id')
        //         ->join('kelas as k', 'k.kelas_id', '=', 'km.kelas_id')
        //         ->join('jurusan as j', 'j.jurusan_id', '=', 'km.jurusan_id')
        //         ->where('gm.guru_id', $guru_id)
        //         ->where('gm.mapel_id', $mapel_id)
        //         ->where('km.status', 1)
        //         ->where('km.tahun_ajaran_id', $this->tahun->tahun_ajaran_id)
        //         ->select('km.tingkatan', 'km.jurusan_id', 'km.kelas_id', 'j.nama_jurusan', 'k.nama_kelas')
        //         ->get();

        //     return response()->json([
        //         'status' => "success",
        //         'data' => $sql_kelas,
        //     ]);
        // }

        // if (isset($guru_id) && $page == "ketuntasan-siswa") {
        //     $sql_ketuntasan = DB::table("ketuntasan as k")
        //         ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
        //         ->join('guru_mapel as gm', 'gm.guru_mapel_id', '=', 'km.guru_mapel_id')
        //         ->join('guru as g', 'g.guru_id', '=', 'gm.guru_id')
        //         ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
        //         ->join('siswa as s', 's.siswa_id', '=', 'k.siswa_id')
        //         ->where('k.tahun_ajaran_id', $this->tahun->tahun_ajaran_id)
        //         ->where('k.semester', $semester)
        //         ->where('km.status', 1)
        //         ->where('gm.guru_id', $guru_id)
        //         ->where('gm.mapel_id', $mapel_id)
        //         ->where('km.tingkatan', $tingkatan)
        //         ->where('km.jurusan_id', $jurusan_id)
        //         ->where('km.kelas_id', $kelas_id)
        //         ->select('k.*', 's.nama')
        //         ->get();

        //     return response()->json([
        //         'status' => "success",
        //         'data' => $sql_ketuntasan,
        //     ]);
        // }

        // if ($page == "wali-kelas") {

        //     //total mapel
        //     $sql_total_mapel = DB::table("kelas_mapel")
        //         ->select("kelas_mapel_id")
        //         ->where("tingkatan", $tingkatan)
        //         ->where('jurusan_id', $jurusan_id)
        //         ->where('kelas_id', $kelas_id)
        //         ->where("tahun_ajaran_id", $this->tahun->tahun_ajaran_id)
        //         ->where("status", 1)
        //         ->count();

        //     $sql_siswa = Siswa::with([
        //         'ketuntasan' => function ($query) {
        //             $query->where("semester", 1)
        //                 ->where("tahun_ajaran_id", $this->tahun->tahun_ajaran_id)
        //                 ->where("tuntas", 1)
        //                 ->get();
        //         },
        //         'ketuntasan2' =>
        //         function ($query) {
        //             $query->where("semester", 2)
        //                 ->where("tahun_ajaran_id", $this->tahun->tahun_ajaran_id)
        //                 ->where("tuntas", 1)
        //                 ->get();
        //         },
        //     ])
        //         ->where("tingkatan", $tingkatan)
        //         ->where("jurusan_id", $jurusan_id)
        //         ->where("kelas_id", $kelas_id)
        //         ->get();

        //     $dataResponse = [];

        //     if (!empty($sql_siswa)) {
        //         foreach ($sql_siswa as $row) {
        //             $dataResponse[] = [
        //                 'siswa_id' => $row->siswa_id,
        //                 'nama' => $row->nama,
        //                 'semester1' => count($row->ketuntasan) . " / " . $sql_total_mapel,
        //                 'semester2' => count($row->ketuntasan2) . " / " . $sql_total_mapel,
        //             ];
        //         }
        //     }

        //     return response()->json([
        //         'status' => "success",
        //         'data' => $dataResponse,
        //     ]);
        // }
    }

    public function edit(Request $request)
    {
        $ketuntasan_id = $request->query('ketuntasan');
        $sql_ketuntasan = DB::table("ketuntasan as k")
            ->join('siswa as s', 's.siswa_id', '=', 'k.siswa_id')
            ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
            ->join('guru_mapel as gm', 'gm.guru_mapel_id', '=', 'km.guru_mapel_id')
            ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
            ->where("k.ketuntasan_id", $ketuntasan_id)
            ->select('k.ketuntasan_id', 'k.tuntas', 'k.desc', 'm.nama_mapel', 's.nama')
            ->first();

        return response()->json([
            'status' => "success",
            'data' => $sql_ketuntasan,
        ]);
    }

    public function update(Request $request)
    {
        $dataUpdate['desc']  =  $request->desc ? $request->desc : null;
        $dataUpdate['tuntas'] = $request->tuntas;

        if ($request->tuntas == 0) {
            $dataUpdate['tgl_tuntas'] = null;
        }

        if ($request->tuntas == 1) {
            $dataUpdate['tgl_tuntas'] = Carbon::now();
        }

        DB::table("ketuntasan")
            ->where("ketuntasan_id", $request->ketuntasan_id)
            ->update($dataUpdate);

        $sql_ketuntasan = DB::table("ketuntasan")
            ->where("ketuntasan_id", $request->ketuntasan_id)
            ->first();

        return response()->json([
            'status' => 'success',
            'data' => $sql_ketuntasan,
        ]);
    }

    public function tuntaskan(Request $request)
    {
        $ketuntasan_id = $request->ketuntasan_id;

        foreach ($ketuntasan_id as $row) {
            DB::table("ketuntasan")
                ->where('ketuntasan_id', $row)
                ->update([
                    'tuntas' => 1,
                    'desc' => $request->desc ? $request->desc : null,
                ]);
        }

        return response()->json([
            'status' => "success",
        ]);
    }
}
