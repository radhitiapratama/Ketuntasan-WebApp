<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Guru;
use App\Models\User;
use App\Models\Kelas;
use App\Models\GuruMapel;
use App\Imports\GuruImport;
use App\Models\TahunAjaran;
use Illuminate\Http\Request;
use App\Imports\GuruMapelImport;
use App\Imports\waliKelasImport;
use App\Models\Mapel;
use App\Models\WaliKelas;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Concerns\WithBatchInserts;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx\Rels;
use Symfony\Component\CssSelector\Node\FunctionNode;

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
            $columnsSearch = ['username', 'nama', 'status', 'role', 'kode_guru'];
            $table = DB::table("guru");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            $query = $table->select('guru_id', 'username', 'nama', 'status', 'kode_guru');

            if ($request->status != null) {
                $query->where('status', $request->status);
            }

            $count = $query->count();

            $result = $query->offset($request->start)
                ->limit($request->length)
                ->orderByRaw("kode_guru ASC")
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
                        ' . $row->kode_guru . '  
                    </div>
                    ';

                    $subData['setting'] = '
                    <div class="setting-icons">
                        <a href="guru/edit/' . $row->guru_id . '" class="setting-edit">
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

        return view("pages.guru.index");
    }

    public function add()
    {
        return view("pages.guru.add");
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            "username" => "required|unique:guru,username",
            'nama_guru' => "required",
            'password' => "required|min:6",
            'kode_guru' => "required|unique:guru,kode_guru|numeric"
        ], [
            'username.required' => "Username wajib di isi",
            'username.unique' => "Username sudah di gunakan",
            'nama_guru.required' => "Nama Guru wajib di isi",
            'password.required' => "Password wajib di isi",
            'password.min' => "Password minimal 6 huruf",
            'kode_guru.required' => "Kode Guru wajib di isi",
            'kode_guru.unique' => "Kode Guru sudah di gunakan",
            'kode_guru.numeric' => "Kode Guru wajib angka"
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $user = User::create([
            'created_by' => auth()->guard("admin")->user()->user_id
        ]);

        $lastInsertId = $user->user_id;

        Guru::create([
            'user_id' => $lastInsertId,
            'username' => $request->username,
            'nama' => $request->nama_guru,
            'password' => Hash::make($request->password),
            'kode_guru' => $request->kode_guru,
            'status' => 1,
            'role' => 2,
            'created_by' => auth()->guard("admin")->user()->user_id
        ]);

        return redirect()->back()->with("successStore", "successStore");
    }

    public function edit($guru_id)
    {
        if (!isset($guru_id)) {
            return redirect()->back();
        }

        $sql_guru = Guru::select("guru_id", 'username', 'nama', 'status', 'kode_guru')
            ->where("guru_id", $guru_id)
            ->first();

        if (empty($sql_guru)) {
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
            "guru_id" => "required",
            'username' => "required",
            'nama' => "required",
            'status' => "required",
            'kode_guru' => "required",
        ], [
            'username.required' => "Username wajib di isi",
            'nama.required' => "Nama Guru wajib di isi",
            'status.required' => "Status wajib di isi",
            'kode_guru.required' => "Kode Guru wajib di isi",
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $dataToUpdate = [
            'status' => $request->status,
        ];

        $sql_guru = Guru::where("guru_id", $request->guru_id)->first();

        if ($request->kode_guru != $sql_guru->kode_guru) {
            $check = Guru::where("kode_guru", $sql_guru->kode_guru)->first();
            if ($check) {
                return redirect()->back()->with("duplicateKodeGuru", "duplicateKodeGuru")->withInput();
            }
        }

        if ($request->username != $sql_guru->username) {
            $check = Guru::where("username", $request->username)
                ->first();

            //jika sudah ada username redirect back
            if ($check) {
                return redirect()->back()->with("duplicateUsername", "duplicateUsername")->withInput();
            }

            // update field username
            $dataToUpdate['username'] = $request->username;
        }

        if ($request->nama != $sql_guru->nama) {
            // update field nama
            $dataToUpdate['nama'] = $request->nama;
        }

        Guru::where("guru_id", $request->guru_id)
            ->update($dataToUpdate);

        return redirect()->back()->with("successEdit", 'successEdit');
    }

    public function guruMapel(Request $request)
    {
        if ($request->ajax()) {
            $columnsSearch = ['g.username', 'g.nama', 'g.kode_guru', 'm.nama_mapel', 'gm.kode_guru_mapel'];
            $table = DB::table("guru_mapel as gm");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            $query = $table->select("gm.*", 'g.username', 'g.nama', 'g.kode_guru', 'm.nama_mapel')
                ->join('guru as g', 'g.guru_id', '=', 'gm.guru_id')
                ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
                ->where("g.status", 1);

            $filtered = $query->count();

            $result = $query->offset($request->start)
                ->limit($request->length)
                ->orderByRaw("g.kode_guru ASC")
                ->get();

            $data = [];
            if (!empty($result)) {
                $i = $request->start;
                foreach ($result as $row) {
                    $i++;
                    $subData = [];
                    $subData['no'] = $i;

                    $subData['kode_guru'] = '
                    <div class="text-center">
                        ' . $row->kode_guru . '
                    </div>
                    ';

                    $subData['nama'] = $row->nama;
                    $subData['nama_mapel'] = $row->nama_mapel;

                    $subData['kode_guru_mapel'] = '
                    <div class="text-center">
                        ' . $row->kode_guru . '
                    </div>
                    ';

                    if ($row->kode_guru_mapel != null) {
                        $subData['kode_guru_mapel'] = '
                        <div class="text-center">
                        ' . $row->kode_guru . ',' . $row->kode_guru_mapel . ' 
                        </div>
                        ';
                    }


                    $subData['settings'] = '
                    <div class="setting-icons">
                        <a href="/guru-mapel/edit/' . $row->guru_mapel_id . '"
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
        $sql_guru = Guru::where("status", 1)->get();
        $sql_mapel = Mapel::where("status", 1)->get();

        $dataToView = [
            'gurus' => $sql_guru,
            'mapels' => $sql_mapel,
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
            $sql_checkDuplicate = DB::table("guru_mapel")
                ->where("guru_id", $request->guru_id)
                ->where("mapel_id", $mapel_id[$i])
                ->first();

            if ($sql_checkDuplicate) {
                continue;
            }

            $sql_count = DB::table("guru_mapel")
                ->where("guru_id", $request->guru_id)
                ->count();

            if ($sql_count == 0) {
                GuruMapel::create([
                    'guru_id' => $request->guru_id,
                    'mapel_id' => $mapel_id[$i],
                    'kode_guru_mapel' => null,
                    'status' => 1,
                    'created_by' => auth()->guard("admin")->user()->user_id
                ]);
            } elseif ($sql_count == 1) {
                GuruMapel::where("guru_id", $request->guru_id)
                    ->update([
                        'kode_guru_mapel' => 1,
                    ]);

                GuruMapel::create([
                    'guru_id' => $request->guru_id,
                    'mapel_id' => $mapel_id[$i],
                    'kode_guru_mapel' => $sql_count + 1,
                    'status' => 1,
                    'created_by' => auth()->guard("admin")->user()->user_id
                ]);
            } else {
                GuruMapel::create([
                    'guru_id' => $request->guru_id,
                    'mapel_id' => $mapel_id[$i],
                    'kode_guru_mapel' => $sql_count + 1,
                    'status' => 1,
                    'created_by' => auth()->guard("admin")->user()->user_id
                ]);
            }
        }

        $dataResponse = [
            'message' => "success",
        ];

        return response()->json($dataResponse);
    }

    // public function getDataMapelByGuru(Request $request)
    // {
    //     $guru_id = $request->guru_id;

    //     $sql_mapel = DB::table("guru_mapel as gm")
    //         ->select("m.nama_mapel", 'gm.kode_guru_mapel', 'gm.status', 'gm.kode_guru_mapel', 'g.kode_guru')
    //         ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
    //         ->join('guru as g', 'g.guru_id', '=', 'gm.guru_id')
    //         ->where("gm.guru_id", $guru_id)
    //         ->get();

    //     $sql_guru = DB::table('guru')
    //         ->select("nama")
    //         ->where("guru_id", $guru_id)
    //         ->first();

    //     $dataToView  = [
    //         'mapels' => $sql_mapel,
    //         'guru' => $sql_guru,
    //     ];

    //     return response()->json($dataToView);
    // }

    public function guruMapel_edit($guru_mapel_id)
    {
        if (!isset($guru_mapel_id)) {
            return redirect()->back();
        }

        $sql_guru_mapel = DB::table('guru_mapel as gm')
            ->select("g.nama", 'm.nama_mapel', 'gm.*')
            ->join("guru as g", 'g.guru_id', '=', 'gm.guru_id')
            ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
            ->where("gm.guru_mapel_id", $guru_mapel_id)
            ->first();

        $sql_mapels = DB::table("mapel")
            ->where('status', 1)
            ->get();

        $dataToView = [
            'guruMapel' => $sql_guru_mapel,
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
                'guru_mapel_id' => "required",
                'kode_guru_mapel' => "required|integer",
                'mapel_id' => "required",
                'status' => "required",
            ],
            [
                'guru_mapel_id.required' => "Guru Mapel wajib di isi",
                'kode_guru_mapel.required' => "Kode Guru Mapel wajib di isi",
                'kode_guru_mapel.integer' => "Kode Guru Mapel wajib angka",
                'mapel_id.required' => "Mapel wajib di isi",
                'status.required' => "Status wajib di isi",
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        DB::beginTransaction();

        $dataUpdate = [];

        $sql_guruMapel = DB::table("guru_mapel")->where("guru_mapel_id", $request->guru_mapel_id)->first();

        if ($sql_guruMapel->kode_guru_mapel != $request->kode_guru_mapel) {
            // check apakah ada kode guru mapel yg sama
            $sql_checkDuplicate_KodeGuruMapel = DB::table("guru_mapel")
                ->select("guru_mapel_id")
                ->where("guru_id", $request->guru_id)
                ->where("kode_guru_mapel", $request->kode_guru_mapel)
                ->first();

            if ($sql_checkDuplicate_KodeGuruMapel) {
                DB::rollBack();
                return redirect()->back()->withInput()->with("duplicateKodeGuruMapel", "Gagal ! Kode Guru mapel sudah di gunakan");
            }

            $dataUpdate['kode_guru_mapel'] = $request->kode_guru_mapel;
        }

        if ($sql_guruMapel->mapel_id != $request->mapel_id) {
            // check apakah ada mapel duplicate
            $sql_checkDuplicate_mapel = DB::table('guru_mapel')
                ->where("guru_id", $request->guru_id)
                ->where("mapel_id", $request->mapel_id)
                ->first();

            if ($sql_checkDuplicate_mapel) {
                DB::rollBack();
                return redirect()->back()->withInput()->with("duplicateMapel", "Gagal ! Mapel yg di pilih sudah di ajar oleh guru");
            }

            $dataUpdate["mapel_id"] = $request->mapel_id;
        }

        if ($sql_guruMapel->status != $request->mapel_id) {
            $dataUpdate['status'] = $request->status;
        }

        if (!empty($dataUpdate)) {
            $dataUpdate['updated_by'] = auth()->guard("admin")->user()->user_id;
            GuruMapel::where('guru_mapel_id', $request->guru_mapel_id)
                ->update($dataUpdate);
        }

        DB::commit();

        return redirect()->back()->with("successUpdate", "successUpdate")->withInput();
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

            // $columnsSearch = ['u.nama', 'k.nama_kelas'];
            $columnsSearch = ['g.nama', 'k.nama_kelas'];
            $table = DB::table("wali_kelas as wk");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            $query = $table->select('j.nama_jurusan', 'k.nama_kelas', 'g.nama', 'g.username', 'wk.wali_kelas_id', 'wk.tingkatan')
                ->join('jurusan as j', 'j.jurusan_id', '=', 'wk.jurusan_id')
                ->join('kelas as k', 'k.kelas_id', '=', 'wk.kelas_id')
                ->join('guru as g', 'g.guru_id', 'wk.guru_id')
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
                    $subData['username'] = $row->username;
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

        $sql_guruWali = DB::table('wali_kelas')
            ->select('guru_id')
            ->where('tahun_ajaran_id', $tahun_ajaran->tahun_ajaran_id);

        $sql_guru = DB::table("guru as g")
            ->where("status", 1)
            ->whereNotIn("guru_id", $sql_guruWali)
            ->get();

        $sql_kelas = Kelas::with([
            'jurusan' => function ($query) {
                $query->select("jurusan_id", 'nama_jurusan')
                    ->where("status", 1);
            }
        ])
            ->where("status", 1)
            ->get();

        $dataToView = [
            'tingkatans' => $this->tingkatans,
            'kelases' => $sql_kelas,
            'gurus' => $sql_guru,
        ];

        return view("pages.guru.waliKelas.add", $dataToView);
    }

    public function waliKelas_store(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'tingkatan' => "required",
                'kelas_id' => "required",
                'guru_id' => "required",
            ],
            [
                "tingkatan.required" => "Tingkatan wajib di isi",
                'kelas_id.required' => "Nama Kelas wajib di isi",
                'guru_id.required' => "Nama GUru wajib di isi",
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        $tahun_ajaran = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

        // [0] => jurusan_id
        // [1] => kelas_id
        $arrKelas = explode("|", $request->kelas_id);

        $sql_check = DB::table("wali_kelas")
            ->select('wali_kelas_id')
            ->where('tingkatan', $request->tingkatan)
            ->where('jurusan_id', $arrKelas[0])
            ->where('kelas_id', $arrKelas[1])
            ->where('tahun_ajaran_id', $tahun_ajaran->tahun_ajaran_id)
            ->first();

        if ($sql_check) {
            return redirect()->back()->with(['failed' => "failed"]);
        }

        WaliKelas::create([
            'tingkatan' => $request->tingkatan,
            'jurusan_id' => $arrKelas[0],
            'kelas_id' => $arrKelas[1],
            'guru_id' => $request->guru_id,
            'tahun_ajaran_id' => $tahun_ajaran->tahun_ajaran_id,
            'created_by' => auth()->guard("admin")->user()->user_id,
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
            // ->join('users as u', 'u.user_id', '=', 'wk.user_id')
            ->join("guru as g", 'g.guru_id', '=', 'wk.guru_id')
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
            ->select('guru_id')
            ->where('tahun_ajaran_id', $tahun_ajaran->tahun_ajaran_id)
            ->where('guru_id', '!=', $sql_waliKelas->guru_id);

        $sql_guru = DB::table("guru")
            ->select('user_id', 'nama', 'guru_id')
            ->where('status', 1)
            ->whereNotIn('guru_id', $sql_guruWaliKelas)
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
                'guru_id' => "required"
            ],
            [
                'guru_id.required' => "Nama Guru wajib di isi",
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        DB::table("wali_kelas")
            ->where('wali_kelas_id', $request->wali_kelas_id)
            ->update([
                'guru_id' => $request->guru_id
            ]);

        return redirect()->back()->with("successUpdate", 'successUpdate');
    }

    public function importGuru(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'excel_file' => "required|mimes:xlsx",
            ],
            [
                'excel_file.mimes' => 'Extensi file yg di import wajib .xlsx',
                'excel_file.required' => "File yg ingin di import wajib di isi"
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $file = $request->file("excel_file");

        $guru = new GuruImport;
        $guru->import($file);

        return redirect('guru')->with('successImport', "Data guru berhasil di import");
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

    public function importGuruMapel(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'excel_file' => "required|mimes:xlsx"
            ],
            [
                'excel_file.mimes' => 'Extensi file yg di import wajib .xlsx',
                'excel_file.required' => "File yg ingin di import wajib di isi"
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator->errors())->withInput();
        }

        $fileName = $request->file("excel_file");

        $guruMapelImport = new GuruMapelImport;
        $guruMapelImport->import($fileName);

        return redirect()->back()->with("success_import_guruMapel", "Data Guru Mapel berhasil di import");
    }

    public function waliKelas_import(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'excel_file' => "required|mimes:xlsx"
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with("failed_import", 'Gagal! extensi file yg di import harus .xlsx');
        }

        $fileName = $request->file("excel_file");

        $guruMapelImport = new waliKelasImport;
        $guruMapelImport->import($fileName);

        return redirect()->back()->with("success_import", "Data Wali kelas berhasil di import");
    }

    public function getGuruMapelByGuruMapelId(Request $request)
    {
        if ($request->guruMapelId == null) {
            $dataResponse = [
                'status' => false,
                'message' => "emptyGuruMapelId",
            ];

            return response()->json($dataResponse);
        }

        $sql_guruMapel = DB::table("guru_mapel as gm")
            ->select('g.nama', 'm.nama_mapel')
            ->join('guru as g', 'g.guru_id', '=', 'gm.guru_id')
            ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
            ->where("gm.guru_mapel_id", $request->guruMapelId)
            ->first();

        $dataResponse = [
            'status' => true,
            'message' => "success",
            'data' => $sql_guruMapel,
        ];

        return response()->json($dataResponse);
    }
}
