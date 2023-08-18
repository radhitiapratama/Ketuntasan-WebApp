<?php

namespace App\Http\Controllers;

use App\Imports\GuruImport;
use App\Models\GuruMapel;
use App\Models\Kelas;
use App\Models\TahunAjaran;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Support\Facades\Validator;

class GuruController extends Controller
{

    protected $statuses = [
        '1' => "Aktif",
        '0' => "Nonaktif"
    ];

    protected $tingkatans = [
        '1' => "X",
        '2' => "XI",
        '3' => "XII",
    ];

    public function index(Request $request)
    {
        if ($request->ajax()) {
            $columnsSearch = ['username', 'nama', 'user_id'];
            $table = DB::table("users");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            $query = $table->select('user_id', 'username', 'nama', 'status')
                ->where("role", 2);

            if ($request->status != null) {
                $query->where('status', $request->status);
            }

            $count = $query->count();

            $result = $query->offset($request->start)
                ->limit($request->length)
                ->orderByRaw("nama ASC")
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
                    $subData['status'] = '
                    <div class="text-center">
                        <span class="badge badge-danger p-2">Nonaktif</span>
                    </div>
                    ';

                    if ($row->status == 1) {
                        $subData['status'] = '
                        <div class="text-center">
                            <span class="badge badge-success p-2">Aktif</span>
                        </div>
                        ';
                    }

                    $subData['kode_guru'] = '
                    <div class="text-center">
                        ' . $row->user_id . '  
                    </div>
                    ';

                    $subData['setting'] = '
                    <div class="setting-icons">
                        <a href="guru/edit/' . $row->user_id . '" class="setting-edit">
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

        $data_guru = User::select("user_id", 'username', 'nama', 'status')->where("role", 2)->get();

        $dataToView = [
            'gurus' => $data_guru,
        ];

        return view("pages.guru.index", $dataToView);
    }

    public function add()
    {
        return view("pages.guru.add");
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            "username" => "required|unique:users,username",
            'nama_guru' => "required",
            'password' => "required|min:6",
        ], [
            'required' => ":attribute wajib di isi",
            'unique' => ":attribute sudah di gunakan",
            'min' => ":attribute harus lebih dari 6 karakter"
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        User::create([
            'username' => $request->username,
            'nama' => $request->nama_guru,
            'password' => Hash::make($request->password),
            'role' => 2,
        ]);

        return redirect()->back()->with("successStore", "successStore");
    }

    public function edit($user_id)
    {
        if (!isset($user_id)) {
            return redirect()->back();
        }

        $sql_guru = DB::table("users")
            ->select('user_id', 'username', 'nama', 'status', 'role')
            ->where('user_id', $user_id)
            ->first();

        if (empty($sql_guru) || $sql_guru->role != 2) {
            return redirect()->back();
        }

        $dataToView = [
            'guru' => $sql_guru,
            'statuses' => $this->statuses,
        ];


        return view("pages.guru.edit", $dataToView);
    }

    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            "user_id" => "required",
            'username' => "required",
            'nama' => "required",
            'status' => "required",
        ], [
            'required' => ":attribute wajib di isi"
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $dataToUpdate = [
            'status' => $request->status,
        ];

        $data_guru = DB::table("users")
            ->select('user_id', 'username', 'nama', 'status')
            ->where('user_id', $request->user_id)
            ->first();


        if ($request->username != $data_guru->username) {
            $check = DB::table("users")
                ->select('user_id')
                ->where('username', $request->username)
                ->first();

            //jika sudah ada username redirect back
            if ($check) {
                return redirect()->back()->with("duplicateUsername", "duplicateUsername")->withInput();
            }

            // update field username
            $dataToUpdate['username'] = $request->username;
        }

        if ($request->nama != $data_guru->nama) {
            // update field nama
            $dataToUpdate['nama'] = $request->nama;
        }

        DB::table('users')
            ->where('user_id', $request->user_id)
            ->update($dataToUpdate);

        return redirect()->back()->with("successEdit", 'successEdit');
    }

