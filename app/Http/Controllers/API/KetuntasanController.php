<?php

namespace App\Http\Controllers\API;

use Carbon\Carbon;
use App\Models\Siswa;
use App\Models\TahunAjaran;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Utils;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\CssSelector\Node\FunctionNode;
use Symfony\Component\CssSelector\XPath\Extension\FunctionExtension;

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
            $mapel = $request->query("mapel");
            $kelas = $request->query("kelas");
            $semester = $request->query("semester");
            $tuntas = $request->query("tuntas");

            // munculkan data mapel yg di ajar
            if (!isset($mapel) && !isset($kelas)) {
                $sql_mapel = DB::table("guru_mapel as gm")
                    ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
                    ->where("gm.guru_id", Auth::user()->guru_id)
                    ->where('gm.status', 1)
                    ->where('m.status', 1)
                    ->get();

                $mapelResponse = [];

                if (!empty($sql_mapel)) {
                    foreach ($sql_mapel as $row) {
                        $subMapel = [
                            'mapel_id' => $row->mapel_id,
                            'nama_mapel' => $row->nama_mapel
                        ];

                        $mapelResponse[] = $subMapel;
                    }
                }

                return response()->json([
                    'status' => true,
                    'message' => "success",
                    'data' => $mapelResponse,
                ]);
            }

            //munculkan data kelas yg di ajar sesuai mapel
            if (isset($mapel) && !isset($kelas)) {
                $sql_kelasMapel = DB::table('kelas_mapel as km')
                    ->join('jurusan as j', 'j.jurusan_id', '=', 'km.jurusan_id')
                    ->join('kelas as k', 'k.kelas_id', '=', 'km.kelas_id')
                    ->join('guru_mapel as gm', 'gm.guru_mapel_id', '=', 'km.guru_mapel_id')
                    ->where('km.tahun_ajaran_id', $this->tahun->tahun_ajaran_id)
                    ->where('gm.guru_id', Auth::user()->guru_id)
                    ->where('gm.mapel_id', $mapel)
                    ->where('km.status', 1)
                    ->get();

                $responseKelasMapel = [];

                if (!empty($sql_kelasMapel)) {
                    foreach ($sql_kelasMapel as $row) {
                        $subKelasMapel = [
                            'kelas_id' => $row->kelas_id,
                            'tingkatan' => Utils::checkTingkatan($row->tingkatan),
                            'nama_kelas' => $row->nama_jurusan . " | " . $row->nama_kelas,
                        ];

                        $responseKelasMapel[] = $subKelasMapel;
                    }
                }

                return response()->json([
                    'status' => true,
                    'message' => "succes",
                    'data' => $responseKelasMapel,
                ]);
            }

            //munculkan data ketuntasan siswa
            if (isset($mapel) && isset($kelas)) {
                $select_column = ['s.nama', 'k.*'];

                $sql_ketuntasan = DB::table("ketuntasan as k")
                    ->select($select_column)
                    ->join('siswa as s', 's.siswa_id', '=', 'k.siswa_id')
                    ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
                    ->join('guru_mapel as gm', 'gm.guru_mapel_id', '=', 'km.guru_mapel_id')
                    ->where('k.tahun_ajaran_id', $this->tahun->tahun_ajaran_id)
                    ->where('k.semester', $semester)
                    ->where('km.kelas_id', $kelas)
                    ->where('gm.guru_id', Auth::user()->guru_id);

                if ($tuntas) {
                    $sql_ketuntasan->where("k.tuntas", $tuntas);
                }

                $query_result = $sql_ketuntasan->get();
                $responseKetuntasan = [];

                if (!empty($query_result)) {
                    foreach ($query_result as $row) {
                        $subKetuntasan = [
                            'id_ketuntasan' => $row->ketuntasan_id,
                            'nama_siswa' => $row->nama,
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
                    'data' => $responseKetuntasan,
                ]);
            }
        }
    }

    public function waliKelas_ketuntasan(Request $request)
    {
        $sql_checkWaliKelas = DB::table("wali_kelas")
            ->where('tahun_ajaran_id', $this->tahun->tahun_ajaran_id)
            ->where('guru_id', Auth::user()->guru_id)
            ->first();

        //total mapel
        $sql_total_mapel = DB::table("kelas_mapel")
            ->select("kelas_mapel_id")
            ->where("tingkatan", $sql_checkWaliKelas->tingkatan)
            ->where('jurusan_id', $sql_checkWaliKelas->jurusan_id)
            ->where('kelas_id', $sql_checkWaliKelas->kelas_id)
            ->where("tahun_ajaran_id", $this->tahun->tahun_ajaran_id)
            ->where("status", 1)
            ->count();

        $sql_siswa = Siswa::with([
            'ketuntasan' => function ($query) {
                $query->where("semester", 1)
                    ->where("tahun_ajaran_id", $this->tahun->tahun_ajaran_id)
                    ->where("tuntas", 1)
                    ->get();
            },
            'ketuntasan2' =>
            function ($query) {
                $query->where("semester", 2)
                    ->where("tahun_ajaran_id", $this->tahun->tahun_ajaran_id)
                    ->where("tuntas", 1)
                    ->get();
            },
        ])
            ->where("tingkatan", $sql_checkWaliKelas->tingkatan)
            ->where("jurusan_id", $sql_checkWaliKelas->jurusan_id)
            ->where("kelas_id", $sql_checkWaliKelas->kelas_id)
            ->get();

        $responseKetuntasan = [];

        if (!empty($sql_siswa)) {
            foreach ($sql_siswa as $row) {
                $responseKetuntasan[] = [
                    'siswa_id' => $row->siswa_id,
                    'nama' => $row->nama,
                    'semester1' => count($row->ketuntasan) . " / " . $sql_total_mapel,
                    'semester2' => count($row->ketuntasan2) . " / " . $sql_total_mapel,
                ];
            }
        }

        return response()->json([
            'status' => true,
            'message' => "success",
            'data' => $responseKetuntasan,
        ]);
    }

    public function detailKetuntasan(Request $request, $siswa_id)
    {
        $semester = $request->query("semester");
        $tuntas = $request->query("tuntas");

        $select_column = ['m.nama_mapel', 'g.nama', 'k.desc', 'k.tuntas', 'k.semester', 'k.tgl_tuntas', 'k.ketuntasan_id'];
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
            ->where('k.siswa_id', $siswa_id);

        if (isset($tuntas)) {
            $sql_ketuntasan->where("k.tuntas", $tuntas);
        }

        $query_result = $sql_ketuntasan->get();
        $responseKetuntasan = [];

        if (!empty($query_result)) {
            foreach ($query_result as $row) {
                $responseKetuntasan[] = [
                    'id_ketuntasan' => $row->ketuntasan_id,
                    'nama_mapel' => $row->nama_mapel,
                    'nama_guru' => $row->nama,
                    'tuntas' => $row->tuntas,
                    'deskripsi' => $row->desc,
                    'tgl_tuntas' => $row->tgl_tuntas,
                    'semester' => $row->semester,
                ];
            }
        }

        return response()->json([
            'status' => true,
            'message' => "success",
            'data' => $responseKetuntasan
        ]);
    }


    public function edit($ketuntasan_id)
    {
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

        if ($request->tuntas == 1) {
            $dataUpdate['tgl_tuntas'] = Carbon::now();
        } else {
            $dataUpdate['tgl_tuntas'] = null;
        }

        DB::table("ketuntasan")
            ->where("ketuntasan_id", $request->ketuntasan_id)
            ->update($dataUpdate);

        $sql_ketuntasan = DB::table("ketuntasan as k")
            ->join('siswa as s', 's.siswa_id', '=', 'k.siswa_id')
            ->where("k.ketuntasan_id", $request->ketuntasan_id)
            ->first();


        return response()->json([
            'status' => true,
            'message' => "success",
            'data' => [
                'ketuntasan_id' => $sql_ketuntasan->ketuntasan_id,
                'nama_siswa' => $sql_ketuntasan->nama,
                'tuntas' => $sql_ketuntasan->tuntas,
                'deskripsi' => $sql_ketuntasan->desc,
            ],
        ]);
    }

    public function tuntaskan(Request $request)
    {
        $ketuntasan_id = $request->ketuntasan_id;

        DB::table("ketuntasan")
            ->whereIn("ketuntasan_id", $ketuntasan_id)
            ->update([
                'tuntas' => 1,
                'desc' => $request->desc ? $request->desc : null,
            ]);

        return response()->json([
            'status' => true,
            'message' => "Berhasil di tuntaskan"
        ]);
    }
}
