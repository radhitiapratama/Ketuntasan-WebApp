<?php

namespace App\Imports;

use App\Models\Guru;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Concerns\WithCalculatedFormulas;

// gunakan WithCalculatedFormulas untuk mendapatkan value dari formulla excel
class GuruImport implements ToCollection, WithStartRow, WithCalculatedFormulas
{

    use Importable;

    public function collection(Collection $rows)
    {
        $validator =  Validator::make(
            $rows->toArray(),
            [
                '*.0' => "required",
                '*.1' => "required",
                "*.2" => "required"
            ],
            [
                '*.0.required' => "Gagal ! Username guru wajib di isi",
                '*.1.required' => "Gagal ! Nama guru wajib di isi",
                "*.2.required" => "Gagal ! Kode Guru wajib di isi",
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->with("import_failed", "Gagal ! terjadi kesalahan pastikan data yg di import sesuai");
        }

        if (count($rows) > 200) {
            session()->flash("max_count", "Gagal! Row yg di import tidak boleh lebih dari 200");
            return;
        }

        $sql_siswa = DB::table("siswa")
            ->select('username');

        $sql_guru = DB::table('guru')
            ->select('username');

        $sql_admin = DB::table("admin")
            ->select('username')
            ->union($sql_siswa)
            ->union($sql_guru)
            ->get()->toArray();

        $sql_kodeGuru = DB::table("guru")
            ->select('kode_guru')
            ->get()->toArray();

        $sql_userID = DB::table("users")
            ->select('user_id')
            ->orderBy("user_id", 'DESC')
            ->first();

        $last_user_id = $sql_userID->user_id;

        $charsReplace = [
            '[', ']',
        ];

        $arr_username = array_column($sql_admin, "username");
        $arr_kodeGuru = array_column($sql_kodeGuru, "kode_guru");

        $data_guru = [];
        $data_user = [];


        DB::beginTransaction();

        // $row[0] => username
        // $row[1] => nama
        // $row[2] => kode_guru
        foreach ($rows as $row) {
            $kode_guru = str_replace($charsReplace, "", $row[2]);

            if (in_array($kode_guru, $arr_username)) {
                session()->flash("username_not_unique", "Gagal ! Username " . $row[0] . " sudah di gunakan");
                DB::rollBack();
                return;
            }

            if (in_array($kode_guru, $arr_kodeGuru)) {
                return redirect()->back()->with("duplicate_kodeGuru", "Gagal ! Kode guru " . $kode_guru . " sudah di gunakan");
                DB::rollBack();
            }

            $last_user_id++;

            $data_user[] = [
                'user_id' => $last_user_id,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
                'created_by' => auth()->guard("admin")->user()->user_id
            ];

            $data_guru[] = [
                'user_id' => $last_user_id,
                'username' => $row[0],
                'nama' => $row[1],
                'password' => Hash::make("123456"),
                'role' => 2,
                'kode_guru' => $kode_guru,
                'status' => 1,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
                'created_by' => auth()->guard("admin")->user()->user_id
            ];
        }

        User::insert($data_user);
        Guru::insert($data_guru);

        DB::commit();
    }

    public function startRow(): int
    {
        return 3;
    }
}
