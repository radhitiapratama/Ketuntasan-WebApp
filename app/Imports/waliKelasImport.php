<?php

namespace App\Imports;

use Carbon\Carbon;
use App\Models\TahunAjaran;
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
        $validator =  Validator::make(
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
        );

        if ($validator->fails()) {
            return redirect()->back()->with("validation_failed", "Gagal ! Terjadi kesalahan saat mengimport");
        }

        if (count($rows) > 200) {
            session()->flash("max_count", "Gagal! Row yg di import tidak boleh lebih dari 200");
            return;
        }

        $tahun = TahunAjaran::select("tahun_ajaran_id")
            ->where("superadmin_aktif", 1)
            ->first();

        $sql_guru = DB::table("guru")
            ->select('guru_id', 'kode_guru')
            ->get()->toArray();

        $arr_guruId = array_column($sql_guru, 'guru_id');
        $arr_kode_guru = array_column($sql_guru, "kode_guru");

        $sql_kelas = DB::table("kelas")
            ->select('kelas_id', 'jurusan_id')
            ->get()->toArray();

        $arr_kelasId = array_column($sql_kelas, "kelas_id");
        $arr_jurusanId = array_column($sql_kelas, 'jurusan_id');

        // $stringsReplace = [
        //     '[', ']'
        // ];

        $dataWaliKelas = [];

        DB::beginTransaction();

        foreach ($rows as $row) {
            $kode_guru = $row[0];
            $kelas_id = $row[2];

            if (!in_array($kode_guru, $arr_kode_guru)) {
                session()->flash("user_null", "Gagal!, Kode Guru " . $kode_guru . " tidak di temukan");
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

            if (!in_array($kelas_id, $arr_kelasId)) {
                session()->flash("kode_kelas_null", "Gagal!,Kode Kelas " . $kelas_id . " tidak di temukan");
                DB::rollBack();
                return;
            }

            $guru_id = array_search($kode_guru, $arr_kode_guru);
            $guru_id = $arr_guruId[$guru_id];

            $jurusan_id = array_search($kelas_id, $arr_kelasId);
            $jurusan_id = $arr_jurusanId[$jurusan_id];

            $sql_check = DB::table("wali_kelas")
                ->select('wali_kelas_id')
                ->where('tingkatan', $tingkatan)
                ->where('jurusan_id', $jurusan_id)
                ->where('kelas_id', $kelas_id)
                ->where('guru_id', $guru_id)
                ->where('tahun_ajaran_id', $tahun->tahun_ajaran_id)
                ->first();

            if ($sql_check) {
                continue;
            }

            $dataWaliKelas[] = [
                'tingkatan' => $tingkatan,
                'jurusan_id' => $jurusan_id,
                'kelas_id' => $kelas_id,
                'guru_id' => $guru_id,
                'tahun_ajaran_id' => $tahun->tahun_ajaran_id,
                'status' => 1,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
                'created_by' => auth()->guard("admin")->user()->user_id
            ];
        }

        DB::table("wali_kelas")
            ->insert($dataWaliKelas);

        DB::commit();


        // foreach ($rows as $row) {
        //     $kode_guru = str_replace($stringsReplace, "", $row[0]);
        //     $kelas_id = str_replace($stringsReplace, "", $row[2]);

        //     $sql_guru = Guru::select("guru_id")->where("kode_guru", $kode_guru)->first();

        //     if (!$sql_guru) {
        //         session()->flash("user_null", "Gagal!, Kode Guru " . $kode_guru . " tidak di temukan");
        //         DB::rollBack();
        //         return;
        //     }

        //     $tingkatan = null;

        //     if (strtoupper($row[1]) == "X") {
        //         $tingkatan = 1;
        //     }

        //     if (strtoupper($row[1]) == "XI") {
        //         $tingkatan = 2;
        //     }

        //     if (strtoupper($row[1]) == "XII") {
        //         $tingkatan = 3;
        //     }

        //     if ($tingkatan == null) {
        //         session()->flash("invalid_tingkatan", strtoupper($row[1]) . " bukan termasuk tingkatan !");
        //         DB::rollBack();
        //         return;
        //     }


        //     $sql_kelas = Kelas::select("kelas_id", 'jurusan_id')->where("kelas_id", $kelas_id)->first();

        //     if (!$sql_kelas) {
        //         session()->flash("kode_kelas_null", "Gagal!,Kode Kelas " . $kelas_id . " tidak di temukan");
        //         DB::rollBack();
        //         return;
        //     }

        //     $sql_check = DB::table("wali_kelas")
        //         ->where("tingkatan", $tingkatan)
        //         ->where("jurusan_id", $sql_kelas->jurusan_id)
        //         ->where("kelas_id", $kelas_id)
        //         ->where("guru_id", $sql_guru->guru_id)
        //         ->where("tahun_ajaran_id", $tahun->tahun_ajaran_id)
        //         ->first();

        //     if ($sql_check) {
        //         continue;
        //     }

        //     DB::table("wali_kelas")
        //         ->insert([
        //             'tingkatan' => $tingkatan,
        //             'jurusan_id' => $sql_kelas->jurusan_id,
        //             'kelas_id' => $sql_kelas->kelas_id,
        //             'guru_id' => $sql_guru->guru_id,
        //             'tahun_ajaran_id' => $tahun->tahun_ajaran_id,
        //             'status' => 1,
        //             'created_at' => Carbon::now(),
        //             'updated_at' => Carbon::now(),
        //             'created_by' => auth()->guard("admin")->user()->user_id
        //         ]);
        // }

    }

    public function startRow(): int
    {
        return 3;
    }
}
