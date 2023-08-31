<?php

namespace App\Imports;

use App\Models\Jurusan;
use App\Models\Kelas;
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

    public function collection(Collection $rows)
    {
        Validator::make(
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
        )->validate();

        if (count($rows) > 200) {
            session()->flash("max_count", "Gagal! Row yg di import tidak boleh lebih dari 200");
            return;
        }

        $stringReplace = [
            '[', ']'
        ];

        DB::beginTransaction();

        foreach ($rows as $row) {
            $kelas_id = str_replace($stringReplace, "", $row[2]);

            $sql_kelas = Kelas::select("kelas_id", "jurusan_id")
                ->where("kelas_id", $kelas_id)
                ->first();

            // Check apakah kelas ada atau tidak
            if (!$sql_kelas) {
                session()->flash("kode_kelas_null", "Gagal! Kode Kelas " . $kelas_id . " tidak ditemukan");
                DB::rollBack();
                return;
            }

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
                User::create([
                    'username' => $this->username,
                    'nama' => $row[0],
                    'password' => Hash::make("123456"),
                    'role' => 3,
                    'status' => 1,
                    'tingkatan' => $tingkatan,
                    'jurusan_id' => $sql_kelas->jurusan_id,
                    'kelas_id' => $kelas_id,
                    'created_by' => auth()->user()->user_id
                ]);
            }
        }

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
        $checkUser = User::select("user_id")->where("username", $this->username)->first();
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
