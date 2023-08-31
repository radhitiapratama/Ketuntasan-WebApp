<?php

namespace App\Imports;

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
        Validator::make(
            $rows->toArray(),
            [
                '*.0' => "required",
                '*.1' => "required",
            ],
            [
                '*.0.required' => "Gagal! Username guru wajib di isi",
                '*.1.required' => "Gagal! Nama guru wajib di isi"

            ]
        )->validate();

        if (count($rows) > 200) {
            session()->flash("max_count", "Gagal! Row yg di import tidak boleh lebih dari 200");
            return;
        }

        DB::beginTransaction();

        foreach ($rows as $row) {
            $sql_checkUsername = User::where("username", $row[0])->first();

            // Check apakah ada username yg sama
            if ($sql_checkUsername) {
                session()->flash("username_not_unique", "Gagal! Username " . $row[0] . " sudah di gunakan");
                DB::rollBack();
                return;
            }

            User::create([
                'username' => $row[0],
                'nama' => $row[1],
                'password' => Hash::make("123456"),
                'role' => 2,
                'status' => 1,
                'created_by' => auth()->user()->user_id
            ]);
        }

        DB::commit();
    }

    public function startRow(): int
    {
        return 2;
    }
}
