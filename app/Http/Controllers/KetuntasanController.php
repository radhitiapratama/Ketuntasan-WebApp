<?php

namespace App\Http\Controllers;


use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Models\GuruMapel;
use App\Models\Kelas;
use App\Models\Jurusan;
use App\Models\TahunAjaran;
use App\Models\Mapel;
use App\Models\Siswa;
use App\Models\Utils;
use Barryvdh\DomPDF\Facade\Pdf;
use GuzzleHttp\RedirectMiddleware;
use Illuminate\Support\Facades\Auth;
use Psy\CodeCleaner\FunctionReturnInWriteContextPass;

class KetuntasanController extends Controller
{
    protected $tingkatans = [
        '1' => "X",
        '2' => "XI",
        '3' => "XII"
    ];

    protected $tuntases = [
        '1' => "Tuntas",
        '0' => "Belum Tuntas",
    ];

    public function index(Request $request)
    {
        $start_date = null;
        $end_date = null;

        if (auth()->guard("admin")->check() || auth()->guard("operator")->check()) {
            $tahun_ajaran = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

            $sql_batasWaktu = DB::table("batas_waktu")
                ->where('tahun_ajaran_id', $tahun_ajaran->tahun_ajaran_id)
                ->where('status', 1)
                ->first();

            $status_batasWaktu = false;

            if ($sql_batasWaktu) {
                $status_batasWaktu = true;
                $start_date = date("d/m/Y", strtotime($sql_batasWaktu->start_date));
                $end_date = date("d/m/Y", strtotime($sql_batasWaktu->end_date));
            }

            if ($request->ajax()) {

                $table = DB::table("ketuntasan as kt");

                $query = $table->select(
                    's.tingkatan',
                    's.jurusan_id',
                    's.kelas_id',
                    'j.nama_jurusan',
                    'k.nama_kelas'
                )
                    ->join("siswa as s", 's.siswa_id', '=', 'kt.siswa_id')
                    ->join('jurusan as j', 'j.jurusan_id', '=', 's.jurusan_id')
                    ->join('kelas as k', 'k.kelas_id', '=', 's.kelas_id')
                    ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'kt.kelas_mapel_id')
                    ->where("kt.tahun_ajaran_id", $tahun_ajaran->tahun_ajaran_id);


                if ($request->tingkatan != null) {
                    $query->where('s.tingkatan', $request->tingkatan);
                }

                if ($request->kelas_id != null) {
                    // [0] => jurusan_id
                    // [1] => kelas_id
                    $arr = explode("|", $request->kelas_id);

                    $query->where('s.jurusan_id', $arr[0])
                        ->where("s.kelas_id", $arr[1]);
                }

                $records = count($query->groupBy("s.tingkatan", 's.kelas_id')->get());

                $result = $query->groupBy("s.tingkatan", 's.kelas_id')
                    ->offset($request->start)
                    ->limit($request->length)
                    ->get();

                $dataResponse = [];

                if (!empty($result)) {
                    $no = $request->start;
                    foreach ($result as $row) {
                        $no++;
                        $subData['no'] = $no;


                        if ($row->tingkatan == 1) {
                            $tingkatan = "X";
                        }

                        if ($row->tingkatan == 2) {
                            $tingkatan = "XI";
                        }

                        if ($row->tingkatan == 3) {
                            $tingkatan = "XII";
                        }

                        $subData['tingkatan'] = '
                        <div class="text-center">
                            ' . $tingkatan . '
                        </div>
                        ';


                        $subData['kelas'] = $row->nama_jurusan . " | " . $row->nama_kelas;

                        $subData['settings'] = '
                        <div class="setting-icons">
                            <form action="' . url("ketuntasan/siswas") . '" method="post">
                                ' . csrf_field() . '
                                <input type="hidden" name="tingkatan" value="' . $row->tingkatan . '">
                                <input type="hidden" name="jurusan_id" value="' . $row->jurusan_id . '">
                                <input type="hidden" name="kelas_id" value="' . $row->kelas_id . '">
                                <input type="hidden" name="start_date" value="' . $start_date . '">
                                <input type="hidden" name="end_date" value="' . $end_date . '">
                                <button type="submit" class="setting-detail">
                                    <i class="ri-eye-line"></i>
                                </button>
                            </form>
                        </div>
                        ';

                        $dataResponse[] = $subData;
                    }
                }

                return response()->json([
                    'draw' => $request->draw,
                    'recordsFiltered' => $records,
                    'recordsTotal' => $records,
                    'data' => $dataResponse
                ]);
            }

            $sql_kelas = DB::table("kelas as k")
                ->select('k.kelas_id', 'k.nama_kelas', 'j.jurusan_id', 'j.nama_jurusan')
                ->join('jurusan as j', 'j.jurusan_id', '=', 'k.jurusan_id')
                ->where('k.status', 1)
                ->where('j.status', 1)
                ->get();

            $dataToView = [
                'kelases' => $sql_kelas,
                'tingkatans' => $this->tingkatans,
                'start_date' => $start_date,
                'end_date' => $end_date,
                'status_batasWaktu' => $status_batasWaktu,
            ];

            return view('pages.ketuntasan.index', $dataToView);
        }