    public function guruMapel(Request $request)
    {
        if ($request->ajax()) {
            $columnsSearch = ['username', 'nama', 'user_id'];
            $table = DB::table("users");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            $query = $table->select('user_id', 'username', 'nama', 'status')
                ->where("role", 2)
                ->where('status', 1);

            $filtered = $query->count();

            $result = $query->offset($request->start)
                ->limit($request->length)
                ->orderByRaw("nama ASC")
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

                    $subData['kode_guru'] = '
                    <div class="text-center">
                        ' . $row->user_id . '
                    </div>
                    ';

                    $subData['settings'] = '
                    <div class="setting-icons">
                        <button type="button" class="setting-icon setting-detail detail-guru-mapel"
                            data-guru-id="' . $row->user_id . '" data-toggle="modal"
                            data-target="#modal_detailMapel">
                            <i class="ri-eye-line"></i>
                        </button>
                        <a href="/guru-mapel/edit/' . $row->user_id . '"
                            class="setting-icon setting-edit">
                            <i class="ri-pencil-line"></i>
                        </a>
                    </div>
                    ';

                    $data[] = $subData;
                }
            }

            return response()->json([
                'draw' => $request->draw,
                'recordsFiltered' => $filtered,
                'recordsTotal' => $filtered,
                'data' => $data,
            ]);
        }

        return view("pages.guru.guruMapel.index");
    }

    public function guruMapel_add()
    {
        $data_guru = DB::table("users")
            ->select('user_id', 'nama')
            ->where('role', 2)
            ->get();

        $data_mapel = DB::table("mapel")
            ->select('mapel_id', 'nama_mapel')
            ->where('status', 1)
            ->get();

        $dataToView = [
            'gurus' => $data_guru,
            'mapels' => $data_mapel,
        ];

        return view("pages.guru.guruMapel.add", $dataToView);
    }

    public function guruMapel_store(Request $request)
    {
        $mapel_id = $request->mapel_id;

        if (!isset($mapel_id)) {
            return response()->json([
                'message' => "failed",
            ]);
        }

        //check apakah ada mapel yang duplikat
        $temp_mapel = array_unique($mapel_id);

        $duplicate_mapel = sizeof($temp_mapel) != sizeof($request->mapel_id);

        if ($duplicate_mapel) {
            $dataResponse = [
                'message' => "duplicate_mapel",
            ];

            return response()->json($dataResponse);
        }

        for ($i = 0; $i < count($mapel_id); $i++) {
            $sql_check = DB::table("guru_mapel")
                ->where('user_id', $request->user_id)
                ->where('mapel_id', $mapel_id[$i])
                ->first();

            if ($sql_check) {
                continue;
            }

            GuruMapel::create([
                'user_id' => $request->user_id,
                'mapel_id' => $mapel_id[$i],
                'status' => 1,
            ]);
        }

        $dataResponse = [
            'message' => "success",
        ];

        return response()->json($dataResponse);
    }

    public function getDataMapelByGuru(Request $request)
    {
        $guru_id = $request->guru_id;

        $sql_mapel = DB::table("guru_mapel as gm")
            ->select('m.nama_mapel', 'gm.status')
            ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
            ->where('gm.user_id', $guru_id)
            ->get();

        $sql_guru = DB::table("users")
            ->select('nama')
            ->where('user_id', $guru_id)
            ->first();

        $dataToView  = [
            'mapels' => $sql_mapel,
            'guru' => $sql_guru,
        ];

        return response()->json($dataToView);
    }

    public function guruMapel_edit($guru_id)
    {
        if (!isset($guru_id)) {
            return redirect()->back();
        }

        $sql_guru =  DB::table("users")
            ->where('user_id', $guru_id)
            ->first();

        if ($sql_guru->role != 2 || $sql_guru->status == 0) {
            return redirect()->back();
        }

        $sql_guru_mapels = DB::table("guru_mapel as gm")
            ->select('gm.status', 'm.mapel_id', 'm.nama_mapel', 'gm.guru_mapel_id')
            ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
            ->where('gm.user_id', $guru_id)
            ->get();

        $sql_mapels = DB::table("mapel")
            ->where('status', 1)
            ->whereNotIn("mapel_id", $sql_guru_mapels->pluck("mapel_id"))
            ->get();

        $dataToView = [
            'guruMapels' => $sql_guru_mapels,
            'guru' => $sql_guru,
            'mapels' => $sql_mapels,
            'statuses' => $this->statuses,
        ];

        return view("pages.guru.guruMapel.edit", $dataToView);
    }

    public function guruMapel_update(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'user_id' => 'required',
                'mapel_id' => "required",
                'status' => "required",
                'guru_mapel_id' => 'required',
            ],
            [
                'required' => ":attribute wajib di isi"
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $mapel_id = $request->mapel_id;
        $guru_mapel_id = $request->guru_mapel_id;

        for ($i = 0; $i < count($guru_mapel_id); $i++) {
            DB::table("guru_mapel")
                ->where('guru_mapel_id', $guru_mapel_id[$i])
                ->update([
                    'mapel_id' => $mapel_id[$i],
                    'status' => $request->status[$i],
                    'updated_at' => date("Y-m-d H:i:s"),
                ]);
        }

        return redirect()->back()->with("successUpdate", "successUpdate");
    }

    public function getDataGuruByMapel(Request $request)
    {
        $mapel_id = $request->mapel_id;

        $sql_guru = DB::table("guru_mapel as gm")
            ->select('u.user_id', 'u.nama')
            ->join('users as u', 'u.user_id', '=', 'gm.user_id')
            ->where('gm.mapel_id', $mapel_id)
            ->where('gm.status', 1)
            ->get();

        $dataResponse = [
            'gurus' => $sql_guru,
        ];

        return response()->json($dataResponse);
    }

    public function waliKelas(Request $request)
    {
        if ($request->ajax()) {
            $tahun_ajaran = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

            $columnsSearch = ['u.nama', 'k.nama_kelas'];
            $table = DB::table("wali_kelas as wk");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            $query = $table->select('j.nama_jurusan', 'k.nama_kelas', 'u.nama', 'wk.wali_kelas_id', 'wk.tingkatan')
                ->join('jurusan as j', 'j.jurusan_id', '=', 'wk.jurusan_id')
                ->join('kelas as k', 'k.kelas_id', '=', 'wk.kelas_id')
                ->join('users as u', 'u.user_id', '=', 'wk.user_id')
                ->where('wk.tahun_ajaran_id', $tahun_ajaran->tahun_ajaran_id);

            if ($request->tingkatan != null) {
                $query->where('wk.tingkatan', $request->tingkatan);
            }

            if ($request->kelas_id != null) {
                // [0] => jurusan_id
                // [1] => kelas_id
                $arr = explode("|", $request->kelas_id);

                $query->where("wk.jurusan_id", $arr[0])
                    ->where("wk.kelas_id", $arr[1]);
            }


            $count = $query->count();

            $result = $query->offset($request->start)
                ->limit($request->length)
                ->get();

            $data = [];
            if (!empty($result)) {
                $i = $request->start;
                foreach ($result as $row) {
                    $i++;
                    $subData = [];
                    $subData['no'] = $i;
                    $subData['nama'] = $row->nama;

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
                        <a href="' . url("wali-kelas/edit/" . $row->wali_kelas_id) . '" class="setting-edit">
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

        return view("pages.guru.waliKelas.index", $dataToView);
    }

    public function waliKelas_add()
    {
        $tahun_ajaran = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

        $sql_jurusan = DB::table("jurusan")
            ->where('status', 1)
            ->get();

        $sql_guruWali = DB::table('wali_kelas')
            ->select('user_id')
            ->where('tahun_ajaran_id', $tahun_ajaran->tahun_ajaran_id);

        $sql_guru = DB::table("users")
            ->where('role', 2)
            ->where('status', 1)
            ->whereNotIn('user_id', $sql_guruWali)
            ->get();

        $dataToView = [
            'tingkatans' => $this->tingkatans,
            'jurusans' => $sql_jurusan,
            'gurus' => $sql_guru,
        ];

        return view("pages.guru.waliKelas.add", $dataToView);
    }

    public function waliKelas_store(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'tingkatan_id' => "required",
                'jurusan_id' => "required",
                'kelas_id' => "required",
                'user_id' => "required",
            ],
            [
                'required' => ":attribute wajib di isi"
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        $tahun_ajaran = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

        $sql_check = DB::table("wali_kelas")
            ->select('wali_kelas_id')
            ->where('tingkatan', $request->tingkatan_id)
            ->where('jurusan_id', $request->jurusan_id)
            ->where('kelas_id', $request->kelas_id)
            ->where('tahun_ajaran_id', $tahun_ajaran->tahun_ajaran_id)
            ->first();

        if ($sql_check) {
            return redirect()->back()->with(['failed' => "failed"]);
        }

        DB::table("wali_kelas")
            ->insert([
                'tingkatan' => $request->tingkatan_id,
                'jurusan_id' => $request->jurusan_id,
                'kelas_id' => $request->kelas_id,
                'user_id' => $request->user_id,
                'tahun_ajaran_id' => $tahun_ajaran->tahun_ajaran_id,
                'created_at' => Carbon::now(),
            ]);

        return redirect()->back()->with("successStore", "successStore");
    }

    public function waliKelas_edit($wali_kelas_id)
    {
        if (!isset($wali_kelas_id)) {
            return redirect()->back();
        }

        $tahun_ajaran = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

        $sql_waliKelas = DB::table("wali_kelas as wk")
            ->select('j.nama_jurusan', 'k.nama_kelas', 'wk.*')
            ->join('users as u', 'u.user_id', '=', 'wk.user_id')
            ->join('jurusan as j', 'j.jurusan_id', '=', 'wk.jurusan_id')
            ->join('kelas as k', 'k.kelas_id', '=', 'wk.kelas_id')
            ->where('wk.tahun_ajaran_id', $tahun_ajaran->tahun_ajaran_id)
            ->where('wk.wali_kelas_id', $wali_kelas_id)
            ->first();

        if (empty($sql_waliKelas) || $sql_waliKelas->tahun_ajaran_id != $tahun_ajaran->tahun_ajaran_id) {
            return redirect()->back();
        }

        // select guru yg sdh jadi wali kelas
        $sql_guruWaliKelas = DB::table("wali_kelas")
            ->select('user_id')
            ->where('tahun_ajaran_id', $tahun_ajaran->tahun_ajaran_id)
            ->where('user_id', '!=', $sql_waliKelas->user_id);

        $sql_guru = DB::table("users")
            ->select('user_id', 'nama')
            ->where('status', 1)
            ->where('role', 2)
            ->whereNotIn('user_id', $sql_guruWaliKelas)
            ->get();

        $dataToView = [
            'waliKelas' => $sql_waliKelas,
            'gurus' => $sql_guru,
        ];

        return view('pages.guru.waliKelas.edit', $dataToView);
    }

    public function waliKelas_update(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'wali_kelas_id' => "required",
                'user_id' => "required"
            ],
            [
                'required' => ":attribute wajib di isi"
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        DB::table("wali_kelas")
            ->where('wali_kelas_id', $request->wali_kelas_id)
            ->update([
                'user_id' => $request->user_id
            ]);

        return redirect()->back()->with("successUpdate", 'successUpdate');
    }

    public function importGuru(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'file_import' => "required|mimes:xlsx",
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $file = $request->file("file_import");

        $guru = new GuruImport;
        $guru->import($file);

        return redirect('guru')->with('successImport', "successImport");
    }

    public function waliKelas_dataSiswa(Request $request)
    {
        $tahun = TahunAjaran::select("tahun_ajaran_id")->where("user_aktif", 1)->first();

        // select data kelas dri table wali kelas
        $sql_waliKelas = DB::table("wali_kelas as wk")
            ->select('wk.tingkatan', 'wk.jurusan_id', 'wk.kelas_id', 'j.nama_jurusan', 'k.nama_kelas')
            ->join('jurusan as j', 'j.jurusan_id', '=', 'wk.jurusan_id')
            ->join('kelas as k', 'k.kelas_id', '=', 'wk.kelas_id')
            ->where('wk.user_id', auth()->user()->user_id)
            ->where('wk.tahun_ajaran_id', $tahun->tahun_ajaran_id)
            ->where("wk.status", 1)
            ->first();

        if (empty($sql_waliKelas)) {
            return redirect()->back();
        }

        if ($request->ajax()) {

            $columnsSearch = ['username', 'nama'];
            $table = DB::table("users");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            $query = $table->select('user_id', 'username', 'nama')
                ->where('tingkatan', $sql_waliKelas->tingkatan)
                ->where("jurusan_id", $sql_waliKelas->jurusan_id)
                ->where("kelas_id", $sql_waliKelas->kelas_id)
                ->where("status", 1);

            $count = $query->count();

            $result = $query->offset($request->start)
                ->limit($request->length)
                ->orderByRaw("nama ASC")
                ->get();

            $data = [];
            if (!empty($result)) {
                $i = $request->start;
                foreach ($result as $row) {
                    $i++;
                    $subData = [];
                    $subData['no'] = $i;
                    $subData['nama'] = $row->nama;

                    $sql_semester1 = DB::table("ketuntasan as k")
                        ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
                        ->where("k.user_id", $row->user_id)
                        ->where("k.semester", 1)
                        ->where('km.status', 1)
                        ->where('k.tahun_ajaran_id', $tahun->tahun_ajaran_id)
                        ->count();

                    $sql_semester2 = DB::table("ketuntasan as k")
                        ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
                        ->where("k.user_id", $row->user_id)
                        ->where("k.semester", 2)
                        ->where('km.status', 1)
                        ->where('k.tahun_ajaran_id', $tahun->tahun_ajaran_id)
                        ->count();

                    $sql_tuntas1 = DB::table("ketuntasan as k")
                        ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
                        ->where("k.user_id", $row->user_id)
                        ->where("k.semester", 1)
                        ->where('km.status', 1)
                        ->where('k.tahun_ajaran_id', $tahun->tahun_ajaran_id)
                        ->where('k.tuntas', 1)
                        ->count();

                    $sql_tuntas2 = DB::table("ketuntasan as k")
                        ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
                        ->where("k.user_id", $row->user_id)
                        ->where("k.semester", 2)
                        ->where('km.status', 1)
                        ->where('k.tahun_ajaran_id', $tahun->tahun_ajaran_id)
                        ->where('k.tuntas', 1)
                        ->count();

                    $subData['semester1'] = '
                    <div class="text-center">
                       ' . $sql_tuntas1 . " / " . $sql_semester1 . '
                    </div> ';

                    $subData['semester2'] = '
                    <div class="text-center">
                        ' . $sql_tuntas2 . " / " . $sql_semester2  . '
                    </div>
                    ';

                    $subData['settings'] = '
                    <form action="' . url("guru/wali-kelas/siswa/detail") . '" method="post">
                    ' . csrf_field() . '
                        <input type="hidden" name="user_id" value="' . $row->user_id . '">
                        <div class="setting-icons">
                            <button type="submit" class="setting-detail">
                                <i class="ri-eye-line"></i>
                            </button>
                        </div>
                    </form>
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
            'data' => $sql_waliKelas,
        ];

        return view("pages.ketuntasan.waliKelas.index", $dataToView);
    }

    public function waliKelas_detailKetuntasanSiswa(Request $request)
    {
        $user_id = $request->user_id;

        if ($request->isMethod("GET")) {
            if ($request->ajax()) {
                $tahun = TahunAjaran::select("tahun_ajaran_id")->where("user_aktif", 1)->first();

                $columnsSearch = ['u.nama', 'm.nama_mapel'];
                $table = DB::table("ketuntasan as k");

                if ($request->input("search.value")) {
                    $table->where(function ($q) use ($columnsSearch, $request) {
                        foreach ($columnsSearch as $column) {
                            $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                        }
                    });
                }

                $query = $table->select('k.*', 'u.nama', 'm.nama_mapel')
                    ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
                    ->join('users as u', 'u.user_id', '=', 'km.user_id')
                    ->join('mapel as m', 'm.mapel_id', '=', 'km.mapel_id')
                    ->where("k.user_id", $user_id)
                    ->where('k.tahun_ajaran_id', $tahun->tahun_ajaran_id)
                    ->where('semester', $request->semester);

                if ($request->tuntas != null) {
                    $query->where('k.tuntas', $request->tuntas);
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

            return redirect('/ketuntasan');
        }

        if (!isset($user_id)) {
            return redirect()->back();
        }

        $sql_users = User::select("nama")
            ->where("user_id", $user_id)
            ->first();

        $dataToView = [
            'user' => $sql_users,
            'user_id' => $user_id,
        ];

        return view("pages.ketuntasan.waliKelas.detail", $dataToView);
    }
}
