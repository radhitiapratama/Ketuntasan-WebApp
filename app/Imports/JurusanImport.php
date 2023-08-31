<?php

namespace App\Imports;

use Carbon\Carbon;
use App\Models\Jurusan;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithStartRow;


class JurusanImport implements ToCollection, WithStartRow
{
    use Importable;

    public function collection(Collection $rows)
    {
        Validator::make(
            $rows->toArray(),
            [
                '*.0' => "required"
            ],
            [
                '*.0.required' => "Nama Jurusan wajib di isi",
            ]
        )->validate();

        if (count($rows) > 200) {
            session()->flash("max_count", "Gagal! Row yg di import tidak boleh lebih dari 200");
            return;
        }

        DB::beginTransaction();

        foreach ($rows as $row) {
            $sql_checkJurusan = Jurusan::where("nama_jurusan", $row[0])->first();
            if ($sql_checkJurusan) {
                continue;
            }

            Jurusan::create([
                'nama_jurusan' => $row[0],
                'status' => 1,
                'created_by' => auth()->user()->user_id,
            ]);
        }

        DB::commit();
    }

    public function startRow(): int
    {
        return 2;
    }
}
