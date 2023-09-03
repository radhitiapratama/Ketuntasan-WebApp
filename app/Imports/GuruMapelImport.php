<?php

namespace App\Imports;

use App\Models\Guru;
use App\Models\GuruMapel;
use App\Models\Mapel;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Concerns\SkipsEmptyRows;

class GuruMapelImport implements ToCollection, WithStartRow, SkipsEmptyRows
{
    use Importable;

    public function collection(Collection $rows)
    {
        $validator = Validator::make(
            $rows->toArray(),
            [
                '*.0' => "required",
                '*.1' => "required",
            ],
            [
                '*.0.required' => "Kode Guru wajib di isi",
                '*.1.required' => "Kode Mapel wajib di isi",

            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->with("failed_import", "Gagal ! Terjadi kesalah saat mengimport");
        }

        if (count($rows) > 200) {
            session()->flash("max_count", "Gagal! Row yg di import tidak boleh lebih dari 200");
            return;
        }

        $stringsReplace = [
            '[', ']'
        ];

        DB::beginTransaction();

        foreach ($rows as $row) {
            $kode_guru = str_replace($stringsReplace, "", $row[0]);

            $sql_guru = Guru::select("guru_id")->where("kode_guru", $kode_guru)->first();

            // Check apakah guru ada
            if (!$sql_guru) {
                session()->flash("user_null", "Gagal Import ! Kode Guru " . $kode_guru . " tidak di temukan");
                DB::rollBack();
                return;
            }

            $mapels = str_replace($stringsReplace, "", $row[1]);
            $mapels = explode("'", $mapels);

            foreach ($mapels as $mapel) {
                if ($mapel == " ") {
                    continue;
                }

                $sql_mapel = Mapel::select("mapel_id")->where("mapel_id", $mapel)->first();

                // check apakah mapel ada
                if (!$sql_mapel) {
                    session()->flash("mapel_null", " Gagal Import ! Kode Mapel " . $mapel . " tidak di temukan");
                    DB::rollBack();
                    return;
                }

                $sql_check_guruMapel = GuruMapel::select("guru_mapel_id")
                    ->where("guru_id", $sql_guru->guru_id)
                    ->where("mapel_id", $mapel)
                    ->first();

                if ($sql_check_guruMapel) {
                    continue;
                }

                $sql_countGuruMapel = DB::table('guru_mapel')
                    ->select("guru_mapel_id")
                    ->where("guru_id", $sql_guru->guru_id)
                    ->count();

                if ($sql_countGuruMapel == 0) {
                    GuruMapel::create([
                        'guru_id' => $sql_guru->guru_id,
                        'mapel_id' => $mapel,
                        'kode_guru_mapel' => null,
                        'status' => 1,
                        'created_by' => auth()->guard('admin')->user()->user_id,
                    ]);
                } else if ($sql_countGuruMapel == 1) {
                    GuruMapel::where("guru_id", $sql_guru->guru_id)
                        ->update([
                            'kode_guru_mapel' => 1,
                        ]);

                    GuruMapel::create([
                        'guru_id' => $sql_guru->guru_id,
                        'mapel_id' => $mapel,
                        'kode_guru_mapel' => $sql_countGuruMapel + 1,
                        'status' => 1,
                        'created_by' => auth()->guard('admin')->user()->user_id,
                    ]);
                } else {
                    GuruMapel::create([
                        'guru_id' => $sql_guru->guru_id,
                        'mapel_id' => $mapel,
                        'kode_guru_mapel' => $sql_countGuruMapel + 1,
                        'status' => 1,
                        'created_by' => auth()->guard('admin')->user()->user_id,
                    ]);
                }
            }
        }

        DB::commit();
    }

    public function startRow(): int
    {
        return 3;
    }
}
