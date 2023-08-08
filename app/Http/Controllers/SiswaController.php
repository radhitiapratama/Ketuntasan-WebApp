<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Models\Jurusan;
use App\Models\Kelas;
use App\Models\TahunAjaran;
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

            if ($request->jurusan_id != null) {
                $query->where("u.jurusan_id", $request->jurusan_id);
            }

            if ($request->kelas_id != null) {
                $query->where('u.kelas_id', $request->kelas_id);
            }

            if ($request->status != null) {
                $query->where('u.status', $request->status);
            }

            $countRecords = $query->count();

            $result = $query
                ->offset($request->start)
                ->limit($request->length)
                ->orderByRaw("u.created_at DESC,u.status ASC")
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
                        $subData['tingkatan'] = "X";
                    }

                    if ($row->tingkatan == 2) {
                        $subData['tingkatan'] = "XI";
                    }

                    if ($row->tingkatan == 3) {
                        $subData['tingkatan'] = "XII";
                    }

                    $subData['jurusan'] =  $row->nama_jurusan;
                    $subData['kelas'] =  $row->nama_kelas;

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

        $sql_jurusan = DB::table("jurusan")
            ->select('jurusan_id', 'nama_jurusan')
            ->where('status', 1)
            ->get();

        $dataToView = [
            'tingkatans' => $this->tingkatans,
            'jurusans' => $sql_jurusan,
            'statuses' => $this->statuses
        ];

        return view("pages.siswa.index", $dataToView);
    }

    public function add()
    {
        $sql_jurusan = Jurusan::where("status", 1)->get();

        $sql_user = User::select("user_id", 'username')
            ->where("role", 3)
            ->whereNull("tingkatan")
            ->whereNull("jurusan_id")
            ->whereNull("kelas_id")
            ->get();

        $dataToView = [
            'tingkatans' => $this->tingkatans,
            'jurusans' => $sql_jurusan,
            'siswas' => $sql_user,
        ];

        return view("pages.siswa.add", $dataToView);
    }

    public function store(Request $request)
    {
        $validator  = Validator::make(
            $request->all(),
            [
                'tingkatan' => "required",
                'jurusan_id' => "required",
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

        User::create([
            'username' => $request->username,
            'nama' => $request->nama_siswa,
            'password' => Hash::make($request->password),
            'role' => 3,
            'tingkatan' => $request->tingkatan,
            'jurusan_id' => $request->jurusan_id,
            'kelas_id' => $request->kelas_id
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

        $sql_jurusan = Jurusan::where('status', 1)->get();

        $dataToView = [
            'siswa' => $sql_siswa,
            'tingkatans' => $this->tingkatans,
            'jurusans' => $sql_jurusan,
            'statuses' => $this->statuses,
        ];

        return view("pages.siswa.edit", $dataToView);
    }

    public function update(Request $request)
    {
        $validated = $request->validate([
            'user_id' => "required",
            'hide_tingkatan' => "required",
            'hide_jurusan' => "required",
            'hide_kelas' => "required",
            'tingkatan_id' => "required",
            'jurusan_id' => "required",
            'kelas_id' => "required",
            'username' => 'required',
            'nama' => "required",
            'status' => 'required',
        ]);

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

        if ($user->jurusan_id != $request->jurusan_id) {
            $dataUpdate['jurusan'] = $request->jurusan_id;
        }

        if ($user->kelas_id != $request->kelas_id) {
            $dataUpdate['kelas_id'] = $request->kelas_id;
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

        $sql_jurusan = Jurusan::where("status", 1)->get();

        $dataToView = [
            'jurusans' => $sql_jurusan,
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

    public function getDataSiswa(Request $request)
    {
        // return response()->json($request->all());


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

        $query = $table->select(
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
            ->where('u.jurusan_id', $request->jurusan_id)
            ->where('u.kelas_id', $request->kelas_id);

        $countFiltered = $query->count();

        $result = $query->offset($request->start)
            ->limit($request->length)
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

                $dataResponse[] = $subData;
            }
        }

        return response()->json([
            'draw' => $request->draw,
            'recordsFiltered' => $countFiltered,
            'recordsTotal' => $countFiltered,
            'data' => $dataResponse,
        ]);
    }
}
