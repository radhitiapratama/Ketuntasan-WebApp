<?php

namespace App\Http\Controllers;

use App\Imports\SiswaImport;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Models\Jurusan;
use App\Models\Kelas;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class SiswaController extends Controller
{
    protected $statuses = [
        '1' => "Aktif",
        '0' => "Nonaktif",
    ];

    protected $tingkatans = [
        '1' => "X",
        '2' => "XI",
        '3' => "XII",
    ];

    public function index(Request $request)
    {
        if ($request->ajax()) {
            $columnsSearch = ['u.username', 'u.nama'];
            $table = DB::table("users as u");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            $query = $table->select(
                'u.user_id',
                'u.username',
                'u.nama',
                'u.status',
                'u.tingkatan',
                'j.nama_jurusan',
                'k.nama_kelas'
            )
                ->join('jurusan as j', 'j.jurusan_id', '=', 'u.jurusan_id')
                ->join('kelas as k', 'k.kelas_id', '=', 'u.kelas_id')
                ->where('u.role', 3);

            if ($request->tingkatan != null) {
                $query->where('u.tingkatan', $request->tingkatan);
            }

            if ($request->kelas_id != null) {

                // [0] => jurusan_id
                // [1] => kelas_id
                $arr = explode("|", $request->kelas_id);
                $query->where('u.kelas_id', $arr[1]);
            }

            if ($request->status != null) {
                $query->where('u.status', $request->status);
            }

            $countRecords = $query->count();

            $result = $query
                ->offset($request->start)
                ->limit($request->length)
                ->orderByRaw("u.user_id DESC,u.status ASC")
                ->get();

            $dataResponse = [];

            if (!empty($result)) {
                $i = $request->start;
                foreach ($result as $row) {
                    $i++;
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

                    $subData['kelas'] = $row->nama_jurusan . " | " .  $row->nama_kelas;

                    $subData['status'] = '
                    <div class="text-center">
                        <span class="badge badge-success p-2">Aktif</span>
                    </div>
                    ';

                    if ($row->status == 0) {
                        $subData['status'] = '
                    <div class="text-center">
                        <span class="badge badge-danger p-2">Nonaktif</span>
                    </div>
                    ';
                    }

                    $subData['settings'] = '
                    <div class="setting-icons">
                        <a href="/siswa/edit/' . $row->user_id . '" class="setting-edit">
                            <i class="ri-pencil-line"></i>
                        </a>
                    </div>
                ';

                    $dataResponse[] = $subData;
                }
            }

            return response()->json([
                'draw' => $request->draw,
                'recordsFiltered' => $countRecords,
                'recordsTotal' => $countRecords,
                'data' => $dataResponse,
                'last' => $query->toSql(),
            ]);
        }

        $sql_kelas = Kelas::with([
            'jurusan' => function ($query) {
                $query->select("jurusan_id", 'nama_jurusan')
                    ->where("status", 1);
            }
        ])
            ->where("kelas.status", 1)
            ->get();

        $dataToView = [
            'tingkatans' => $this->tingkatans,
            'kelases' => $sql_kelas,
            'statuses' => $this->statuses
        ];

        return view("pages.siswa.index", $dataToView);
    }

    public function add()
    {
        $sql_kelas = Kelas::with([
            'jurusan' => function ($query) {
                $query->select("jurusan_id", "nama_jurusan")
                    ->where("status", 1);
            }
        ])->where("status", 1)
            ->get();

        $dataToView = [
            'tingkatans' => $this->tingkatans,
            "kelases" => $sql_kelas,
        ];

        return view("pages.siswa.add", $dataToView);
    }

    public function store(Request $request)
    {
        $validator  = Validator::make(
            $request->all(),
            [
                'tingkatan' => "required",
                'kelas_id' => "required",
                'username' => "required|unique:users,username",
                'nama_siswa' => "required",
                'password' => "required|min:6",
            ],
            [
                'required' => ":attribute wajib di isi",
                'unique' => ":attribute sudah di gunakan"
            ]
        );

        if ($validator->fails()) {
            return response()->json([
                'error' => $validator->errors(),
                'message' => "failed",
            ]);
        }

        // [0] => jurusan_id
        // [1] => kelas_id
        $arr = explode("|", $request->kelas_id);

        User::create([
            'username' => $request->username,
            'nama' => $request->nama_siswa,
            'password' => Hash::make($request->password),
            'role' => 3,
            'tingkatan' => $request->tingkatan,
            'jurusan_id' => $arr[0],
            'kelas_id' => $arr[1]
        ]);

        return response()->json([
            'status' => "success",
        ]);
    }

    public function naikKelasGetSiswaByKelas(Request $request)
    {
        $tingkatan_id = $request->tingkatan_id;
        $jurusan_id = $request->jurusan_id;
        $kelas_id = $request->kelas_id;

        $dataSiswa = [];

        $sql_siswa = DB::table("users as u")
            ->select(
                "u.user_id",
                'u.nama',
                'u.username',
                'u.tingkatan',
                'j.nama_jurusan',
                'k.nama_kelas',
            )
            ->join('jurusan as j', 'j.jurusan_id', '=', 'u.jurusan_id')
            ->join('kelas as k', 'k.kelas_id', '=', 'u.kelas_id')
            ->where('u.tingkatan', $tingkatan_id)
            ->where('u.jurusan_id', $jurusan_id)
            ->where('u.kelas_id', $kelas_id)
            ->where('u.status', 1)
            ->groupBy('u.user_id')
            ->get();

        if (!empty($sql_siswa)) {
            $dataSiswa = $sql_siswa;
        }

        $dataResponse = [
            'dataSiswa' => $dataSiswa,
        ];

        return response()->json($dataResponse);
    }

    public function edit($user_id)
    {
        if (!isset($user_id)) {
            return redirect()->back();
        }

        $sql_siswa = DB::table('users as u')
            ->select(
                'j.jurusan_id',
                'j.nama_jurusan',
                'k.kelas_id',
                'k.nama_kelas',
                'u.username',
                'u.nama',
                'u.status',
                'u.role',
                'u.user_id',
                'u.tingkatan'
            )
            ->join('jurusan as j', 'j.jurusan_id', '=', 'u.jurusan_id')
            ->join('kelas as k', 'k.kelas_id', '=', 'u.kelas_id')
            ->where('u.user_id', $user_id)
            ->first();

        if ($sql_siswa->role != 3) {
            return redirect()->back();
        }

        // $sql_jurusan = Jurusan::where('status', 1)->get();

        $sql_kelas = Kelas::with([
            'jurusan' => function ($query) {
                $query->select("jurusan_id", "nama_jurusan")
                    ->where("status", 1);
            }
        ])->where("status", 1)
            ->get();

        $dataToView = [
            'siswa' => $sql_siswa,
            'tingkatans' => $this->tingkatans,
            // 'jurusans' => $sql_jurusan,
            "kelases" => $sql_kelas,
            'statuses' => $this->statuses,
        ];

        return view("pages.siswa.edit", $dataToView);
    }

    public function update(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'user_id' => "required",
                'hide_tingkatan' => "required",
                'hide_jurusan' => "required",
                'hide_kelas' => "required",
                'tingkatan_id' => "required",
                'kelas_id' => "required",
                'username' => 'required',
                'nama' => "required",
                'status' => 'required',
            ],
            [
                'required' => ":attribute wajib di isi"
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        $user = User::where("user_id", $request->user_id)->first();

        $dataUpdate = [];

        if ($user->username != $request->username) {
            $sql_checkUsername = User::select("user_id")
                ->where("username", $request->username)
                ->first();

            if ($sql_checkUsername) {
                return redirect()->back()->with('duplicate_username', 'duplicate_username');
            }

            $dataUpdate['username'] = $request->username;
        }

        if ($user->tingkatan_id != $request->tingkatan_id) {
            $dataUpdate['tingkatan'] = $request->tingkatan_id;
        }

        // [0] => jurusan_id
        // [1] => kelas_id
        $arr = explode("|", $request->kelas_id);

        if ($user->jurusan_id != $arr[0] || $user->kelas_id != $arr[1]) {
            $dataUpdate['jurusan_id'] = $arr[0];
            $dataUpdate['kelas_id'] = $arr[1];
        }

        if ($user->nama != $request->nama) {
            $dataUpdate['nama'] = $request->nama;
        }

        if ($user->status != $request->status) {
            $dataUpdate['status'] = $request->status;
        }

        if (!empty($dataUpdate)) {
            DB::table("users")
                ->where('user_id', $request->user_id)
                ->update($dataUpdate);
        }

        return redirect()->back()->with("successUpdate", "successUpdate");
    }

    public function naikKelas()
    {
        $sql_kelas = Kelas::with([
            'jurusan' => function ($query) {
                $query->select("jurusan_id", 'nama_jurusan')
                    ->where("status", 1);
            }
        ])
            ->where("kelas.status", 1)
            ->get();


        $dataToView = [
            'kelases' => $sql_kelas,
            'tingkatans' => $this->tingkatans,
        ];

        return view('pages.siswa.naikKelas.index', $dataToView);
    }

    public function doNaikKelas(Request $request)
    {
        $user_id = $request->check_siswa_id;

        for ($i = 0; $i < count($user_id); $i++) {
            $sql_user = User::select("tingkatan")
                ->where("user_id", $user_id[$i])
                ->first();

            //jika tingkatan nya 3 (kls 12) update status user nya
            if ($sql_user->tingkatan == 3) {
                DB::table("users")
                    ->where('user_id', $user_id[$i])
                    ->update([
                        'status' => 0,
                    ]);
                continue;
            }

            DB::table("users")
                ->where('user_id', $user_id[$i])
                ->update([
                    'tingkatan' => $sql_user->tingkatan + 1,
                ]);
        }

        return redirect("/siswa-naik-kelas")->with("successNaikKelas", 'successNaikKelas');
    }

    public function getDataSiswaNaikKelas(Request $request)
    {
        $columnsSearch = ['u.username', 'u.nama'];
        $table = DB::table("users as u");

        if ($request->input("search.value")) {
            $table->where(function ($q) use ($columnsSearch, $request) {
                foreach ($columnsSearch as $column) {
                    $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                }
            });
        }

        // [0] => jurusan_id
        // [1] => kelas_id
        $arr = explode("|", $request->kelas_id);

        $result = $table->select(
            'u.username',
            'u.nama',
            'u.user_id',
            'u.tingkatan',
            'u.status',
            'j.nama_jurusan',
            'k.nama_kelas'
        )
            ->join('jurusan as j', 'j.jurusan_id', '=', 'u.jurusan_id')
            ->join('kelas as k', 'k.kelas_id', '=', 'u.kelas_id')
            ->where('u.role', 3)
            ->where('u.status', 1)
            ->where('u.tingkatan', $request->tingkatan)
            ->where('u.kelas_id', $arr[1])
            ->orderByRaw("u.nama ASC")
            ->get();

        $dataResponse = [];

        if (!empty($result)) {
            $i = $request->start;
            foreach ($result as $row) {
                $i++;
                $subData = [];
                $subData['no'] = $i;
                $subData['checkbox'] = '
                <div class="text-center">
                    <input type="checkbox" name="check_siswa_id[]" id="check_siswa_id" value="' . $row->user_id . '">
                </div>
                ';
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

    public function import(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'file_import' => 'required|mimes:xlsx'
            ],
            [
                'file_import.mimes' => 'Extensi file yg di import wajib .xlsx',
                'file_import.required' => "File yg ingin di import wajib di isi"
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $file = $request->file('file_import');

        $siswa = new SiswaImport;
        $siswa->import($file);

        return redirect()->back()->with("successImport", "Data Siswa berhasil di import");
    }

    public function getDataSiswaByKelas(Request $request)
    {
        // [0] => jurusan_id
        // [1] => kelas_id 
        $arr = explode("|", $request->kelas);
        return response()->json($arr);
    }
}
