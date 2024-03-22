<?php

namespace App\Http\Controllers;

use App\Imports\SiswaImport;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Models\Jurusan;
use App\Models\Kelas;
use App\Models\Ketuntasan;
use App\Models\Siswa;
use App\Models\TahunAjaran;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx\Rels;

class SiswaController extends Controller
{
    protected $tahun;

    protected $statuses = [
        '1' => "Aktif",
        '0' => "Nonaktif",
    ];

    protected $tingkatans = [
        '1' => "X",
        '2' => "XI",
        '3' => "XII",
    ];

    public function __construct()
    {
        $this->tahun = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first()->tahun_ajaran_id;
    }

    public function deleteAllKetuntasanSiswa($siswa_id)
    {
        $ketuntasans = Ketuntasan::where("siswa_id", $siswa_id)
            ->where("tahun_ajaran_id", $this->tahun)
            ->pluck("ketuntasan_id")->toArray();

        Ketuntasan::destroy($ketuntasans);
    }

    public function index(Request $request)
    {
        if ($request->ajax()) {
            $columnsSearch = ['s.username', 's.nama'];
            $table = DB::table("siswa as s");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            $query = $table->select(
                's.siswa_id',
                's.username',
                's.nama',
                's.status',
                's.tingkatan',
                'j.nama_jurusan',
                'k.nama_kelas'
            )
                ->join('jurusan as j', 'j.jurusan_id', '=', 's.jurusan_id')
                ->join('kelas as k', 'k.kelas_id', '=', 's.kelas_id')
                ->where('j.status', 1)
                ->where("k.status", 1);


            if ($request->tingkatan != null) {
                $query->where('s.tingkatan', $request->tingkatan);
            }

            if ($request->kelas_id != null) {

                // [0] => jurusan_id
                // [1] => kelas_id
                $arr = explode("|", $request->kelas_id);
                $query->where('s.kelas_id', $arr[1]);
            }

            if ($request->status != null) {
                $query->where('s.status', $request->status);
            }

            $countRecords = $query->count();

            $result = $query
                ->offset($request->start)
                ->limit($request->length)
                ->orderBy("siswa_id", "DESC")
                ->get();

            $dataResponse = [];

            if (!empty($result)) {
                $i = $request->start;
                foreach ($result as $row) {
                    $i++;
                    $subData['no'] = $i;
                    $subData['checkbox_nonaktif'] = "";

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
                        <span class="badge badge-danger p-2">Nonaktif</span>
                    </div>
                    ';

                    if ($row->status == 1) {
                        $subData['status'] = '
                        <div class="text-center">
                            <span class="badge badge-success p-2">Aktif</span>
                        </div>
                        ';

                        $subData['checkbox_nonaktif'] = '
                        <div class="text-center">
                            <input type="checkbox" name="siswa_id[]" class="nonaktif_siswa" value="' . $row->siswa_id . '">
                        </div>
                        ';
                    }

                    $subData['settings'] = '
                    <div class="setting-icons">
                        <a href="/siswa/edit/' . $row->siswa_id . '" class="setting-edit">
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

        // $sql_kelas = Kelas::with([
        //     'jurusan' => function ($query) {
        //         $query->select("jurusan_id", 'nama_jurusan')
        //             ->where("status", 1);
        //     }
        // ])
        //     ->where("kelas.status", 1)
        //     ->get();

        $sql_kelas = DB::table("kelas as k")
            ->join('jurusan as j', 'j.jurusan_id', '=', 'k.jurusan_id')
            ->where('j.status', 1)
            ->where('k.status', 1)
            ->select('j.jurusan_id', 'j.nama_jurusan', 'k.kelas_id', 'k.nama_kelas')
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
        $sql_kelas = DB::table("kelas as k")
            ->join('jurusan as j', 'j.jurusan_id', '=', 'k.jurusan_id')
            ->where('j.status', 1)
            ->where('k.status', 1)
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
                'username' => "required|unique:siswa,username",
                'nama_siswa' => "required",
                'password' => "required|min:6",
            ],
            [
                'tingkatan.required' => "Tingkatan Wajib di isi",
                'kelas_id.required' => "Kelas wajib di isi",
                'username.required' => "Username wajib di isi",
                'username.unique' => "Username sudah di gunakan",
                'nama_siswa.required' => "Nama Siswa wajib di isi",
                'password.required' => "Password wajib di isi",
                'password.min' => "Password minimal 6 huruf",
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

        $user =   User::create([
            'created_by' => auth()->guard("admin")->user()->user_id,
        ]);

        $lastInsertUserId = $user->user_id;

        Siswa::create([
            'user_id' => $lastInsertUserId,
            'username' => $request->username,
            'nama' => $request->nama_siswa,
            'password' => Hash::make($request->password),
            'role' => 3,
            'tingkatan' => $request->tingkatan,
            'jurusan_id' => $arr[0],
            'kelas_id' => $arr[1],
            'created_by' => auth()->guard("admin")->user()->user_id
        ]);

        return response()->json([
            'status' => "success",
        ]);
    }

    public function nonaktifkanSiswa(Request $request)
    {
        $siswa_id = $request->siswa_id;

        for ($i = 0; $i < count($siswa_id); $i++) {
            Siswa::where("siswa_id", $siswa_id[$i])
                ->update([
                    'status' => 0,
                ]);
        }

        $dataResponse = [
            'message' => "success",
        ];

        return response()->json($dataResponse);
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

    public function edit($siswa_id)
    {
        $this->deleteAllKetuntasanSiswa($siswa_id);

        if (!isset($siswa_id)) {
            return redirect()->back();
        }

        $sql_siswa = DB::table('siswa as s')
            ->select(
                'j.jurusan_id',
                'j.nama_jurusan',
                'k.kelas_id',
                'k.nama_kelas',
                's.username',
                's.nama',
                's.status',
                's.role',
                's.siswa_id',
                's.tingkatan'
            )
            ->join('jurusan as j', 'j.jurusan_id', '=', 's.jurusan_id')
            ->join('kelas as k', 'k.kelas_id', '=', 's.kelas_id')
            ->where('s.siswa_id', $siswa_id)
            ->first();

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
                'siswa_id' => "required",
                'hide_tingkatan' => "required",
                'hide_jurusan' => "required",
                'hide_kelas' => "required",
                'tingkatan' => "required",
                'kelas_id' => "required",
                'username' => 'required',
                'nama' => "required",
                'status' => 'required',
            ],
            [
                'tingkatan.required' => "Tingkatan wajib di isi",
                'kelas_id.required' => "Kelas wajib di isi",
                'username.required' => "Username wajib di isi",
                'nama.required' => "Nama wajib di isi",
                'status.required' => "Status wajib di isi",
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        try {
            $siswa = Siswa::where("siswa_id", $request->siswa_id)->first();

            DB::beginTransaction();
            $dataUpdate = [];

            // [0] => jurusan_id
            // [1] => kelas_id
            $arr = explode("|", $request->kelas_id);

            if ($siswa->tingkatan != $request->tingkatan || $siswa->jurusan_id != $arr[0] || $siswa->kelas_id != $arr[1]) {
                $this->deleteAllKetuntasanSiswa($request->siswa_id);
            }

            if ($siswa->username != $request->username) {
                // Check username harus unik
                $sql_checkUsername = Siswa::select("siswa_id")
                    ->where("username", $request->username)
                    ->first();

                if ($sql_checkUsername) {
                    return redirect()->back()->with('duplicate_username', 'duplicate_username')->withInput();
                }

                $dataUpdate['username'] = $request->username;
            }

            if ($siswa->tingkatan != $request->tingkatan) {
                $dataUpdate['tingkatan'] = $request->tingkatan;
            }

            if ($siswa->jurusan_id != $arr[0] || $siswa->kelas_id != $arr[1]) {
                $dataUpdate['jurusan_id'] = $arr[0];
                $dataUpdate['kelas_id'] = $arr[1];
            }

            if ($siswa->nama != $request->nama) {
                $dataUpdate['nama'] = $request->nama;
            }

            if ($siswa->status != $request->status) {
                $dataUpdate['status'] = $request->status;
            }

            if (!empty($dataUpdate)) {
                $dataUpdate['updated_by'] = auth()->guard("admin")->user()->user_id;

                DB::table('siswa')
                    ->where("siswa_id", $request->siswa_id)
                    ->update($dataUpdate);
            }

            DB::commit();

            return redirect()->back()->with("successUpdate", "successUpdate");
        } catch (\Exception $ex) {
            DB::rollBack();
            return redirect()->back()->withInput()->with("failed_update", "Gagal mengupdate data siswa silahkan coba lagi");
        }
    }

    public function naikKelas(Request $request)
    {
        if ($request->ajax()) {
            $columnsSearch = ['s.username', 's.nama'];
            $table = DB::table("siswa as s");

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
                's.username',
                's.nama',
                's.siswa_id',
                's.tingkatan',
                's.status',
                'j.nama_jurusan',
                'k.nama_kelas'
            )
                ->join('jurusan as j', 'j.jurusan_id', '=', 's.jurusan_id')
                ->join('kelas as k', 'k.kelas_id', '=', 's.kelas_id')
                ->where('s.role', 3)
                ->where('s.status', 1)
                ->where('s.tingkatan', $request->tingkatan)
                ->where('s.kelas_id', $arr[1])
                ->orderByRaw("s.nama ASC")
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
                        <input type="checkbox" name="check_siswa_id[]" id="check_siswa_id" value="' . $row->siswa_id . '">
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

        $sql_kelas = DB::table("kelas as k")
            ->join('jurusan as j', 'j.jurusan_id', '=', 'k.jurusan_id')
            ->where('j.status', 1)
            ->where('k.status', 1)
            ->get();
        $dataToView = [
            'kelases' => $sql_kelas,
            'tingkatans' => $this->tingkatans,
        ];

        return view('pages.siswa.naikKelas.index', $dataToView);
    }

    public function doNaikKelas(Request $request)
    {
        $siswa_id = $request->check_siswa_id;

        for ($i = 0; $i < count($siswa_id); $i++) {
            $sql_user = Siswa::select("tingkatan")
                ->where("siswa_id", $siswa_id[$i])
                ->first();

            //jika tingkatan nya 3 (kls 12) update status user nya
            if ($sql_user->tingkatan == 3) {
                Siswa::where("siswa_id", $siswa_id[$i])
                    ->update([
                        'status' => 0,
                        'updated_by' => auth()->guard("admin")->user()->user_id
                    ]);

                continue;
            }

            Siswa::where("siswa_id", $siswa_id[$i])
                ->update([
                    'tingkatan' => $sql_user->tingkatan + 1,
                ]);
        }

        return redirect("siswa/naik-kelas")->with("successNaikKelas", 'successNaikKelas');
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
            return redirect()->back()->withErrors($validator->errors())->withInput();
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
