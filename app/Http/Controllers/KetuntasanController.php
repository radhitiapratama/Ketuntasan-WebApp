<?php

namespace App\Http\Controllers;


use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\DB;

use App\Models\GuruMapel;
use App\Models\Kelas;
use App\Models\Jurusan;
use App\Models\TahunAjaran;
use App\Models\Mapel;
use App\Models\Siswa;
use Illuminate\Support\Facades\Auth;

use function PHPSTORM_META\map;

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
        // jika role superadmin
        if (auth()->guard("admin")->check()) {
            if ($request->ajax()) {
                $tahun_ajaran = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

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

            $sql_kelas =  Kelas::with([
                'jurusan' => function ($query) {
                    $query->select("jurusan_id", 'nama_jurusan');
                    $query->where("status", 1);
                }
            ])
                ->where("kelas.status", 1)
                ->get();

            $dataToView = [
                'kelases' => $sql_kelas,
                'tingkatans' => $this->tingkatans,
            ];

            return view('pages.ketuntasan.index', $dataToView);
        }

        // jika role siswa 
        if (Auth::guard("siswa")->check()) {
            if ($request->ajax()) {
                $tahun = TahunAjaran::select("tahun_ajaran_id")->where("user_aktif", 1)->first();

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

            return view("pages.ketuntasan.index");
        }

        if (Auth::guard("guru")->check()) {
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

                        $subData['settings'] = '
                        <div class="setting-icons">
                            <form action="' . url("guru/ketuntasan/kelas") . '" method="post">
                            ' . csrf_field() . '
                                <input type="hidden" name="mapel_id" value="' . $row->mapel_id . '">
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
                    'recordsFiltered' => 0,
                    'recordsTotal' => 0,
                    'data' => $dataResponse,
                ]);
            }


            return view("pages.ketuntasan.guru.index");
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

                $data_ketuntasan[] = [
                    'siswa_id' => $siswa->siswa_id,
                    'kelas_mapel_id' => $mapel->kelas_mapel_id,
                    'desc' => null,
                    'tgl_tuntas' => null,
                    'tahun_ajaran_id' => $tahun_ajaran->tahun_ajaran_id,
                    'semester' => $semester,
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now(),
                    'created_by' => auth()->guard("admin")->user()->user_id
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
            'status_batasWaktu' => $status_batasWaktu
        ];

        return view("pages.ketuntasan.edit", $dataToView);
    }

    public function update(Request $request)
    {
        $dataUpdate = [];

        if ($request->tuntas == 0) {
            $dataUpdate['tgl_tuntas'] = null;
        }

        $dataUpdate['tuntas'] = $request->tuntas;
        $dataUpdate['desc'] = $request->deskripsi ? $request->deskripsi : null;

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

        if ($request->isMethod("GET")) {

            if ($request->ajax()) {
                $tahun = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

                $columnsSearch = ['username', 'nama'];
                $table = DB::table("siswa");

                $query = $table
                    ->select('siswa_id', 'nama')
                    ->where('status', 1)
                    ->where('tingkatan', $tingkatan)
                    ->where('jurusan_id', $jurusan_id)
                    ->where('kelas_id', $kelas_id);

                if ($request->input("search.value")) {
                    $table->where(function ($q) use ($columnsSearch, $request) {
                        foreach ($columnsSearch as $column) {
                            $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                        }
                    });
                }

                $records  = $table->count();

                $result = $query->offset($request->start)->limit($request->length)->get();

                $dataResponse = [];

                if (!empty($result)) {
                    $no = $request->start;
                    foreach ($result as $row) {
                        $no++;
                        $subData['no'] = $no;
                        $subData['nama'] = $row->nama;

                        //total mapel
                        $sql_total_mapel = DB::table("kelas_mapel")
                            ->select("kelas_mapel_id")
                            ->where("tingkatan", $tingkatan)
                            ->where('jurusan_id', $jurusan_id)
                            ->where('kelas_id', $kelas_id)
                            ->where("tahun_ajaran_id", $tahun->tahun_ajaran_id)
                            ->where("status", 1)
                            ->count();

                        // mapel tuntas semester 1
                        $sql_tuntas_semester1 = DB::table("ketuntasan as k")
                            ->select('k.ketuntasan_id')
                            ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
                            ->where("k.siswa_id", $row->siswa_id)
                            ->where("k.tuntas", 1)
                            ->where("k.semester", 1)
                            ->where("k.tahun_ajaran_id", $tahun->tahun_ajaran_id)
                            ->where('km.status', 1)
                            ->count();

                        // mapel tuntas semester 2
                        $sql_tuntas_semester2 = DB::table("ketuntasan as k")
                            ->select('k.ketuntasan_id')
                            ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
                            ->where("k.siswa_id", $row->siswa_id)
                            ->where("k.tuntas", 1)
                            ->where("k.semester", 2)
                            ->where("k.tahun_ajaran_id", $tahun->tahun_ajaran_id)
                            ->where('km.status', 1)
                            ->count();


                        $subData['semester1'] = '
                        <div class="text-center">
                            ' . $sql_tuntas_semester1 . " / " . $sql_total_mapel . '
                        </div>
                        ';

                        $subData['semester2'] = '
                        <div class="text-center">
                            ' . $sql_tuntas_semester2 . " / " . $sql_total_mapel . '
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
        ];

        return view('pages.ketuntasan.siswa', $dataToView);
    }

    // Detail ketuntasan siswa
    public function siswa_show(Request $request)
    {
        $tingkatan = $request->tingkatan;
        $jurusan_id = $request->jurusan_id;
        $kelas_id = $request->kelas_id;
        $siswa_id = $request->siswa_id;

        $tahun = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

        if ($request->isMethod("GET")) {
            if ($request->ajax()) {
                $columnsSearch = ["m.nama_mapel", "u.nama"];
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
                    ->where('k.tahun_ajaran_id', $tahun->tahun_ajaran_id);

                if ($request->input("search.value")) {
                    $table->where(function ($q) use ($columnsSearch, $request) {
                        foreach ($columnsSearch as $column) {
                            $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                        }
                    });
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
            'siswa' => $sql_siswa,
            'status_batasWaktu' => $status_batasWaktu,
        ];

        return view("pages.ketuntasan.detail", $dataToView);
    }

    public function guru_kelas(Request $request)
    {
        $mapel_id = $request->mapel_id;

        if (!isset($mapel_id)) {
            return redirect('ketuntasan');
        }

        if ($request->isMethod("GET")) {
            if ($request->ajax()) {
                $columnsSearch = ['j.nama_jurusan', 'k.nama_kelas'];

                $tahun = TahunAjaran::select("tahun_ajaran_id")->where("user_aktif", 1)->first();
                $batasWaktu = DB::table("batas_waktu")
                    ->select('batas_waktu_id')
                    ->where("status", 1)
                    ->where('tahun_ajaran_id', $tahun->tahun_ajaran_id)
                    ->first();

                $status_batasWaktu = false;

                if (!empty($batasWaktu)) {
                    $status_batasWaktu = true;
                }

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
        ];

        return view("pages.ketuntasan.guru.kelas", $dataToView);
    }

    public function guru_siswa(Request $request)
    {
        $mapel_id = $request->mapel_id;
        $tingkatan = $request->tingkatan;
        $jurusan_id = $request->jurusan_id;
        $kelas_id = $request->kelas_id;

        if (!isset($mapel_id) || !isset($tingkatan) || !isset($jurusan_id) || !isset($kelas_id)) {
            return redirect('ketuntasan');
        }

        if ($request->isMethod("GET")) {
            if ($request->ajax()) {
                $columnsSearch = ['s.nama', 's.username'];
                $tahun = TahunAjaran::select("tahun_ajaran_id")->where("user_aktif", 1)->first();

                $table = DB::table("ketuntasan as k");

                $query = $table
                    ->select('k.*', 's.nama')
                    ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
                    ->join('guru_mapel as gm', 'gm.guru_mapel_id', '=', 'km.guru_mapel_id')
                    ->join('siswa as s', 's.siswa_id', '=', 'k.siswa_id')
                    ->where("gm.guru_id", auth()->guard('guru')->user()->guru_id)
                    ->where("gm.mapel_id", $mapel_id)
                    ->where("k.tahun_ajaran_id", $tahun->tahun_ajaran_id);

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

                $result = $query->orderBy('semester', 'ASC')->get();

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
        //select batas waktu ketuntasan
        $batasWaktu = DB::table("batas_waktu")
            ->where('tahun_ajaran_id', $tahun->tahun_ajaran_id)
            ->where('status', 1)
            ->first();

        $status = "true";

        if (date("Y-m-d H:i:s") < $batasWaktu->start_date . " 00:00:00") {
            $status = "belum";
        }

        if (date("Y-m-d H:i:s") > $batasWaktu->end_date . " 23:59:59") {
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
            'status' => $status
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
}
