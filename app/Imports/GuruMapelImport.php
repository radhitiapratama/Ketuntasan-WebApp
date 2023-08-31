<?php

namespace App\Imports;

use App\Models\GuruMapel;
use App\Models\Mapel;
use App\Models\User;
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
        Validator::make(
            $rows->toArray(),
            [
                '*.0' => "required",
                '*.1' => "required",
            ],
            [
                '*.0.required' => "Kode Guru wajib di isi",
                '*.0.integer' => "Kode Guru harus angka",
                '*.1.required' => "Kode Mapel wajib di isi",

            ]
        )->validate();

        if (count($rows) > 200) {
            session()->flash("max_count", "Gagal! Row yg di import tidak boleh lebih dari 200");
            return;
        }

        $stringsReplace = [
            '[', ']'
        ];

        DB::beginTransaction();

        foreach ($rows as $row) {
            $user_id = str_replace($stringsReplace, "", $row[0]);

            $sql_user = User::where("user_id", $user_id)->first();

            // Check apakah user ada
            if (!$sql_user) {
                session()->flash("user_null", "Gagal Import ! Kode Guru " . $user_id . " tidak di temukan");
                DB::rollBack();
                return;
            }

            // Check apakah role user nya adalah guru
            if ($sql_user && $sql_user->role != 2) {
                session()->flash("user_not_teacher", "Gagal Import ! Kode Guru " . $user_id . " bukan Guru");
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
                    ->where("user_id", $user_id)
                    ->where("mapel_id", $mapel)
                    ->first();

                if ($sql_check_guruMapel) {
                    continue;
                }

                GuruMapel::create([
                    'user_id' => $user_id,
                    'mapel_id' => $mapel,
                    'status' => 1,
                    'created_by' => auth()->user()->user_id,
                ]);
            }
        }

        DB::commit();
    }

    public function startRow(): int
    {
        return 3;
    }
}
