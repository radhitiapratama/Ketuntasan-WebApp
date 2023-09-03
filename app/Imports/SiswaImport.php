<?php

namespace App\Imports;

use App\Models\Jurusan;
use App\Models\Kelas;
use App\Models\Siswa;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

use Maatwebsite\Excel\Concerns\Importable;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithStartRow;

class SiswaImport implements ToCollection, WithStartRow
{
    use Importable;

    private $username;
    private $siswa_username_DB;

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
            return redirect()->back()->with("validation_failed", "Gagal ! Terjadi kesalahan saat import");
        }

        if (count($rows) > 200) {
            session()->flash("max_count", "Gagal! Row yg di import tidak boleh lebih dari 200");
            return;
        }

        $sql_username_guru = DB::table("guru")
            ->select('username');

        $sql_username_admin = DB::table("admin")
            ->select('username');

        $this->siswa_username_DB = DB::table("siswa")
            ->select('username')
            ->union($sql_username_guru)
            ->union($sql_username_admin)
            ->get()->toArray();

        $sql_kelas = DB::table("kelas as k")
            ->select('k.kelas_id', 'j.jurusan_id')
            ->join('jurusan as j', 'j.jurusan_id', '=', 'k.jurusan_id')
            ->where("k.status", 1)
            ->get()->toArray();

        $sql_getLastUserId = DB::table('users')
            ->select('user_id')
            ->orderBy("user_id", 'DESC')
            ->first();

        $last_user_id = $sql_getLastUserId->user_id;

        $arr_kelas_id = array_column($sql_kelas, 'kelas_id');
        $arr_jurusan_id = array_column($sql_kelas, "jurusan_id");

        $stringReplace = [
            '[', ']'
        ];

        $data_userId = [];
        $data_siswa = [];

        DB::beginTransaction();


        foreach ($rows as $row) {
            $kelas_id = str_replace($stringReplace, "", $row[2]);

            $index_kelas_id = array_keys($arr_kelas_id, $kelas_id);

            if (!$index_kelas_id) {
                session()->flash("kode_kelas_null", "Gagal! Kode Kelas " . $kelas_id . " tidak ditemukan");
                DB::rollBack();
                return;
            }

            $jurusan_id = $arr_jurusan_id[$index_kelas_id[0]];

            $tingkatan = null;

            $row_tingkatan = strtoupper($row[1]);

            if ($row_tingkatan == "X") {
                $tingkatan = 1;
            }

            if ($row_tingkatan == "XI") {
                $tingkatan = 2;
            }

            if ($row_tingkatan == "XII") {
                $tingkatan = 3;
            }

            // Check tingkatan
            if ($tingkatan == null) {
                session()->flash("invalid_tingkatan", "Gagal! " . $row_tingkatan . ' bukan termasuk tingkatan');
                DB::rollBack();
                return;
            }

            //buat username dan check apakah username ada atau tidak di database 
            $username_isUnique = $this->checkIfUsernameExist($row[0]);

            if ($username_isUnique) {
                $last_user_id++;

                $data_userId = [
                    'user_id' => $last_user_id,
                    'created_by' => auth()->guard("admin")->user()->user_id,
                ];

                $data_siswa = [
                    'user_id' => $last_user_id,
                    'username' => $this->username,
                    'nama' => $row[0],
                    'password' => Hash::make("123456"),
                    'role' => 3,
                    'status' => 1,
                    'tingkatan' => $tingkatan,
                    'jurusan_id' => $jurusan_id,
                    'kelas_id' => $kelas_id,
                    'created_by' => auth()->guard("admin")->user()->user_id
                ];
            }
        }

        User::create($data_userId);
        Siswa::create($data_siswa);

        DB::commit();
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
        $checkUser =  in_array($this->username, $this->siswa_username_DB);
        if (!empty($checkUser)) {
            $this->checkIfUsernameExist($row_username);
            return;
        }

        return true;
    }

    public function startRow(): int
    {
        return 3;
    }
}
