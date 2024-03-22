<?php

namespace App\Imports;

use App\Models\Admin;
use App\Models\Guru;
use App\Models\Kelas;
use App\Models\Operator;
use App\Models\Siswa;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Concerns\Importable;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithStartRow;

class SiswaImport implements ToCollection, WithStartRow
{
    use Importable;

    protected $username;
    protected $username_DB;
    protected $kelas;
    protected $last_user_id;

    public function __construct()
    {
        $superadmin = Admin::select("username")->get()->toArray();
        $operator = Operator::select("username")->get()->toArray();
        $guru = Guru::select("username")->get()->toArray();
        $siswa = Siswa::select("username")->get()->toArray();

        $this->username_DB = collect(array_merge($superadmin, $operator, $guru, $siswa));
        $this->kelas = Kelas::select("kelas_id", "jurusan_id")->get();
        $this->last_user_id = User::select("user_id")->orderBy("user_id", "DESC")->first()->user_id;
    }

    public function collection(Collection $rows)
    {
        $validator =  Validator::make(
            $rows->toArray(),
            [
                '*.0' => "required",
                '*.1' => "required",
                '*.2' => "required",

            ],
            [
                '*.0' => "Nama Siswa wajib di isi",
                '*.1' => "Tingkatan wajib di isi",
                '*.2' => "Kode Kelas wajib di isi",
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->with("import_failed", "Gagal ! Terjadi kesalahan saat import");
        }

        if (count($rows) > 200) {
            return redirect()->back()->with("import_failed", "Gagal! Row yg di import tidak boleh lebih dari 200");
        }

        $data_userId = [];
        $data_siswa = [];

        DB::beginTransaction();

        foreach ($rows as $row) {
            if ($row[0] == null || $row[1] == null || $row[2] == null) {
                DB::rollBack();
                return redirect()->back()->with("import_failed", "Import gagal silahkan cek kembali datanya!");
                return null;
            }

            $kelas_id = $row[2];
            $tingkatan = $this->checkTingkatan($row[1]);
            $check_kelas = $this->kelas->where("kelas_id", $kelas_id)->first();

            if ($check_kelas == null) {
                DB::rollBack();
                return redirect()->back()->with("import_failed", "Gagal! kode Kode Kelas " . $kelas_id . " tidak ditemukan!");
            }

            // Check tingkatan
            if ($tingkatan == null) {
                DB::rollBack();
                return redirect()->back()->with("import_failed", "Gagal! " . strtoupper($row[1]) . ' bukan termasuk tingkatan');
            }

            $str_namaReplace = [
                '`', "'", '"'
            ];

            $nama_siswa = str_replace($str_namaReplace, "", $row[0]);

            //buat username dan check apakah username ada atau tidak di database 
            $username_isUnique = $this->checkIfUsernameExist($nama_siswa);

            if ($username_isUnique) {
                $this->last_user_id++;

                $data_userId[] = [
                    'user_id' => $this->last_user_id,
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now(),
                    'created_by' => auth()->guard("admin")->user()->user_id,
                ];

                $data_siswa[] = [
                    'user_id' => $this->last_user_id,
                    'username' => $this->username,
                    'nama' => $nama_siswa,
                    'password' => Hash::make("123456"),
                    'role' => 3,
                    'status' => 1,
                    'tingkatan' => $tingkatan,
                    'jurusan_id' => $check_kelas->jurusan_id,
                    'kelas_id' => $kelas_id,
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now(),
                    'created_by' => Auth::guard("admin")->user()->user_id
                ];
            }
        }

        try {
            User::insert($data_userId);
            Siswa::insert($data_siswa);
            DB::commit();
            return redirect()->back()->with("import_success", "Data Siswa berhasil di import!");
        } catch (QueryException $ex) {
            DB::rollBack();
            return redirect()->back()->with("import_failed", "Import gagal silahkan cek kembali datanya!");
        }
    }

    public function startRow(): int
    {
        return 3;
    }

    public function makeUsername($username)
    {
        $replace = [
            ' ', '\t', '\n', '\r', '.', ','
        ];

        return strtolower(str_replace($replace, "", $username) . rand(10, 100) . rand(0, 10));
    }

    public function checkIfUsernameExist($row_username)
    {
        $this->username = $this->makeUsername($row_username);
        $checkUser = $this->username_DB->where("username", $this->username)->first();
        if ($checkUser != null) {
            $this->checkIfUsernameExist($row_username);
            return;
        }

        return true;
    }

    public function checkTingkatan($tingkatan)
    {
        if (strtoupper($tingkatan) == "X") {
            return 1;
        }

        if (strtoupper($tingkatan) == "XI") {
            return 2;
        }

        if (strtoupper($tingkatan) == "XII") {
            return 3;
        }

        return null;
    }
}
