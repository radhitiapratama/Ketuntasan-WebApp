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
    protected $guru_mapels;
    protected $gurus;
    protected $mapels;
    protected $guru_mapels_excel;

    public function __construct()
    {
        $this->guru_mapels = GuruMapel::select("guru_id", 'mapel_id')->with([
            'guru' => function ($q1) {
                $q1->select("guru_id", "nama", 'kode_guru');
            },
            'mapel' => function ($q2) {
                $q2->select("mapel_id", "nama_mapel");
            },
        ])->get();

        $this->gurus = Guru::select("guru_id", 'nama', 'kode_guru')->get();

        $this->mapels = Mapel::select("mapel_id", 'nama_mapel')->get();
    }

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

        DB::beginTransaction();

        foreach ($rows as $row) {
            $kode_guru = $row[0];
            $kode_mapel = $row[1];

            $check_guru_exist = $this->gurus->where("kode_guru", $kode_guru)->first();
            $check_mapel_exist = $this->mapels->where("mapel_id", $kode_mapel)->first();
            $check_guru_mapel_exist = $this->guru_mapels->where("guru.kode_guru", $kode_guru)
                ->where("mapel_id", $kode_mapel)->first();
            $check_guru_mapel_excel_exist = collect($this->guru_mapels_excel)->where("kode_guru", $kode_guru)
                ->where("mapel_id", $kode_mapel)->first();

            if ($check_guru_exist == null) {
                DB::rollBack();
                return redirect()->back()->with("guru_null", "Gagal Import ! Kode Guru " . $kode_guru . " tidak di temukan");
            }

            if ($check_mapel_exist == null) {
                DB::rollBack();
                return redirect()->back()->with("mapel_null", " Gagal Import ! Kode Mapel " . $kode_mapel . " tidak di temukan");
            }

            if ($check_guru_mapel_exist != null) {
                DB::rollBack();
                return redirect()->back()->with("guru_mapel_duplicate", 'Gagal! Guru ' . $check_guru_mapel_exist->guru->nama . ' sudah mengajar mapel ' . $check_guru_mapel_exist->mapel->nama_mapel . '');
            }

            if ($check_guru_mapel_excel_exist != null) {
                DB::rollBack();
                return redirect()->back()->with("guru_mapel_duplicate", 'Gagal! Guru ' . $check_guru_mapel_excel_exist->guru->nama . ' sudah mengajar mapel ' . $check_guru_mapel_excel_exist->mapel->nama_mapel . '');
            }

            $count1 =  count($this->guru_mapels->where("guru_id", $check_guru_exist->guru_id)->all());
            $count2 = count(collect($this->guru_mapels_excel)->where("guru_id", $check_guru_exist->guru_id)->all());

            $this->guru_mapels_excel[] = [
                'guru_id' => $check_guru_exist->guru_id,
                'mapel_id' => $check_mapel_exist->mapel_id,
                'kode_guru' => $kode_guru,
                'guru' => [
                    'nama' => $check_guru_exist->nama
                ],
                'mapel' => [
                    'nama_mapel' => $check_mapel_exist->nama_mapel,
                ]
            ];

            $sql_countGuruMapel = $count1 + $count2;

            if ($sql_countGuruMapel == 0) {
                GuruMapel::create([
                    'guru_id' => $check_guru_exist->guru_id,
                    'mapel_id' => $kode_mapel,
                    'kode_guru_mapel' => null,
                    'status' => 1,
                    'created_by' => auth()->guard('admin')->user()->user_id,
                ]);
            } else if ($sql_countGuruMapel == 1) {
                GuruMapel::where("guru_id", $check_guru_exist->guru_id)
                    ->update([
                        'kode_guru_mapel' => 1,
                    ]);

                GuruMapel::create([
                    'guru_id' => $check_guru_exist->guru_id,
                    'mapel_id' => $kode_mapel,
                    'kode_guru_mapel' => $sql_countGuruMapel + 1,
                    'status' => 1,
                    'created_by' => auth()->guard('admin')->user()->user_id,
                ]);
            } else {
                GuruMapel::create([
                    'guru_id' => $check_guru_exist->guru_id,
                    'mapel_id' => $kode_mapel,
                    'kode_guru_mapel' => $sql_countGuruMapel + 1,
                    'status' => 1,
                    'created_by' => auth()->guard('admin')->user()->user_id,
                ]);
            }
        }

        DB::commit();
        return redirect()->back()->with("import_success", "Data guru mapel berhasil di importkan!");
    }

    public function startRow(): int
    {
        return 2;
    }
}
