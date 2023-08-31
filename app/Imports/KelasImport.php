<?php

namespace App\Imports;

use App\Models\Kelas;
use App\Models\Jurusan;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithStartRow;

class KelasImport implements ToCollection, WithStartRow
{
    use Importable;

    /**
     * @param Collection $collection
     */
    public function collection(Collection $rows)
    {
        Validator::make(
            $rows->toArray(),
            [
                '*.0' => "required",
                '*.1' => "required"
            ],
            [
                '*.0.required' => "Gagal! Kode Jurusan wajib di isi",
                '*.1.required' => "Gagal! Nama Kelas wajib di isi",
            ]
        )->validate();

        if (count($rows) > 200) {
            session()->flash("max_row", "Gagal! Row yg di import tidak boleh lebih dari 200");
            return;
        }

        $stringReplace = [
            "[", "]"
        ];

        foreach ($rows as $row) {
            $jurusan_id = str_replace($stringReplace, "", $row[0]);

            $sql_jurusan = Jurusan::where("jurusan_id", $jurusan_id)->first();

            // check apakah ada jurusan
            if (!$sql_jurusan) {
                session()->flash("jurusan_null", "Gagal! Kode Jurusan " . $jurusan_id . " tidak di temukan");
                DB::rollBack();
                return;
            }

            $sql_kelas = Kelas::select("kelas_id")
                ->where("jurusan_id", $jurusan_id)
                ->where("nama_kelas", $row[1])
                ->first();

            if ($sql_kelas) {
                continue;
            }

            Kelas::create([
                'jurusan_id' => $jurusan_id,
                'nama_kelas' => $row[1],
                'status' => 1,
                'created_by' => auth()->user()->user_id
            ]);
        }

        DB::commit();
    }

    public function startRow(): int
    {
        return 3;
    }
}