        if (Auth::guard("siswa")->check()) {
            $tahun = TahunAjaran::select("tahun_ajaran_id")->where("user_aktif", 1)->first();
            if ($request->ajax()) {

                $table = DB::table("ketuntasan as k");

                $query = $table
                    ->select('k.*', 'm.nama_mapel', 'g.nama')
                    ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
                    ->join('siswa as s', 's.siswa_id', '=', 'k.siswa_id')
                    ->join('guru_mapel as gm', 'gm.guru_mapel_id', '=', 'km.guru_mapel_id')
                    ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
                    ->join('guru as g', 'g.guru_id', 'gm.guru_id')
                    ->where('k.siswa_id', auth()->guard("siswa")->user()->siswa_id)
                    ->where('km.status', 1)
                    ->where('km.tingkatan', Auth::guard("siswa")->user()->tingkatan)
                    ->where('km.jurusan_id', Auth::guard("siswa")->user()->jurusan_id)
                    ->where('km.kelas_id', Auth::guard("siswa")->user()->kelas_id)
                    ->where('k.tahun_ajaran_id', $tahun->tahun_ajaran_id);

                if ($request->tuntas != null) {
                    $query->where('k.tuntas', $request->tuntas);
                }

                if ($request->semester != null) {
                    $query->where('k.semester', $request->semester);
                }

                $count = $query->count();

                $result = $query->offset($request->start)
                    ->limit($request->length)
                    ->orderByRaw("m.nama_mapel ASC")
                    ->get();

                $data = [];
                if (!empty($result)) {
                    $i = $request->start;
                    foreach ($result as $row) {
                        $i++;
                        $subData = [];
                        $subData['no'] = $i;
                        $subData['mapel'] = $row->nama_mapel;
                        $subData['guru'] = $row->nama;
                        $subData['tuntas'] = '
                        <div class="text-center">
                            <span class="badge badge-danger p-2">Belum Tuntas</span>
                        </div>
                        ';

                        if ($row->tuntas == 1) {
                            $subData['tuntas'] = '
                            <div class="text-center">
                                <span class="badge badge-success p-2">Tuntas</span>
                            </div>
                            ';
                        }

                        $subData['desc'] = $row->desc ? $row->desc : "-";
                        $subData['tgl_tuntas'] = $row->tgl_tuntas ? $row->tgl_tuntas : "-";
                        $subData['semester'] = '
                        <div class="text-center">
                        ' . $row->semester . '
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

            $sql_batasWaktu = DB::table("batas_waktu")
                ->where('tahun_ajaran_id', $tahun->tahun_ajaran_id)
                ->where('status', 1)
                ->first();

            $status_batasWaktu = false;

            if ($sql_batasWaktu) {
                $status_batasWaktu = true;
                $start_date = date("d/m/Y", strtotime($sql_batasWaktu->start_date));
                $end_date = date("d/m/Y", strtotime($sql_batasWaktu->end_date));
            }


            $dataToView = [
                'start_date' => $start_date,
                'end_date' => $end_date,
                'status_batasWaktu' => $status_batasWaktu,
            ];

            return view("pages.ketuntasan.index", $dataToView);
        }

        if (Auth::guard("guru")->check()) {
            $tahun = TahunAjaran::where("user_aktif", 1)->first();

            $sql_batasWaktu = DB::table("batas_waktu")
                ->where('tahun_ajaran_id', $tahun->tahun_ajaran_id)
                ->where('status', 1)
                ->first();

            $status_batasWaktu = false;

            if ($sql_batasWaktu) {
                $status_batasWaktu = true;
                $start_date = date("d/m/Y", strtotime($sql_batasWaktu->start_date));
                $end_date = date("d/m/Y", strtotime($sql_batasWaktu->end_date));
            }

            if ($request->ajax()) {
                $table = GuruMapel::with('mapel');

                $query = $table
                    ->where('guru_id', auth()->guard("guru")->user()->guru_id)
                    ->where('status', 1);

                $result = $query->get();

                $dataResponse = [];

                if (!empty($result)) {
                    $i = 0;
                    foreach ($result as $row) {
                        $i++;
                        $subData['no'] = $i;
                        $subData['mapel'] = $row->mapel->nama_mapel;

                        if ($status_batasWaktu) {
                            $subData['settings'] = '
                            <div class="setting-icons">
                                <form action="' . url("guru/ketuntasan/kelas") . '" method="post">
                                ' . csrf_field() . '
                                    <input type="hidden" name="mapel_id" value="' . $row->mapel_id . '">
                                    <input type="hidden" name="start_date" value="' . $start_date . '">
                                    <input type="hidden" name="end_date" value="' . $end_date . '">
                                    <button type="submit" class="setting-detail">
                                        <i class="ri-eye-line"></i>
                                    </button>
                                </form>
                            </div>
                            ';
                        } else {
                            $subData['settings'] = '
                            <div class="setting-icons">
                                <button type="submit" class="setting-detail" disabled>
                                    <i class="ri-eye-line"></i>
                                </button>
                            </div>
                            ';
                        }


                        $dataResponse[] = $subData;
                    }
                }

                return response()->json([
                    'draw' => $request->draw,
                    'recordsFiltered' => 0,
                    'recordsTotal' => 0,
                    'data' => $dataResponse,
                ]);
            }

            $dataToView =  [
                'start_date' => $start_date,
                'end_date' => $end_date,
                'status_batasWaktu' => $status_batasWaktu,
            ];

            return view("pages.ketuntasan.guru.index", $dataToView);
        }
    }

    public function add()
    {
        $sql_kelas = Kelas::with([
            'jurusan' => function ($query) {
                $query->select("jurusan_id", 'nama_jurusan')
                    ->where("status", 1);
            }
        ])
            ->where("status", 1)
            ->get();

        $dataToView = [
            'kelases' => $sql_kelas,
            'tingkatans' => $this->tingkatans,
        ];

        return view("pages.ketuntasan.add", $dataToView);
    }

    public function store(Request $request)
    {
        $tahun_ajaran  = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();
        $sql_batasWaktu = DB::table("batas_waktu")
            ->select("batas_waktu_id")
            ->where("status", 1)
            ->where("tahun_ajaran_id", $tahun_ajaran->tahun_ajaran_id)
            ->first();

        if (empty($sql_batasWaktu)) {
            return response()->json([
                'message' => 'empty_batasWaktu'
            ]);
        }

        $tingkatan_id = $request->tingkatan_id;
        $semester = $request->semester;

        // [0] => jurusan_id
        // [1] => kelas_id
        $kelasArr = explode("|", $request->kelas_id);

        $sql_mapel = DB::table('kelas_mapel')
            ->select('kelas_mapel_id')
            ->where('tingkatan', $tingkatan_id)
            ->where('jurusan_id', $kelasArr[0])
            ->where('kelas_id', $kelasArr[1])
            ->where('tahun_ajaran_id', $tahun_ajaran->tahun_ajaran_id)
            ->get();

        if (count($sql_mapel) <= 0) {
            $dataResponse = [
                'message' => "empty_mapel",
            ];

            return response()->json($dataResponse);
        }

        $sql_siswa = DB::table("siswa")
            ->select('siswa_id')
            ->where('tingkatan', $tingkatan_id)
            ->where('jurusan_id', $kelasArr[0])
            ->where('kelas_id', $kelasArr[1])
            ->where('status', 1)
            ->where('role', 3)
            ->get();

        if (count($sql_siswa) <= 0) {
            $dataResponse = [
                'message' => "empty_siswa",
            ];

            return response()->json($dataResponse);
        }

        $sql_siswaKetuntasan = DB::table("ketuntasan as k")
            ->select('k.siswa_id')
            ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
            ->where("km.tingkatan", $tingkatan_id)
            ->where("km.jurusan_id", $kelasArr[0])
            ->where("km.kelas_id", $kelasArr[1])
            ->where("k.tahun_ajaran_id", $tahun_ajaran->tahun_ajaran_id)
            ->where("k.semester", $semester)
            ->get()->toArray();

        $arr_siswaKetuntasan = array_column($sql_siswaKetuntasan, "siswa_id");

        $data_ketuntasan = [];

        DB::beginTransaction();
        foreach ($sql_siswa as $siswa) {
            foreach ($sql_mapel as $mapel) {

                // check duplicate ketuntasan
                $sql_check = in_array($siswa->siswa_id, $arr_siswaKetuntasan);

                if ($sql_check) {
                    continue;
                }

                if (auth()->guard("operator")->check()) {
                    $created_by = auth()->guard("operator")->user()->user_id;
                }

                if (auth()->guard("admin")->check()) {
                    $created_by = auth()->guard("admin")->user()->user_id;
                }


                $data_ketuntasan[] = [
                    'siswa_id' => $siswa->siswa_id,
                    'kelas_mapel_id' => $mapel->kelas_mapel_id,
                    'desc' => null,
                    'tgl_tuntas' => null,
                    'tahun_ajaran_id' => $tahun_ajaran->tahun_ajaran_id,
                    'semester' => $semester,
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now(),
                    'created_by' => $created_by
                ];
            }
        }

        DB::table("ketuntasan")
            ->insert($data_ketuntasan);

        DB::commit();

        $dataResponse = [
            'message' => "success",
        ];

        return response()->json($dataResponse);
    }


    public function edit(Request $request)
    {
        $tingkatan = $request->tingkatan;
        $jurusan_id = $request->jurusan_id;
        $kelas_id = $request->kelas_id;
        $siswa_id = $request->siswa_id;
        $ketuntasan_id = $request->ketuntasan_id;

        if (!isset($tingkatan) || !isset($jurusan_id) || !isset($kelas_id) || !isset($siswa_id) || !isset($ketuntasan_id)) {
            return redirect()->back();
        }

        if ($request->isMethod("GET")) {
            return redirect('ketuntasan');
        }

        $tahun = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

        $sql_ketuntasan = DB::table("ketuntasan as k")
            ->select('s.nama', 'k.*')
            ->join("siswa as s", 's.siswa_id', '=', 'k.siswa_id')
            ->where('k.ketuntasan_id', $ketuntasan_id)
            ->where("k.tahun_ajaran_id", $tahun->tahun_ajaran_id)
            ->first();

        if (empty($sql_ketuntasan)) {
            return redirect()->back();
        }

        $sql_batasWaktu = DB::table("batas_waktu")
            ->select('start_date', 'end_date')
            ->where("status", 1)
            ->where("tahun_ajaran_id", $tahun->tahun_ajaran_id)
            ->first();

        $status_batasWaktu = "dalamBatasWaktu";

        if (date("Y-m-d H:i:s") < $sql_batasWaktu->start_date . " 00:00:00") {
            $status_batasWaktu = "kurang";
        } elseif (date("Y-m-d H:i:s") > $sql_batasWaktu->end_date . " 23:59:59") {
            $status_batasWaktu = "lebih";
        }

        $dataToView = [
            'tingkatan' => $tingkatan,
            'jurusan_id' => $jurusan_id,
            'kelas_id' => $kelas_id,
            'siswa_id' => $siswa_id,
            'tuntases' => $this->tuntases,
            'ketuntasan' => $sql_ketuntasan,
            'ketuntasan_id' => $ketuntasan_id,
            'status_batasWaktu' => $status_batasWaktu,
        ];

        return view("pages.ketuntasan.edit", $dataToView);
    }

    public function update(Request $request)
    {
        $dataUpdate = [];

        $dataUpdate['desc'] = $request->deskripsi ? $request->deskripsi : null;
        $dataUpdate['tgl_tuntas'] = Carbon::now();

        if ($request->tuntas == 0) {
            $dataUpdate['tgl_tuntas'] = null;
            $dataUpdate['desc'] = null;
        }

        $dataUpdate['tuntas'] = $request->tuntas;

        DB::table("ketuntasan")
            ->where('ketuntasan_id', $request->ketuntasan_id)
            ->update($dataUpdate);

        $sql_ketuntasan = DB::table("ketuntasan")
            ->where('ketuntasan_id', $request->ketuntasan_id)
            ->first();

        return response()->json([
            'message' => "success",
            'ketuntasan' => $sql_ketuntasan,
        ]);
    }

    // Ketuntasan Siswa
    public function siswa(Request $request)
    {
        $tingkatan = $request->tingkatan;
        $jurusan_id = $request->jurusan_id;
        $kelas_id = $request->kelas_id;
        $start_date = $request->start_date;
        $end_date = $request->end_date;

        if ($request->isMethod("GET")) {

            if ($request->ajax()) {
                global $tahun;
                $tahun = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

                $sql_batasWaktu = DB::table("batas_waktu")
                    ->where('tahun_ajaran_id', $tahun->tahun_ajaran_id)
                    ->where('status', 1)
                    ->first();

                if ($sql_batasWaktu) {
                    $start_date = date("d/m/Y", strtotime($sql_batasWaktu->start_date));
                    $end_date = date("d/m/Y", strtotime($sql_batasWaktu->end_date));
                }


                $columnsSearch = ['username', 'nama'];

                //total mapel
                $sql_total_mapel = DB::table('kelas_mapel')
                    ->select('kelas_mapel_id')
                    ->where('tingkatan', $tingkatan)
                    ->where('jurusan_id', $jurusan_id)
                    ->where('kelas_id', $kelas_id)
                    ->where('tahun_ajaran_id', $tahun->tahun_ajaran_id)
                    ->where('status', 1)
                    ->count();

                $sql_mapelTuntas = Siswa::with([
                    'ketuntasan' => function ($q) {
                        $q->join("kelas_mapel", 'kelas_mapel.kelas_mapel_id', '=', 'ketuntasan.kelas_mapel_id')
                            ->where("kelas_mapel.status", 1)
                            ->where("ketuntasan.tuntas", 1)
                            ->where("ketuntasan.tahun_ajaran_id", $GLOBALS['tahun']->tahun_ajaran_id)
                            ->where("ketuntasan.semester", 1)
                            ->get();
                    },
                    'ketuntasan2' => function ($q) {
                        $q->join("kelas_mapel", 'kelas_mapel.kelas_mapel_id', '=', 'ketuntasan.kelas_mapel_id')
                            ->where("ketuntasan.tuntas", 1)
                            ->where("ketuntasan.tahun_ajaran_id", $GLOBALS['tahun']->tahun_ajaran_id)
                            ->where("ketuntasan.semester", 2)
                            ->get();
                    }
                ])
                    ->where('status', 1)
                    ->where('tingkatan', $tingkatan)
                    ->where('jurusan_id', $jurusan_id)
                    ->where('kelas_id', $kelas_id);

                if ($request->input("search.value")) {
                    $sql_mapelTuntas->where(function ($q) use ($columnsSearch, $request) {
                        foreach ($columnsSearch as $column) {
                            $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                        }
                    });
                }

                $records = $sql_mapelTuntas->count();

                $result = $sql_mapelTuntas->offset($request->start)->limit($request->length)->get();

                $dataResponse = [];

                if (!empty($result)) {
                    $no = $request->start;
                    foreach ($result as $row) {
                        $no++;
                        $subData['no'] = $no;
                        $subData['nama'] = $row->nama;

                        $subData['semester1'] = '
                        <div class="text-center">
                            ' . count($row->ketuntasan) . " / " . $sql_total_mapel . '
                        </div>
                        ';

                        $subData['semester2'] = '
                        <div class="text-center">
                            ' . count($row->ketuntasan2) . " / " . $sql_total_mapel . '
                        </div>
                        ';

                        $subData['settings'] = '
                        <div class="setting-icons">
                            <form action="' . url("ketuntasan/siswas/show") . '" method="post">
                            ' . csrf_field() . '
                                <input type="hidden" name="tingkatan" value="' . $tingkatan . '">
                                <input type="hidden" name="jurusan_id" value="' . $jurusan_id . '">
                                <input type="hidden" name="kelas_id" value="' . $kelas_id . '">
                                <input type="hidden" name="siswa_id" value="' . $row->siswa_id . '">
                                <input type="hidden" name="start_date" value="' . $start_date . '">
                                <input type="hidden" name="end_date" value="' . $end_date . '">
                                <button type="submit" class="setting-detail">
                                    <i class="ri-eye-line"></i>
                                </button>
                            </form>
                        </div>
                        ';

                        $dataResponse[] = $subData;
                    }
                }

                return response()->json([
                    'draw' => $request->draw,
                    'recordsFiltered' => $records,
                    'recordsTotal' => $records,
                    'data' => $dataResponse,
                ]);
            }

            return redirect('ketuntasan');
        }

        if (!isset($tingkatan) || !isset($jurusan_id) || !isset($kelas_id)) {
            return redirect()->back();
        }

        $sql_kelas = Kelas::select("nama_kelas")->where("kelas_id", $kelas_id)->first();
        $sql_jurusan = Jurusan::select("nama_jurusan")->where("jurusan_id", $jurusan_id)->first();

        $dataToView = [
            'tingkatan' => $tingkatan,
            'jurusan' => $sql_jurusan,
            'kelas' => $sql_kelas,
            'tingkatan' => $tingkatan,
            'jurusan_id' => $jurusan_id,
            'kelas_id' => $kelas_id,
            'start_date' => $start_date,
            'end_date' => $end_date,
        ];

        return view('pages.ketuntasan.siswa', $dataToView);
    }

    public function siswa_show(Request $request)
    {
        $tingkatan = $request->tingkatan;
        $jurusan_id = $request->jurusan_id;
        $kelas_id = $request->kelas_id;
        $siswa_id = $request->siswa_id;

        $start_date = null;
        $end_date = null;

        $tahun = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

        $sql_batasWaktu = DB::table("batas_waktu")
            ->where('tahun_ajaran_id', $tahun->tahun_ajaran_id)
            ->where('status', 1)
            ->first();

        if ($sql_batasWaktu) {
            $start_date = date("d/m/Y", strtotime($sql_batasWaktu->start_date));
            $end_date = date("d/m/Y", strtotime($sql_batasWaktu->end_date));
        }

        if ($request->isMethod("GET")) {
            if ($request->ajax()) {
                $columnsSearch = ["m.nama_mapel", "s.nama"];
                $table = DB::table("ketuntasan as k");

                $query = $table->select(
                    'k.*',
                    'm.nama_mapel',
                    'g.nama',
                )
                    ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
                    ->join("guru_mapel as gm", 'gm.guru_mapel_id', '=', 'km.guru_mapel_id')
                    ->join('guru as g', 'g.guru_id', '=', 'gm.guru_id')
                    ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
                    ->join('siswa as s', 's.siswa_id', '=', 'k.siswa_id')
                    ->where("k.siswa_id", $siswa_id)
                    ->where('k.semester', $request->semester)
                    ->where("km.status", 1)
                    ->where('km.tingkatan', $tingkatan)
                    ->where('km.jurusan_id', $jurusan_id)
                    ->where('km.kelas_id', $kelas_id)
                    ->where('k.tahun_ajaran_id', $tahun->tahun_ajaran_id);

                if ($request->input("search.value")) {
                    $table->where(function ($q) use ($columnsSearch, $request) {
                        foreach ($columnsSearch as $column) {
                            $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                        }
                    });
                }

                if (isset($request->status)) {
                    $table->where('k.tuntas', $request->status);
                }

                $result = $query->get();

                $dataResponse = [];

                if (!empty($result)) {
                    $i = 0;
                    foreach ($result as $row) {
                        $i++;
                        $subData['no'] = $i;
                        $subData['checkbox'] = '
                            <div class="text-center">
                                <input type="checkbox" name="ketuntasan_id[]" id="ketuntasan_id" value="' . $row->ketuntasan_id . '">
                            </div>
                            ';
                        $subData['mapel'] = $row->nama_mapel;
                        $subData['guru'] = $row->nama;
                        $subData['tuntas'] = '
                        <div class="text-center">
                            <span class="badge badge-danger p-2">Belum Tuntas</span>
                        </div>
                        ';

                        if ($row->tuntas == 1) {
                            $subData['tuntas'] = '
                                <div class="text-center">
                                    <span class="badge badge-success p-2">Tuntas</span>
                                </div>
                                ';
                            $subData['checkbox'] = "";
                        }

                        $subData['desc'] = $row->desc ? $row->desc : "-";
                        $subData['tgl_tuntas'] = $row->tgl_tuntas ? $row->tgl_tuntas : "-";
                        $subData['semester'] = '
                        <div class="text-center">
                            ' . $row->semester . '
                        </div>
                        ';

                        $subData['settings'] = '
                        <div class="setting-icons">
                            <form action="' . url("ketuntasan/siswas/edit") . '" method="post">
                            ' . csrf_field() . '
                                <input type="hidden" name="tingkatan" value="' . $tingkatan . '">
                                <input type="hidden" name="jurusan_id" value="' . $jurusan_id . '">
                                <input type="hidden" name="kelas_id" value="' . $kelas_id . '">
                                <input type="hidden" name="siswa_id" value="' . $siswa_id . '">
                                <input type="hidden" name="ketuntasan_id" value="' . $row->ketuntasan_id . '">
                                <input type="hidden" name="start_date" value="' . $start_date . '">
                                <input type="hidden" name="end_date" value="' . $end_date . '">
                                <button type="submit" class="setting-edit">
                                    <i class="ri-pencil-line"></i>
                                </button>
                            </form>
                        </div>
                        ';

                        $dataResponse[] = $subData;
                    }
                }

                return response()->json([
                    'draw' => $request->draw,
                    'recordsFilterd' => 0,
                    'recordsTotal' => 0,
                    'data' => $dataResponse,
                ]);
            }

            return redirect('ketuntasan');
        }

        if (!isset($tingkatan) || !isset($jurusan_id) || !isset($kelas_id) || !isset($siswa_id)) {
            return redirect()->back();
        }

        // detail data siswa
        $sql_siswa = DB::table("siswa")
            ->select('nama')
            ->where("siswa_id", $siswa_id)
            ->first();

        $sql_batasWaktu = DB::table("batas_waktu")
            ->select('start_date', 'end_date')
            ->where("status", 1)
            ->where("tahun_ajaran_id", $tahun->tahun_ajaran_id)
            ->first();

        $status_batasWaktu = "dalam";

        if ($sql_batasWaktu) {
            if (date("Y-m-d H:i:s") < $sql_batasWaktu->start_date . " 00:00:00") {
                $status_batasWaktu = "kurang";
            } elseif (date("Y-m-d H:i:s") > $sql_batasWaktu->end_date . " 23:59:59") {
                $status_batasWaktu = "lebih";
            }
        } else {
            $status_batasWaktu  = "tidakAda";
        }

        $dataToView = [
            'tingkatan' => $tingkatan,
            'jurusan_id' => $jurusan_id,
            'kelas_id' => $kelas_id,
            'siswa_id' => $siswa_id,
            'siswa' => $sql_siswa,
            'status_batasWaktu' => $status_batasWaktu,
            'start_date' => $start_date,
            'end_date' => $end_date,
            'tuntases' => $this->tuntases,
        ];

        return view("pages.ketuntasan.detail", $dataToView);
    }

    public function guru_kelas(Request $request)
    {
        $mapel_id = $request->mapel_id;
        $start_date = $request->start_date;
        $end_date = $request->end_date;

        if (!isset($mapel_id)) {
            return redirect('ketuntasan');
        }

        if ($request->isMethod("GET")) {
            if ($request->ajax()) {
                $columnsSearch = ['j.nama_jurusan', 'k.nama_kelas'];

                $tahun = TahunAjaran::select("tahun_ajaran_id")->where("user_aktif", 1)->first();
                $batasWaktu = DB::table("batas_waktu")
                    ->where("status", 1)
                    ->where('tahun_ajaran_id', $tahun->tahun_ajaran_id)
                    ->first();

                $table = DB::table("kelas_mapel as km");

                if ($request->input("search.value")) {
                    $table->where(function ($q) use ($columnsSearch, $request) {
                        foreach ($columnsSearch as $column) {
                            $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                        }
                    });
                }

                $query = $table->select("km.tingkatan", 'j.nama_jurusan', 'j.jurusan_id', 'k.kelas_id', 'k.nama_kelas')
                    ->join('jurusan as j', 'j.jurusan_id', '=', 'km.jurusan_id')
                    ->join('kelas as k', 'k.kelas_id', '=', 'km.kelas_id')
                    ->join('guru_mapel as gm', 'gm.guru_mapel_id', '=', 'km.guru_mapel_id')
                    ->where('gm.mapel_id', $mapel_id)
                    ->where('gm.guru_id', auth()->guard("guru")->user()->guru_id)
                    ->where('km.tahun_ajaran_id', $tahun->tahun_ajaran_id)
                    ->where("km.status", 1)
                    ->get();

                $dataResponse = [];

                if (!empty($query)) {
                    $start_date = date("d/m/Y", strtotime($batasWaktu->start_date));
                    $end_date = date("d/m/Y", strtotime($batasWaktu->end_date));

                    $i = 0;
                    foreach ($query as $row) {
                        $i++;
                        $subData['no'] = $i;

                        if ($row->tingkatan == 1) {
                            $tingkatan = "X";
                        }
                        if ($row->tingkatan == 2) {
                            $tingkatan = "XI";
                        }
                        if ($row->tingkatan == 3) {
                            $tingkatan = "XII";
                        }

                        $subData['tingkatan'] = '
                        <div class="text-center">
                            ' . $tingkatan . '
                        </div>
                        ';

                        $subData['kelas'] = $row->nama_jurusan . " | " . $row->nama_kelas;

                        if ($batasWaktu) {
                            $subData['settings'] = '
                            <div class="setting-icons">
                                <form action="' . url("guru/ketuntasan/kelas/siswa") . '" method="post">
                                ' . csrf_field() . '
                                    <input type="hidden" name="mapel_id" value="' . $mapel_id . '">
                                    <input type="hidden" name="tingkatan" value="' . $row->tingkatan . '">
                                    <input type="hidden" name="jurusan_id" value="' . $row->jurusan_id . '">
                                    <input type="hidden" name="kelas_id" value="' . $row->kelas_id . '">
                                    <input type="hidden" name="start_date" value="' . $start_date  . '">
                                    <input type="hidden" name="end_date" value="' . $end_date . '">
                                    <button type="submit" class="setting-detail">
                                        <i class="ri-eye-line"></i>
                                    </button>
                                </form>
                            </div>
                            ';
                        } else {
                            $subData['settings'] = '
                            <span class="badge badge-danger p-2">Batas Waktu belum di tambahkan</span>
                            ';
                        }



                        $dataResponse[] = $subData;
                    }
                }

                return response()->json([
                    'draw' => $request->draw,
                    'recordsFilterd' => 0,
                    'recordsTotal' => 0,
                    'data' => $dataResponse,
                ]);
            }
        }

        $sql_mapel = DB::table("mapel")->select("nama_mapel")->where("mapel_id", $mapel_id)->first();

        $dataToView = [
            'mapel' => $sql_mapel,
            'mapel_id' => $mapel_id,
            'start_date' => $start_date,
            'end_date' => $end_date,
        ];

        return view("pages.ketuntasan.guru.kelas", $dataToView);
    }

    public function guru_siswa(Request $request)
    {
        $mapel_id = $request->mapel_id;
        $tingkatan = $request->tingkatan;
        $jurusan_id = $request->jurusan_id;
        $kelas_id = $request->kelas_id;

        $tahun = TahunAjaran::select("tahun_ajaran_id")->where("user_aktif", 1)->first();
        $start_date = null;
        $end_date = null;

        $sql_batasWaktu = DB::table("batas_waktu")
            ->where('tahun_ajaran_id', $tahun->tahun_ajaran_id)
            ->where('status', 1)
            ->first();


        if ($sql_batasWaktu) {
            $start_date = date("d/m/Y", strtotime($sql_batasWaktu->start_date));
            $end_date = date("d/m/Y", strtotime($sql_batasWaktu->end_date));
        }


        if (!isset($mapel_id) || !isset($tingkatan) || !isset($jurusan_id) || !isset($kelas_id)) {
            return redirect('ketuntasan');
        }

        if ($request->isMethod("GET")) {
            if ($request->ajax()) {
                $columnsSearch = ['s.nama', 's.username'];

                $table = DB::table("ketuntasan as k");

                $query = $table
                    ->select('k.*', 's.nama')
                    ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
                    ->join('guru_mapel as gm', 'gm.guru_mapel_id', '=', 'km.guru_mapel_id')
                    ->join('siswa as s', 's.siswa_id', '=', 'k.siswa_id')
                    ->where("gm.guru_id", auth()->guard('guru')->user()->guru_id)
                    ->where("gm.mapel_id", $mapel_id)
                    ->where("k.tahun_ajaran_id", $tahun->tahun_ajaran_id)
                    ->where('s.tingkatan', $tingkatan)
                    ->where('s.jurusan_id', $jurusan_id)
                    ->where('s.kelas_id', $kelas_id);

                if ($request->semester != null) {
                    $query->where('k.semester', $request->semester);
                }

                if ($request->status != null) {
                    $query->where('k.tuntas', $request->status);
                }

                if ($request->input("search.value")) {
                    $query->where(function ($q) use ($columnsSearch, $request) {
                        foreach ($columnsSearch as $column) {
                            $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                        }
                    });
                }

                $result = $query->orderBy('s.nama', 'ASC')->get();

                $dataResponse = [];

                if (!empty($result)) {
                    $i = 0;
                    foreach ($result as $row) {
                        $i++;
                        $subData['no'] = $i;
                        $subData['checkbox'] = "";
                        $subData['siswa'] = $row->nama;

                        $subData['status'] = '
                        <div class="text-center">
                            <span class="badge badge-success p-2">Tuntas</span>
                        </div>
                        ';

                        if ($row->tuntas == 0) {
                            $subData['status'] = '
                            <div class="text-center">
                                <span class="badge badge-danger p-2">Belum Tuntas</span>
                            </div>
                            ';

                            $subData['checkbox'] = '
                            <div class="text-center">
                                <input type="checkbox" name="ketuntasan_id[]" id="ketuntasan_id"
                                value="' . $row->ketuntasan_id . '">
                            </div>';
                        }

                        $subData['desc'] = $row->desc ? $row->desc : "-";
                        $subData['tgl_tuntas'] = $row->tgl_tuntas ? $row->tgl_tuntas : "-";
                        $subData['semester'] =  '
                        <div class="text-center">
                        ' . $row->semester . '
                        </div>
                        ';

                        $subData['settings'] = '
                        <div class="setting-icons">
                            <form action="' . url("guru/ketuntasan/kelas/siswa/edit") . '" method="post">
                            ' . csrf_field() . '
                                <input type="hidden" name="mapel_id" value="' . $mapel_id . '">
                                <input type="hidden" name="tingkatan" value="' . $tingkatan . '">
                                <input type="hidden" name="jurusan_id" value="' . $jurusan_id . '">
                                <input type="hidden" name="kelas_id" value="' . $kelas_id . '">
                                <input type="hidden" name="ketuntasan_id" value="' . $row->ketuntasan_id . '">
                                <button type="submit" class="setting-edit">
                                <i class="ri-pencil-line"></i>
                                </button>
                            </form>
                        </div>
                        ';

                        $dataResponse[] = $subData;
                    }
                }

                return response()->json([
                    'draw' => $request->draw,
                    'recordsFiltered' => 0,
                    'recordsTotal' => 0,
                    'data' => $dataResponse,
                ]);
            }
        }

        $tahun = TahunAjaran::select("tahun_ajaran_id")->where("user_aktif", 1)->first();

        $status = "true";

        if (date("Y-m-d H:i:s") < $sql_batasWaktu->start_date . " 00:00:00") {
            $status = "belum";
        }

        if (date("Y-m-d H:i:s") > $sql_batasWaktu->end_date . " 23:59:59") {
            $status = "lewat";
        }

        $sql_jurusan = DB::table("jurusan")->select('nama_jurusan')->where('jurusan_id', $jurusan_id)->first();
        $sql_kelas = DB::table("kelas")->select('nama_kelas')->where('kelas_id', $kelas_id)->first();

        if (!isset($tingkatan) || !isset($jurusan_id) || !isset($kelas_id) || empty($sql_jurusan) || empty($sql_kelas)) {
            return redirect()->back();
        }

        $dataToView = [
            'mapel_id' => $mapel_id,
            'tingkatan' => $tingkatan,
            'jurusan_id' => $jurusan_id,
            'kelas_id' => $kelas_id,
            'nama_jurusan' => $sql_jurusan->nama_jurusan,
            'nama_kelas' => $sql_kelas->nama_kelas,
            'tuntases' => $this->tuntases,
            'status' => $status,
            'start_date' => $start_date,
            'end_date' => $end_date,
        ];

        return view("pages.ketuntasan.guru.siswa", $dataToView);
    }

    // guru edit ketuntasan siswa
    public function guru_edit(Request $request)
    {

        $mapel_id = $request->mapel_id;
        $tingkatan = $request->tingkatan;
        $jurusan_id = $request->jurusan_id;
        $kelas_id = $request->kelas_id;
        $ketuntasan_id = $request->ketuntasan_id;
        $start_date = $request->start_date;
        $end_date = $request->end_date;

        if (!isset($mapel_id) || !isset($tingkatan) || !isset($jurusan_id) || !isset($kelas_id) || !isset($ketuntasan_id)) {
            return redirect('/ketuntasan');
        }

        $sql_ketuntasan = DB::table("ketuntasan as k")
            ->select('k.*', 's.nama', 'gm.mapel_id', 's.tingkatan', 's.jurusan_id', 's.kelas_id')
            ->join('siswa as s', 's.siswa_id', '=', 'k.siswa_id')
            ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
            ->join('guru_mapel as gm', 'gm.guru_mapel_id', '=', 'km.guru_mapel_id')
            ->where('ketuntasan_id', $ketuntasan_id)
            ->first();

        if (empty($sql_ketuntasan)) {
            return redirect('ketuntasan');
        }

        $sql_mapel = Mapel::select("nama_mapel")->where("mapel_id", $mapel_id)->first();

        $tahun = TahunAjaran::select("tahun_ajaran_id")
            ->where("user_aktif", 1)
            ->first();

        $sql_batasWaktu = DB::table("batas_waktu")
            ->select('start_date', 'end_date')
            ->where("status", 1)
            ->where("tahun_ajaran_id", $tahun->tahun_ajaran_id)
            ->first();

        $status_batasWaktu = "dalamBatasWaktu";

        if (date("Y-m-d H:i:s") < $sql_batasWaktu->start_date . " 00:00:00") {
            $status_batasWaktu = "kurang";
        } elseif (date("Y-m-d H:i:s") > $sql_batasWaktu->end_date . " 23:59:59") {
            $status_batasWaktu = "lebih";
        }

        $dataToView = [
            'mapel_id' => $mapel_id,
            'tingkatan' => $tingkatan,
            'jurusan_id' => $jurusan_id,
            'kelas_id' => $kelas_id,
            'tuntases' => $this->tuntases,
            'ketuntasan' => $sql_ketuntasan,
            'mapel' => $sql_mapel,
            'status_batasWaktu' => $status_batasWaktu,
            'start_date' => $start_date,
            'end_date' => $end_date
        ];

        return view('pages.ketuntasan.guru.edit', $dataToView);
    }

    public function tuntaskanSiswa(Request $request)
    {
        $tahun = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();
        $batasWaktu = DB::table("batas_waktu")
            ->where('tahun_ajaran_id', $tahun->tahun_ajaran_id)
            ->where("status", 1)
            ->first();

        $today = date("Y-m-d H:i:s");
        $status_insert = "dalam";

        if ($today < $batasWaktu->start_date) {
            $status_insert = "kurang";
        }

        if ($today > $batasWaktu->end_date) {
            $status_insert = "lebih";
        }

        if ($status_insert == "kurang") {
            $dataResponse = [
                'message' => 'kurang'
            ];

            return response()->json($dataResponse);
        }

        if ($status_insert == "lebih") {
            $dataResponse = [
                'message' => "lebih"
            ];

            return response()->json($dataResponse);
        }

        if ($status_insert == "dalam") {
            $ketuntasan_id = $request->ketuntasan_id;
            $desc = $request->desc ? $request->desc : null;

            for ($i = 0; $i < count($ketuntasan_id); $i++) {
                DB::table("ketuntasan")
                    ->where("ketuntasan_id", $ketuntasan_id[$i])
                    ->update([
                        'desc' => $desc,
                        'tuntas' => 1,
                        'tgl_tuntas' => Carbon::now(),
                    ]);
            }

            $dataResponse = [
                'message' => "success",
            ];

            return response()->json($dataResponse);
        }
    }

    public function byGuru(Request $request)
    {
        if ($request->ajax()) {
            $columnsSearch = ['nama', 'username'];
            $table = DB::table("guru");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            $query = $table->where('status', 1);

            $count = $query->count();

            $result = $query->offset($request->start)
                ->limit($request->length)
                ->orderBy('guru_id', 'ASC')
                ->orderBy('nama', 'ASC')
                ->get();

            $data = [];

            if (!empty($result)) {
                $i = $request->start;
                foreach ($result as $row) {
                    $i++;
                    $subData = [];
                    $subData['no'] = $i;
                    $subData['username'] = $row->username;
                    $subData['nama'] = $row->nama;

                    $subData['aksi'] = '
                    <div class="text-center">
                        <a href="/ketuntasan/by-guru/' . $row->guru_id . '" class="badge badge-success p-2">
                            <i class="ri-eye-line"></i>
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

        $sql_guru = DB::table("guru")
            ->where('status', 1)
            ->get();

        $dataToView = [
            'gurus' => $sql_guru,
        ];

        return view("pages.ketuntasan.byGuru.index", $dataToView);
    }

    public function byGuruMapel($guru_id)
    {
        if (!isset($guru_id)) {
            return redirect("ketuntasan/by-guru");
        }

        $sql_guru = DB::table("guru")
            ->where('guru_id', $guru_id)
            ->first();

        $sql_guru_kelas_mapel = DB::table("guru as g")
            ->join('guru_mapel as gm', 'gm.guru_id', '=', 'g.guru_id')
            ->join('kelas_mapel as km', 'km.guru_mapel_id', '=', 'gm.guru_mapel_id')
            ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
            ->join('kelas as k', 'k.kelas_id', '=', 'km.kelas_id')
            ->join('jurusan as j', 'j.jurusan_id', '=', 'k.jurusan_id')
            ->where("g.guru_id", $guru_id)
            ->where('gm.status', 1)
            ->get();

        $dataToView = [
            'guruKelasMapels' => $sql_guru_kelas_mapel,
            'guru_id' => $guru_id,
            'data_guru' => $sql_guru,
        ];

        return view("pages.ketuntasan.byGuru.guru_mapel", $dataToView);
    }

    public function byGuruKetuntasan(Request $request, $guru_id, $mapel_id, $tingkatan, $kelas_id)
    {
        if ($request->ajax()) {
            $columnsSearch = ['s.nama'];

            $table = DB::table("ketuntasan as k");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            $query = $table->select('k.*', 's.nama', 's.tingkatan')
                ->join('siswa as s', 's.siswa_id', '=', 'k.siswa_id')
                ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
                ->join('guru_mapel as gm', 'gm.guru_mapel_id', '=', 'km.guru_mapel_id')
                ->where('gm.mapel_id', $mapel_id)
                ->where('gm.guru_id', $guru_id)
                ->where('s.tingkatan', $tingkatan)
                ->where('km.status', 1)
                ->where('km.kelas_id', $kelas_id);

            if ($request->tuntas != null) {
                $query->where('k.tuntas', $request->tuntas);
            }

            if ($request->semester != null) {
                $query->where('k.semester', $request->semester);
            }

            $count = $query->count();

            $result = $query->get();

            $data = [];

            if (!empty($result)) {
                $i = $request->start;
                foreach ($result as $row) {
                    $i++;
                    $subData = [];
                    $subData['no'] = $i;


                    $subData['nama'] = $row->nama;

                    if ($row->tuntas == 0) {
                        $subData['tgl_tuntas'] = '-';
                        $subData['tuntas'] = '
                        <div class="text-center">
                            <span class="badge badge-danger p-2">
                                Belum Tuntas
                            </span> 
                        </div>
                        ';
                        $subData['check_box'] = '
                        <input type="checkbox" class="ketuntasan_id" name="ketuntasan_id[]"
                        value="' . $row->ketuntasan_id . '">
                        ';
                    }

                    if ($row->tuntas == 1) {
                        $subData['tgl_tuntas'] = $row->tgl_tuntas;
                        $subData['tuntas'] = '
                        <div class="text-center">
                            <span class="badge badge-success p-2">
                                Tuntas
                            </span> 
                        </div>
                        ';
                        $subData['check_box'] = "";
                    }

                    if ($row->desc) {
                        $subData['desc'] = $row->desc;
                    } else {
                        $subData['desc'] = "-";
                    }

                    $subData['semester'] =  '
                    <div class="text-center">
                    ' . $row->semester . '
                    </div>
                    ';

                    $subData['aksi'] = '
                    <div class="text-center">
                        <a href="/ketuntasan/by-guru/' . $guru_id . '/' . $mapel_id . '/' . $tingkatan . '/' . $kelas_id . '/edit/' . $row->ketuntasan_id . '"
                        class="setting-edit">
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

        $sql_guru = DB::table('guru')
            ->where('guru_id', $guru_id)
            ->first();

        $sql_mapel = DB::table("mapel")
            ->where('mapel_id', $mapel_id)
            ->first();

        $sql_kelas = DB::table("kelas as k")
            ->join('jurusan as j', 'j.jurusan_id', '=', 'k.jurusan_id')
            ->where('k.kelas_id', $kelas_id)
            ->first();

        $dataToView = [
            'guru_id' => $guru_id,
            'mapel_id' => $mapel_id,
            'kelas_id' => $kelas_id,
            'tingkatan' => $tingkatan,
            'data_guru' => $sql_guru,
            'data_mapel' => $sql_mapel,
            'data_kelas' => $sql_kelas,
            'tuntases' => Utils::$tuntases,
            'semesters' => Utils::$semesters,
        ];

        return view("pages.ketuntasan.byGuru.ketuntasan", $dataToView);
    }

    public function byGuruTuntaskan(Request $request)
    {
        $sql_batasWaktu = DB::table("batas_waktu")
            ->where('status', 1)
            ->first();

        $now = date("Y-m-d");

        if ($now >= $sql_batasWaktu->start_date && $now <= $sql_batasWaktu->end_date) {
            $guru_id = $request->guru_id;
            $mapel_id = $request->mapel_id;
            $kelas_id = $request->kelas_id;

            $ketuntasan_id = $request->ketuntasan_id;

            if (isset($ketuntasan_id)) {
                for ($i = 0; $i < count($ketuntasan_id); $i++) {
                    DB::table("ketuntasan")
                        ->where('ketuntasan_id', $ketuntasan_id[$i])
                        ->update([
                            'tgl_tuntas' => Carbon::now(),
                            'tuntas' => 1,
                        ]);
                }

                return redirect()->back()->with("success", 'success');
            }


            return redirect()->back()->with("no_ketuntasan", 'no_ketuntasan');
        }

        return redirect()->back()->with("failed_batas_waktu", "failed_batas_waktu");
    }

    public function byGuruKetuntasanEdit($guru_id, $mapel_id, $tingkatan, $kelas_id, $ketuntasan_id)
    {
        $sql = DB::table("ketuntasan as k")
            ->join('siswa as s', 's.siswa_id', '=', 'k.siswa_id')
            ->where('k.ketuntasan_id', $ketuntasan_id)
            ->first();


        $dataToView = [
            'guru_id' => $guru_id,
            'mapel_id' => $mapel_id,
            'kelas_id' => $kelas_id,
            'tingkatan' => $tingkatan,
            'data' => $sql,
            'tuntases' => $this->tuntases,
        ];

        return view("pages.ketuntasan.byGuru.edit", $dataToView);
    }

    public function byGuruUpdate(Request $request)
    {
        $ketuntasan_id = $request->ketuntasan_id;
        $status = $request->status;
        $desc = $request->deskripsi;

        $dataUpdate = [];

        if ($status == 0) {
            $dataUpdate['tgl_tuntas'] = null;
        } else {
            $dataUpdate['tgl_tuntas'] = Carbon::now();
        }

        $dataUpdate['desc'] = $desc;
        $dataUpdate['tuntas'] =  $status;

        DB::table("ketuntasan")
            ->where("ketuntasan_id", $ketuntasan_id)
            ->update($dataUpdate);

        return redirect()->back()->with("success", "success");
    }

    public function cetakByGuru(Request $request)
    {
        $query = DB::table("ketuntasan as k")
            ->select('k.*', 's.nama', 's.tingkatan')
            ->join('siswa as s', 's.siswa_id', '=', 'k.siswa_id')
            ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
            ->join('guru_mapel as gm', 'gm.guru_mapel_id', '=', 'km.guru_mapel_id')
            ->where('gm.mapel_id', $request->mapel_id_cetak)
            ->where('s.tingkatan', $request->tingkatan_cetak)
            ->where('km.kelas_id', $request->kelas_id_cetak);

        if ($request->status_cetak != null) {
            $query->where('k.tuntas', $request->status_cetak);
        }

        if ($request->semester_cetak != null) {
            $query->where('k.semester', $request->semester_cetak);
        }

        $result = $query->get();

        $dataToView = [
            'ketuntasans' => $result,
            'nama_guru' => $request->nama_guru_cetak,
            'nama_mapel' => $request->nama_mapel_cetak,
            'nama_kelas' => $request->nama_kelas_cetak,
        ];

        $fileName = "Ketuntasan_" . $request->nama_guru . "_" . $request->nama_mapel . "_" . $request->nama_kelas;

        $pdf = Pdf::loadView("pages.ketuntasan.byGuru.cetak-pdf", $dataToView);
        $pdf->setPaper("A4", "potrait");
        return $pdf->stream($fileName . ".pdf");
    }

    public function byRuang(Request $request)
    {
        if ($request->ajax()) {
            $columnsSearch = ['s.nama'];
            $table = DB::table("ujian as u");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            $query = $table->join("siswa as s", 's.siswa_id', '=', 'u.siswa_id')
                ->where('u.ruang', $request->ruang)
                ->where('u.sesi', $request->sesi);

            $count = $query->count();

            $result = $query->offset($request->start)
                ->limit($request->length)
                ->orderBy('s.nama', 'ASC')
                ->get();

            $data = [];

            if (!empty($result)) {
                $i = $request->start;
                foreach ($result as $row) {
                    $i++;
                    $subData = [];
                    $subData['no'] = $i;
                    $subData['nama'] = $row->nama;
                    $subData['ruang'] = $row->ruang;
                    $subData['sesi'] = $row->sesi;

                    $subData['aksi'] = '
                    <div class="text-center">
                        <a href="/ketuntasan/by-ruang/siswa/' . $row->siswa_id . '" class="badge badge-success p-2">
                            <i class="ri-eye-line"></i>
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
        ];

        return view("pages.ketuntasan.byRuang.index", $dataToView);
    }

    public function byRuangKetuntasan(Request $request, $siswa_id)
    {
        if ($request->ajax()) {
            $columnsSearch = ['s.nama'];

            $table = DB::table("ketuntasan as k");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            $query = $table->select('k.*', 'g.nama', 'm.nama_mapel')
                ->join('siswa as s', 's.siswa_id', '=', 'k.siswa_id')
                ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
                ->join('guru_mapel as gm', 'gm.guru_mapel_id', '=', 'km.guru_mapel_id')
                ->join('guru as g', 'g.guru_id', '=', 'gm.guru_id')
                ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
                ->where('k.siswa_id', $siswa_id)
                ->where('km.status', 1);

            if ($request->tuntas != null) {
                $query->where('k.tuntas', $request->tuntas);
            }

            if ($request->semester != null) {
                $query->where('k.semester', $request->semester);
            }

            $count = $query->count();

            $result = $query->get();

            $data = [];

            if (!empty($result)) {
                $i = $request->start;
                foreach ($result as $row) {
                    $i++;
                    $subData = [];
                    $subData['no'] = $i;


                    $subData['nama'] = $row->nama;
                    $subData['nama_mapel'] = $row->nama_mapel;

                    if ($row->tuntas == 0) {
                        $subData['tgl_tuntas'] = '-';
                        $subData['tuntas'] = '
                        <div class="text-center">
                            <span class="badge badge-danger p-2">
                                Belum Tuntas
                            </span> 
                        </div>
                        ';
                        $subData['check_box'] = '
                        <input type="checkbox" class="ketuntasan_id" name="ketuntasan_id[]"
                        value="' . $row->ketuntasan_id . '">
                        ';
                    }

                    if ($row->tuntas == 1) {
                        $subData['tgl_tuntas'] = $row->tgl_tuntas;
                        $subData['tuntas'] = '
                        <div class="text-center">
                            <span class="badge badge-success p-2">
                                Tuntas
                            </span> 
                        </div>
                        ';
                        $subData['check_box'] = "";
                    }

                    if ($row->desc) {
                        $subData['desc'] = $row->desc;
                    } else {
                        $subData['desc'] = "-";
                    }

                    $subData['semester'] =  '
                    <div class="text-center">
                    ' . $row->semester . '
                    </div>
                    ';

                    $subData['aksi'] = '
                    <div class="text-center">
                        <a href="/ketuntasan/by-ruang/siswa/' . $row->siswa_id . '/edit/' . $row->ketuntasan_id . '"
                        class="setting-edit">
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

        $sql_siswa = DB::table("siswa")
            ->where('siswa_id', $siswa_id)
            ->first();

        $dataToView = [
            'siswa_id' => $siswa_id,
            'siswa' => $sql_siswa,
            'tuntases' => Utils::$tuntases,
            'semesters' => Utils::$semesters,
        ];
        return view("pages.ketuntasan.byRuang.ketuntasan", $dataToView);
    }

    public function byRuangEdit($siswa_id, $ketuntasan_id)
    {

        $sql = DB::table("ketuntasan as k")
            ->select('k.*', 'g.nama', 'm.nama_mapel')
            ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
            ->join('guru_mapel as gm', 'gm.guru_mapel_id', '=', 'km.guru_mapel_id')
            ->join('guru as g', 'g.guru_id', '=', 'gm.guru_id')
            ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
            ->where('k.ketuntasan_id', $ketuntasan_id)
            ->first();


        $dataToView = [
            'siswa_id' => $siswa_id,
            'data' => $sql,
            'tuntases' => $this->tuntases,
            'tuntases' => Utils::$tuntases,
        ];

        return view("pages.ketuntasan.byRuang.edit", $dataToView);
    }
}
