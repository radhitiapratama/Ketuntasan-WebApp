<?php

namespace App\Imports;

use App\Models\Kelas;
use App\Models\Jurusan;
use Carbon\Carbon;
use Carbon\Doctrine\CarbonDoctrineType;
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
        $validator =   Validator::make(
            $rows->toArray(),
            [
                '*.0' => "required",
                '*.1' => "required"
            ],
            [
                '*.0.required' => "Gagal! Kode Jurusan wajib di isi",
                '*.1.required' => "Gagal! Nama Kelas wajib di isi",
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->with("validation_failed", "Gagal ! Terjadi kesalahan saat mengimport");
        }

        if (count($rows) > 200) {
            session()->flash("max_row", "Gagal! Row yg di import tidak boleh lebih dari 200");
            return;
        }

        $sql_jurusan = DB::table("jurusan")
            ->select('jurusan_id')
            ->get()->toArray();

        $arr_jurusan = array_column($sql_jurusan, 'jurusan_id');

        $sql_kelas = DB::table("kelas")
            ->select('nama_kelas')
            ->get()->toArray();

        $arr_namaKelas = array_column($sql_kelas, "nama_kelas");

        $data_kelas = [];

        DB::beginTransaction();

        foreach ($rows as $row) {
            $jurusan_id = $row[0];
            $nama_kelas = strtoupper($row[1]);

            if (!in_array($jurusan_id, $arr_jurusan)) {
                session()->flash("jurusan_null", "Gagal! Kode Jurusan " . $jurusan_id . " tidak di temukan");
                DB::rollBack();
                return;
            }

            if (in_array($nama_kelas, $arr_namaKelas)) {
                continue;
            }

            $data_kelas[] = [
                'jurusan_id' => $jurusan_id,
                'nama_kelas' => $nama_kelas,
                'status' => 1,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
                'created_by' => auth()->guard("admin")->user()->user_id
            ];
        }

        DB::table("kelas")
            ->insert($data_kelas);

        DB::commit();
    }

    public function startRow(): int
    {
        return 2;
    }
}
