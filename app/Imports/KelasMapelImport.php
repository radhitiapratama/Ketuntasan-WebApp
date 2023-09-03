<?php

namespace App\Imports;

use App\Models\GuruMapel;
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
        $validator =  Validator::make(
            $rows->toArray(),
            [
                '*.0' => "required",
                '*.1' => "required",
                '*.2' => "required",
            ],
            [
                '*.0.required' => "Tingkatan wajib di isi",
                '*.1.required' => "Kode Kelas wajib di isi",
                '*.2.required' => "Kode Guru Mapel wajib di isi",
            ]
        );


        if ($validator->fails()) {
            return redirect()->back()->with("validator_failed", "Gagal ! Terjadi kesalahan import");
        }

        if (count($rows) > 200) {
            session()->flash("max_row", "Gagal! Row yg di import tidak boleh lebih dari 200");
            return;
        }

        $stringReplace = [
            '[', ']',
        ];

        $tahun = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

        DB::beginTransaction();

        foreach ($rows as $row) {
            $kelas_id = str_replace($stringReplace, "", $row[1]);

            // [0] => kode_guru
            // [1] => kode_guru_mapel 
            $arr_kodeGuruMapel = explode(",", str_replace($stringReplace, "", $row[2]));

            $row_tingkatan = strtoupper($row[0]);

            $tingkatan = null;
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
                DB::rollBoack();
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

            if (count($arr_kodeGuruMapel) > 1) {
                $sql_guruMapelId = DB::table('guru_mapel as gm')
                    ->select('gm.guru_mapel_id')
                    ->join('guru as g', 'g.guru_id', '=', 'gm.guru_id')
                    ->where("g.kode_guru", $arr_kodeGuruMapel[0])
                    ->where("gm.kode_guru_mapel", $arr_kodeGuruMapel[1])
                    ->first();
            } else {
                $sql_guruMapelId = DB::table('guru_mapel as gm')
                    ->select('gm.guru_mapel_id')
                    ->join('guru as g', 'g.guru_id', '=', 'gm.guru_id')
                    ->where("g.kode_guru", $arr_kodeGuruMapel[0])
                    ->where("gm.kode_guru_mapel", null)
                    ->first();
            }

            if (empty($sql_guruMapelId)) {
                session()->flash("guru_mapel_id_null", "Gagal ! Kode Guru Mapel tidak ditemukan");
                DB::rollBack();
                return;
            }

            $sql_checkKelasMapel = KelasMapel::select("kelas_mapel_id")
                ->where("tingkatan", $tingkatan)
                ->where('jurusan_id', $sql_kelas->jurusan_id)
                ->where("kelas_id", $kelas_id)
                ->where("guru_mapel_id", $sql_guruMapelId->guru_mapel_id)
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
                    'guru_mapel_id' => $sql_guruMapelId->guru_mapel_id,
                    'tahun_ajaran_id' => $tahun->tahun_ajaran_id,
                    'status' => 1,
                    'created_by' => auth()->guard("admin")->user()->user_id,
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
