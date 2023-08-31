<?php

namespace App\Imports;

use App\Models\Mapel;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithStartRow;

class MapelImport implements ToCollection, WithStartRow
{
    use Importable;

    public function collection(Collection $rows)
    {
        Validator::make(
            $rows->toArray(),
            [
                '*.0' => "required",
            ],
            [
                '*.0.required' => "Gagal! Nama Mapel wajib di isi",
            ]
        )->validate();

        if (count($rows) > 200) {
            session()->flash("max_rows", "Gagal! Row yg di import tidak boleh lebih dari 200");
            return;
        }

        DB::beginTransaction();

        foreach ($rows as $row) {
            $sql_mapel = Mapel::where("nama_mapel", $row[0])->first();

            if ($sql_mapel) {
                continue;
            }

            Mapel::create([
                'nama_mapel' => $row[0],
                'status' => 1,
                'created_by' => auth()->guard("admin")->user()->user_id,
            ]);
        }

        DB::commit();
    }

    public function startRow(): int
    {
        return 2;
    }
}
