<?php

namespace App\Imports;

use App\Models\Guru;
use App\Models\User;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithStartRow;



class GuruImport implements ToCollection, WithStartRow
{

    use Importable;

    public function collection(Collection $rows)
    {
        $validator =  Validator::make(
            $rows->toArray(),
            [
                '*.0' => "required",
                '*.1' => "required",
                "*.2" => "required|integer"
            ],
            [
                '*.0.required' => "Gagal ! Username guru wajib di isi",
                '*.1.required' => "Gagal ! Nama guru wajib di isi",
                "*.2.required" => "Gagal ! Kode Guru wajib di isi",
                '*.2.integer' =>  "Gagal ! Kode Guru wajib angka"
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->with("import_failed", "Gagal ! terjadi kesalahan pastikan data yg di import sesuai");
        }

        if (count($rows) > 200) {
            session()->flash("max_count", "Gagal! Row yg di import tidak boleh lebih dari 200");
            return;
        }

        DB::beginTransaction();

        foreach ($rows as $row) {
            // $sql_checkUsername = User::where("username", $row[0])->first();
            $sql_checkUsername = Guru::select("username")->where("username", $row[0])->first();

            // Check apakah ada username yg sama
            if ($sql_checkUsername) {
                session()->flash("username_not_unique", "Gagal! Username " . $row[0] . " sudah di gunakan");
                DB::rollBack();
                return;
            }

            $sql_checkKodeGuru = Guru::select("kode_guru")->where("kode_guru", $row[2])->first();
            if ($sql_checkKodeGuru) {
                return redirect()->back()->with("duplicate_kodeGuru", "Gagal ! Kode guru " . $row[2] . " sudah di gunakan");
                DB::rollBack();
            }

            $user = User::create([
                'created_by' => auth()->guard("admin")->user()->user_id
            ]);

            Guru::create([
                'user_id' => $user->user_id,
                'username' => $row[0],
                'nama' => $row[1],
                'password' => Hash::make("123456"),
                'role' => 2,
                'kode_guru' => $row[2],
                'status' => 1,
                'created_by' => auth()->guard("admin")->user()->user_id
            ]);
        }

        DB::commit();
    }

    public function startRow(): int
    {
        return 2;
    }
}
