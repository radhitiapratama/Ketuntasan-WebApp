<?php

namespace App\Imports;

use App\Models\Mapel;
use Carbon\Carbon;
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

        $sql_mapel = DB::table('mapel')
            ->get()->toArray();

        $arr_namaMapel = array_column($sql_mapel, "nama_mapel");

        $dataMapel = [];

        DB::beginTransaction();

        foreach ($rows as $row) {
            if (in_array($row[0], $arr_namaMapel)) {
                continue;
            }

            $dataMapel[] = [
                'nama_mapel' => $row[0],
                'status' => 1,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
                'created_by' => auth()->guard("admin")->user()->user_id,
            ];
        }

        Mapel::insert($dataMapel);
        DB::commit();
    }

    public function startRow(): int
    {
        return 2;
    }
}
