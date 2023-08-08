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
        if (Gate::allows("admin")) {

            if ($request->ajax()) {
                // return response()->json($request->all());

                $tahun_ajaran = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

                $table = DB::table("ketuntasan as kt");

                $query = $table->select(
                    'u.tingkatan',
                    'u.jurusan_id',
                    'u.kelas_id',
                    'j.nama_jurusan',
                    'k.nama_kelas'
                )
                    ->join('users as u', 'u.user_id', '=', 'kt.user_id')
                    ->join('jurusan as j', 'j.jurusan_id', '=', 'u.jurusan_id')
                    ->join('kelas as k', 'k.kelas_id', '=', 'u.kelas_id')
                    ->where("kt.tahun_ajaran_id", $tahun_ajaran->tahun_ajaran_id);

                $records = $query->count();

                if ($request->tingkatan != null) {
                    $query->where('u.tingkatan', $request->tingkatan);
                }

                if ($request->jurusan_id != null) {
                    $query->where('u.jurusan_id', $request->jurusan_id);
                }

                if ($request->kelas_id != null) {
                    $query->where('u.kelas_id', $request->kelas_id);
                }

                $result = $query
                    ->groupBy("u.tingkatan", 'u.kelas_id')
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
                            $subData['tingkatan'] = "X";
                        }

                        if ($row->tingkatan == 2) {
                            $subData['tingkatan'] = "XI";
                        }

                        if ($row->tingkatan == 3) {
                            $subData['tingkatan'] = "XII";
                        }

                        $subData['jurusan'] = $row->nama_jurusan;
                        $subData['kelas'] = $row->nama_kelas;

                        $subData['settings'] = '
                        <div class="setting-icons">
                            <form action="' . url("ketuntasan/kelas") . '" method="post">
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

            $sql_jurusan = Jurusan::where("status", 1)->get();

            $dataToView = [
                'jurusans' => $sql_jurusan,
                'tingkatans' => $this->tingkatans,
            ];

            return view('pages.ketuntasan.index', $dataToView);
        }

        // jika role siswa 
        if (Gate::allows("siswa")) {
            if ($request->ajax()) {
                $tahun = TahunAjaran::select("tahun_ajaran_id")->where("user_aktif", 1)->first();

                $table = DB::table("ketuntasan as k");

                $query = $table
                    ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
                    ->join('users as u', 'u.user_id', '=', 'km.user_id')
                    ->join('mapel as m', 'm.mapel_id', '=', 'km.mapel_id')
                    ->where('k.user_id', auth()->user()->user_id)
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

        // jika role guru
        if (Gate::allows("guru")) {
            if ($request->ajax()) {
                $table = GuruMapel::with('mapel');

                $query = $table
                    ->where('user_id', auth()->user()->user_id)
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
        $sql_jurusan = Jurusan::where('status', 1)->get();

        $dataToView = [
            'jurusans' => $sql_jurusan,
            'tingkatans' => $this->tingkatans,
        ];

        return view("pages.ketuntasan.add", $dataToView);
    }

    public function store(Request $request)
    {
        $tingkatan_id = $request->tingkatan_id;
        $jurusan_id = $request->jurusan_id;
        $kelas_id = $request->kelas_id;

        $tahun_ajaran  = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

        $sql_mapel = DB::table('kelas_mapel')
            ->select('kelas_mapel_id')
            ->where('tingkatan', $tingkatan_id)
            ->where('jurusan_id', $jurusan_id)
            ->where('kelas_id', $kelas_id)
            ->where('tahun_ajaran_id', $tahun_ajaran->tahun_ajaran_id)
            ->get();

        if (count($sql_mapel) <= 0) {
            $dataResponse = [
                'message' => "empty_mapel",
            ];

            return response()->json($dataResponse);
        }

        $sql_user = DB::table("users")
            ->select('user_id')
            ->where('tingkatan', $tingkatan_id)
            ->where('jurusan_id', $jurusan_id)
            ->where('kelas_id', $kelas_id)
            ->where('status', 1)
            ->where('role', 3)
            ->get();

        if (count($sql_user) <= 0) {
            $dataResponse = [
                'message' => "empty_siswa",
            ];

            return response()->json($dataResponse);
        }

        foreach ($sql_user as $user) {
            foreach ($sql_mapel as $mapel) {
                $sql_check = DB::table("ketuntasan")
                    ->select('ketuntasan_id')
                    ->where('tahun_ajaran_id', $tahun_ajaran->tahun_ajaran_id)
                    ->where('user_id', $user->user_id)
                    ->where('kelas_mapel_id', $mapel->kelas_mapel_id)
                    ->first();

                if ($sql_check) {
                    continue;
                }

                DB::table('ketuntasan')
                    ->insert([
                        'user_id' => $user->user_id,
                        'kelas_mapel_id' => $mapel->kelas_mapel_id,
                        'tahun_ajaran_id' => $tahun_ajaran->tahun_ajaran_id,
                        'semester' => 1,
                        'created_at' => Carbon::now(),
                    ]);

                DB::table('ketuntasan')
                    ->insert([
                        'user_id' => $user->user_id,
                        'kelas_mapel_id' => $mapel->kelas_mapel_id,
                        'tahun_ajaran_id' => $tahun_ajaran->tahun_ajaran_id,
                        'semester' => 2,
                        'created_at' => Carbon::now(),
                    ]);
            }
        }

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
        $user_id = $request->user_id;
        $ketuntasan_id = $request->ketuntasan_id;

        if (!isset($tingkatan) || !isset($jurusan_id) || !isset($kelas_id) || !isset($user_id) || !isset($ketuntasan_id)) {
            return redirect()->back();
        }

        if ($request->isMethod("GET")) {
            return redirect('ketuntasan');
        }

        $tahun = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

        $sql_ketuntasan = DB::table("ketuntasan as k")
            ->select('u.nama', 'k.*')
            ->join('users as u', 'u.user_id', '=', 'k.user_id')
            ->where('k.ketuntasan_id', $ketuntasan_id)
            ->where("k.tahun_ajaran_id", $tahun->tahun_ajaran_id)
            ->first();

        if (empty($sql_ketuntasan)) {
            return redirect()->back();
        }

        $dataToView = [
            'tingkatan' => $tingkatan,
            'jurusan_id' => $jurusan_id,
            'kelas_id' => $kelas_id,
            'user_id' => $user_id,
            'tuntases' => $this->tuntases,
            'ketuntasan' => $sql_ketuntasan,
            'ketuntasan_id' => $ketuntasan_id,
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

    public function kelas(Request $request)
    {
        $tingkatan = $request->tingkatan;
        $jurusan_id = $request->jurusan_id;
        $kelas_id = $request->kelas_id;

        if ($request->isMethod("GET")) {

            if ($request->ajax()) {
                $columnsSearch = ['username', 'nama'];
                $table = DB::table("users");

                $query = $table
                    ->select('user_id', 'username', 'nama')
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

                $records = $query->count();

                $result = $query->offset($request->start)->limit($request->length)->get();

                $dataResponse = [];

                if (!empty($result)) {
                    $no = $request->start;
                    foreach ($result as $row) {
                        $no++;
                        $subData['no'] = $no;
                        $subData['username'] = $row->username;
                        $subData['nama'] = $row->nama;

                        $subData['settings'] = '
                        <div class="setting-icons">
                            <form action="' . url("ketuntasan/kelas/siswa") . '" method="post">
                            ' . csrf_field() . '
                                <input type="hidden" name="tingkatan" value="' . $tingkatan . '">
                                <input type="hidden" name="jurusan_id" value="' . $jurusan_id . '">
                                <input type="hidden" name="kelas_id" value="' . $kelas_id . '">
                                <input type="hidden" name="user_id" value="' . $row->user_id . '">
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

        return view('pages.ketuntasan.kelas', $dataToView);
    }

    public function siswa(Request $request)
    {
        $tingkatan = $request->tingkatan;
        $jurusan_id = $request->jurusan_id;
        $kelas_id = $request->kelas_id;
        $user_id = $request->user_id;

        if ($request->isMethod("GET")) {
            if ($request->ajax()) {
                $columnsSearch = ["m.nama_mapel", "u.nama"];
                $table = DB::table("ketuntasan as k");

                $tahun = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

                $query = $table->select(
                    'k.*',
                    'm.nama_mapel',
                    'u.nama',
                )
                    ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
                    ->join('users as u', 'u.user_id', '=', 'km.user_id')
                    ->join('mapel as m', 'm.mapel_id', '=', 'km.mapel_id')
                    ->where("k.user_id", $user_id)
                    ->where('k.semester', $request->semester)
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
                        $subData['semester'] = $row->semester;

                        $subData['settings'] = '
                        <div class="setting-icons">
                            <form action="' . url("ketuntasan/kelas/siswa/edit") . '" method="post">
                            ' . csrf_field() . '
                                <input type="hidden" name="tingkatan" value="' . $tingkatan . '">
                                <input type="hidden" name="jurusan_id" value="' . $jurusan_id . '">
                                <input type="hidden" name="kelas_id" value="' . $kelas_id . '">
                                <input type="hidden" name="user_id" value="' . $user_id . '">
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

        if (!isset($tingkatan) || !isset($jurusan_id) || !isset($kelas_id) || !isset($user_id)) {
            return redirect()->back();
        }

        $sql_siswa = DB::table("users")
            ->select('nama')
            ->where("user_id", $user_id)
            ->first();


        $dataToView = [
            'tingkatan' => $tingkatan,
            'jurusan_id' => $jurusan_id,
            'kelas_id' => $kelas_id,
            'user_id' => $user_id,
            'siswa' => $sql_siswa,
        ];

        return view("pages.ketuntasan.siswa", $dataToView);
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
                    ->where('km.mapel_id', $mapel_id)
                    ->where('km.user_id', auth()->user()->user_id)
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
                            $subData['tingkatan'] = "X";
                        }

                        if ($row->tingkatan == 2) {
                            $subData['tingkatan'] = "XI";
                        }

                        if ($row->tingkatan == 3) {
                            $subData['tingkatan'] = "XII";
                        }

                        $subData['jurusan'] = $row->nama_jurusan;
                        $subData['kelas'] = $row->nama_kelas;

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
                $columnsSearch = ['u.nama', 'u.username'];
                $tahun = TahunAjaran::select("tahun_ajaran_id")->where("user_aktif", 1)->first();

                $tableKelasMapel = DB::table("kelas_mapel as km");
                $tableUser = DB::table("users");
                $tableKetuntasan = DB::table("ketuntasan as k");

                $query1 = $tableKelasMapel->select('kelas_mapel_id')
                    ->where("tingkatan", $tingkatan)
                    ->where('jurusan_id', $jurusan_id)
                    ->where('kelas_id', $kelas_id)
                    ->where('mapel_id', $mapel_id)
                    ->where('user_id', auth()->user()->user_id)
                    ->where('tahun_ajaran_id', $tahun->tahun_ajaran_id);

                $query2 = $tableUser->select('user_id')
                    ->where('tingkatan', $tingkatan)
                    ->where('jurusan_id', $jurusan_id)
                    ->where('kelas_id', $kelas_id)
                    ->where('role', 3)
                    ->where('status', 1);

                $query3 = $tableKetuntasan->select('k.*', 'u.nama')
                    ->join('users as u', 'u.user_id', '=', 'k.user_id')
                    ->whereIn("k.user_id", $query2)
                    ->whereIn('k.kelas_mapel_id', $query1)
                    ->where('k.tahun_ajaran_id', $tahun->tahun_ajaran_id);

                if ($request->semester != null) {
                    $query3->where('k.semester', $request->semester);
                }

                if ($request->status != null) {
                    $query3->where('k.tuntas', $request->status);
                }

                if ($request->input("search.value")) {
                    $query3->where(function ($q) use ($columnsSearch, $request) {
                        foreach ($columnsSearch as $column) {
                            $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                        }
                    });
                }

                $result = $query3->orderBy('semester', 'ASC')->get();

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
            ->select('k.*', 'u.nama', 'km.mapel_id', 'u.tingkatan', 'u.jurusan_id', 'u.kelas_id')
            ->join('users as u', 'u.user_id', '=', 'k.user_id')
            ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
            ->where('ketuntasan_id', $ketuntasan_id)
            ->first();

        if (empty($sql_ketuntasan)) {
            return redirect('ketuntasan');
        }

        $sql_mapel = Mapel::select("nama_mapel")->where("mapel_id", $mapel_id)->first();

        $dataToView = [
            'mapel_id' => $mapel_id,
            'tingkatan' => $tingkatan,
            'jurusan_id' => $jurusan_id,
            'kelas_id' => $kelas_id,
            'tuntases' => $this->tuntases,
            'ketuntasan' => $sql_ketuntasan,
            'mapel' => $sql_mapel,
        ];

        return view('pages.ketuntasan.guru.edit', $dataToView);
    }

    public function tuntaskanSiswa(Request $request)
    {
        $ketuntasan_id = $request->ketuntasan_id;
        $desc = $request->desc ? $request->desc : "-";

        for ($i = 0; $i < count($ketuntasan_id); $i++) {
            DB::table("ketuntasan")
                ->where("ketuntasan_id", $ketuntasan_id[$i])
                ->update([
                    'desc' => $desc,
                    'tgl_tuntas' => Carbon::now(),
                    'tuntas' => 1
                ]);
        }

        $dataResponse = [
            'message' => "success",
        ];

        return response()->json($dataResponse);
    }
}
