<?php

namespace App\Imports;

use App\Models\Jurusan;
use App\Models\Kelas;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\SkipsErrors;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Concerns\SkipsOnError;

class SiswaImport implements
    ToModel,
    WithHeadingRow,
    WithValidation,
    SkipsOnError
{
    use Importable, SkipsErrors;

    private $users, $jurusans, $kelases, $duplicateUsername, $username;

    public function __construct()
    {
        $this->users = User::select("user_id", 'username')->where("role", 3)->get();
        $this->jurusans = Jurusan::select("jurusan_id", 'nama_jurusan')->where("status", 1)->get();
        $this->kelases = Kelas::select("kelas_id", 'nama_kelas')->where("status", 1)->get();
    }

    public function model(array $row)
    {
        if (strtoupper($this->removeWhiteSpace($row['tingkatan'])) == "X") {
            $tingkatan = "1";
        }

        if (strtoupper($this->removeWhiteSpace($row['tingkatan'])) == "XI") {
            $tingkatan = "2";
        }

        if (strtoupper($this->removeWhiteSpace($row['tingkatan'])) == "XII") {
            $tingkatan = "3";
        }

        $jurusan = $this->jurusans->where("nama_jurusan", $row['jurusan'])->first();
        $kelas = $this->kelases->where("nama_kelas", $row['kelas'])->first();

        if (!empty($jurusan) && !empty($kelas)) {
            $this->username = $this->makeUsername($row['nama_siswa']);
            $status = $this->checkIfUsernameExist();

            if ($status) {
                return new User([
                    'username' => $this->username,
                    'nama' => $row['nama_siswa'],
                    'tingkatan' => $tingkatan,
                    'jurusan_id' => $jurusan->jurusan_id,
                    'kelas_id' => $kelas->kelas_id,
                    'role' => 3,
                    'password' => Hash::make("123456"),
                ]);
            };
        }
    }

    public function rules(): array
    {
        return [
            '*.username' => "unique:users,username"
        ];
    }

    public function makeUsername($username)
    {
        $replace = [
            ' ', '\t', '\n', '\r', '.', ','
        ];

        return strtolower(str_replace($replace, "", $username) . rand(10, 100) . rand(10, 100)) . rand(0, 10);
    }

    public function checkIfUsernameExist()
    {
        $checkUser = $this->users->where("username", $this->username)->first();
        if (!empty($checkUser)) {
            $this->checkIfUsernameExist();
            return;
        }

        return true;
    }

    public function removeWhiteSpace($param)
    {
        $replace = [
            ' ', '\t', '\n', '\r', '.', ','
        ];

        return str_replace($replace, "", $param);
    }
}
