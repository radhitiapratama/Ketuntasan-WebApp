<?php

namespace App\Imports;

use App\Models\User;
use App\Models\Kelas;
use App\Models\TahunAjaran;
use Carbon\Carbon;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithStartRow;


class waliKelasImport implements ToCollection, WithStartRow
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
                "*.1" => "required",
                '*.2' => "required"
            ],
            [
                '*.0.required' => "Gagal! Kode Guru wajib di isi",
                '*.0.integer' => "Gagal! Kode Guru wajib angka",
                '*.1.required' => "Gagal! Tingkatan wajib di isi",
                '*.2.required' => "Gagal! Kode Kelas wajib di isi",
                '*.2.integer' => "Gagal! Kode Kelas wajib angka",
            ]
        )->validate();

        if (count($rows) > 200) {
            session()->flash("max_count", "Gagal! Row yg di import tidak boleh lebih dari 200");
            return;
        }

        $tahun = TahunAjaran::select("tahun_ajaran_id")
            ->where("superadmin_aktif", 1)
            ->first();

        $stringsReplace = [
            '[', ']'
        ];

        DB::beginTransaction();

        foreach ($rows as $row) {
            $user_id = str_replace($stringsReplace, "", $row[0]);
            $kelas_id = str_replace($stringsReplace, "", $row[2]);

            $sql_user = User::select("user_id", 'role')->where("user_id", $user_id)->first();

            // check apakah user ada
            if (!$sql_user) {
                session()->flash("user_null", "Gagal!, Kode Guru " . $user_id . " tidak di temukan");
                DB::rollBack();
                return;
            }

            // check apakah user rolenya bukan guru
            if ($sql_user && $sql_user->role != 2) {
                session()->flash("user_not_teacher", "Kode Guru " . $user_id . " bukan Guru");
                DB::rollBack();
                return;
            }

            $tingkatan = null;

            if (strtoupper($row[1]) == "X") {
                $tingkatan = 1;
            }

            if (strtoupper($row[1]) == "XI") {
                $tingkatan = 2;
            }

            if (strtoupper($row[1]) == "XII") {
                $tingkatan = 3;
            }

            if ($tingkatan == null) {
                session()->flash("invalid_tingkatan", strtoupper($row[1]) . " bukan termasuk tingkatan !");
                DB::rollBack();
                return;
            }


            $sql_kelas = Kelas::select("kelas_id", 'jurusan_id')->where("kelas_id", $kelas_id)->first();

            // check apakah kelas ada
            if (!$sql_kelas) {
                session()->flash("kode_kelas_null", "Gagal!,Kode Kelas " . $kelas_id . " tidak di temukan");
                DB::rollBack();
                return;
            }

            $sql_check = DB::table("wali_kelas")
                ->where("tingkatan", $tingkatan)
                ->where("jurusan_id", $sql_kelas->jurusan_id)
                ->where("kelas_id", $kelas_id)
                ->where("user_id", $user_id)
                ->where("tahun_ajaran_id", $tahun->tahun_ajaran_id)
                ->first();

            // jika sudah ada data wali kelas maka skip
            if ($sql_check) {
                continue;
            }

            DB::table("wali_kelas")
                ->insert([
                    'tingkatan' => $tingkatan,
                    'jurusan_id' => $sql_kelas->jurusan_id,
                    'kelas_id' => $sql_kelas->kelas_id,
                    'user_id' => $user_id,
                    'tahun_ajaran_id' => $tahun->tahun_ajaran_id,
                    'status' => 1,
                    'created_at' => Carbon::now(),
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