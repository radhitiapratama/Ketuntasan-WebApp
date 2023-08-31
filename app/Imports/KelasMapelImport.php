<?php

namespace App\Imports;

use App\Models\User;
use App\Models\Kelas;
use App\Models\KelasMapel;
use App\Models\Mapel;
use App\Models\TahunAjaran;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Concerns\SkipsEmptyRows;

class KelasMapelImport implements ToCollection, WithStartRow, SkipsEmptyRows
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
                '*.1' => "required",
                '*.2' => "required",
                '*.3' => "required",
            ],
            [
                '*.0.required' => "Tingkatan wajib di isi",
                '*.1.required' => "Kode Kelas wajib di isi",
                '*.2.required' => "Kode Mapel wajib di isi",
                '*.3.required' => "Kode Guru wajib di isi",
            ]
        )->validate();

        if (count($rows) > 200) {
            session()->flash("max_row", "Gagal! Row yg di import tidak boleh lebih dari 200");
            return;
        }

        $stringReplace = [
            '[', ']',
        ];

        global $row_user_id;

        $tahun = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

        DB::beginTransaction();

        foreach ($rows as $row) {
            $tingkatan = null;

            $kelas_id = str_replace($stringReplace, "", $row[1]);
            $mapel_id = str_replace($stringReplace, "", $row[2]);
            $user_id = str_replace($stringReplace, "", $row[3]);

            $row_user_id = $user_id;

            $row_tingkatan = strtoupper($row[0]);

            if ($row_tingkatan == "X") {
                $tingkatan = 1;
            }

            if ($row_tingkatan == "XI") {
                $tingkatan = 2;
            }

            if ($row_tingkatan == "XII") {
                $tingkatan = 3;
            }

            // Check tingkatan
            if ($tingkatan == null) {
                session()->flash("invalid_tingkatan", "Gagal! " . $row_tingkatan . ' bukan termasuk tingkatan');
                DB::rollBack();
                return;
            }

            $sql_kelas = Kelas::select("kelas_id", "jurusan_id")
                ->where("kelas_id", $kelas_id)
                ->first();

            // Check kelas
            if (!$sql_kelas) {
                session()->flash("kode_kelas_null", "Gagal! " . $kelas_id . ' tidak di temukan');
                DB::rollBack();
                return;
            }

            $sql_user = User::select("user_id", "role")->where("user_id", $user_id)->first();

            // check apakah user ada
            if (!$sql_user) {
                session()->flash("user_null", "Gagal! Kode Guru " . $user_id . ' tidak di temukan');
                DB::rollBack();
                return;
            }

            // check role user
            if ($sql_user && $sql_user->role != "2") {
                session()->flash("user_not_teacher", "Gagal! Kode Guru " . $user_id . ' bukan guru');
                DB::rollBack();
                return;
            }

            $sql_mapel = Mapel::select("mapel_id")
                ->with([
                    'guru_mapel' => function ($query) {
                        global $row_user_id;
                        $query->where("user_id", $row_user_id);
                    }
                ])
                ->where("mapel_id", $mapel_id)
                ->first();

            // Check mapel
            if (!$sql_mapel) {
                session()->flash("mapel_null", "Gagal! Kode Mapel " . $mapel_id . ' tidak ditemukan');
                DB::rollBack();
                return;
            }

            // Check apakah kode_user mengajar kode_mapel
            if ($sql_mapel && count($sql_mapel->guru_mapel) <= 0) {
                session()->flash("user_null_on_mapel", "Gagal! Kode Guru " . $user_id . ' tidak mengajar Kode mapel ' . $mapel_id);
                DB::rollBack();
                return;
            }

            $sql_checkKelasMapel = KelasMapel::select("kelas_mapel_id")
                ->where("tingkatan", $tingkatan)
                ->where('jurusan_id', $sql_kelas->jurusan_id)
                ->where("kelas_id", $kelas_id)
                ->where("user_id", $user_id)
                ->where("mapel_id", $mapel_id)
                ->where("tahun_ajaran_id", $tahun->tahun_ajaran_id)
                ->first();

            if ($sql_checkKelasMapel) {
                continue;
            }

            KelasMapel::create(
                [
                    'tingkatan' => $tingkatan,
                    'jurusan_id' => $sql_kelas->jurusan_id,
                    'kelas_id' => $kelas_id,
                    'user_id' => $user_id,
                    'mapel_id' => $mapel_id,
                    'tahun_ajaran_id' => $tahun->tahun_ajaran_id,
                    'status' => 1,
                    'created_by' => auth()->user()->user_id,
                ]
            );
        }

        DB::commit();
    }

    public function startRow(): int
    {
        return 3;
    }
}
