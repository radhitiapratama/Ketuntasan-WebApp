<?php

namespace App\Imports;

use App\Http\Middleware\RedirectIfAuthenticated;
use App\Models\GuruMapel;
use App\Models\User;
use App\Models\Kelas;
use App\Models\KelasMapel;
use App\Models\Mapel;
use App\Models\TahunAjaran;
use Carbon\Carbon;
use Illuminate\Database\QueryException;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Concerns\SkipsEmptyRows;
use PDO;

class KelasMapelImport implements ToCollection, WithStartRow, SkipsEmptyRows
{
    use Importable;

    protected $kelas;
    protected $kelas_mapel;
    protected $tahun;
    protected $guru_mapel;
    protected $kelas_mapel_excel;

    public function __construct()
    {
        $this->tahun = TahunAjaran::select("tahun_ajaran_id")->where('superadmin_aktif', 1)->first()->tahun_ajaran_id;
        $this->kelas = Kelas::select("kelas_id", "jurusan_id")->get();
        $this->kelas_mapel = KelasMapel::with([
            'guru_mapel' => function ($q1) {
                $q1->select("guru_id", "kode_guru_mapel", "guru_mapel_id");
            }
        ])->get();
        $this->guru_mapel = GuruMapel::select("guru_mapel_id", "guru_id", 'kode_guru_mapel')->get();
    }

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
            return redirect()->back()->with("import_failed", "Gagal ! Terjadi kesalahan import");
        }

        if (count($rows) > 200) {
            session()->flash("import_failed", "Gagal! Row yg di import tidak boleh lebih dari 200");
            return;
        }

        $dataKelasMapel = [];
        DB::beginTransaction();

        foreach ($rows as $row) {
            $kode_guru_mapel = str_replace(".", ",", $row[2]);
            $kelas_id = $row[1];
            $tingkatan = $this->checkTingkatan($row[0]);

            $check_kelas = $this->kelas->where("kelas_id", $kelas_id)->first();
            $check_guru_mapel = null;
            $check_kelas_mapel_excel = collect($this->kelas_mapel_excel)->where("kelas_id", $kelas_id)
                ->where("kode_guru_mapel", $kode_guru_mapel)
                ->first();

            // cek data kelas_mapel dari excel duplicate
            if ($check_kelas_mapel_excel != null) {
                DB::rollBack();
                return redirect()->back()->with("import_failed", "Gagal terdapat data yang duplikasi silahkan cek kembali datanya!");
            }

            // cek tingkatan
            if ($tingkatan == null) {
                DB::rollBoack();
                return redirect()->back()->with("import_failed", "Gagal! " . strtoupper($row[0]) . ' bukan termasuk tingkatan');
            }

            // cek kelas_id ada / tidak
            if ($check_kelas == null) {
                DB::rollBack();
                return redirect()->back()->with("import_failed", "Gagal! kode kelas " . $kelas_id . " tidak di temukan!");
            }

            $arr_kodeGuruMapel = explode(",", $kode_guru_mapel);
            if (count($arr_kodeGuruMapel) > 1) {
                $check_guru_mapel = $this->guru_mapel->where("guru_id", $arr_kodeGuruMapel[0])
                    ->where("kode_guru_mapel", $arr_kodeGuruMapel[1])
                    ->first();
            } else {
                $check_guru_mapel = $this->guru_mapel->where("guru_id", $arr_kodeGuruMapel[0])->first();
            }

            // cek apakah kode_guru_mapel ada / tidak
            if ($check_guru_mapel == null) {
                DB::rollBack();
                return redirect()->back()->with("import_failed", "Gagal! Kode guru mapel " . $kode_guru_mapel . " tidak ditemukan!");
            }

            $check_kelas_mapel = $this->kelas_mapel
                ->where("tingkatan", $tingkatan)
                ->where("kelas_id", $kelas_id)
                ->where("guru_mapel_id", $check_guru_mapel->guru_mapel_id)
                ->where("tahun_ajaran_id", $this->tahun)
                ->first();

            // cek apakah ada data kelas_mapel yang duplicate dari database
            if ($check_kelas_mapel != null) {
                DB::rollBack();
                return redirect()->back()->with("import_failed", "Gagal terdapat data yang duplikasi silahkan cek kembali datanya!");
            }

            // tampung data kelas_mapel dari excel ke array
            $this->kelas_mapel_excel[] = [
                'kelas_id' => $kelas_id,
                'kode_guru_mapel' => $kode_guru_mapel,
            ];

            $dataKelasMapel[] = [
                'tingkatan' => $tingkatan,
                'jurusan_id' => $check_kelas->jurusan_id,
                'kelas_id' => $kelas_id,
                'guru_mapel_id' => $check_guru_mapel->guru_mapel_id,
                'tahun_ajaran_id' => $this->tahun,
                'status' => 1,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
                'created_by' => auth()->guard("admin")->user()->user_id,
            ];
        }

        try {
            KelasMapel::insert($dataKelasMapel);
            DB::commit();
            return redirect()->back()->with("import_success", "Data Kelas Mapel berhasil di Import!");
        } catch (QueryException $ex) {
            DB::rollBack();
            return redirect()->back()->with("import_failed", "Gagal terjadi kesalahan saat mengimport silahkan cek kembali datanya!");
        }
    }

    public function startRow(): int
    {
        return 3;
    }

    public function checkTingkatan($tingkatan)
    {
        if (strtoupper($tingkatan) == "X") {
            return 1;
        }

        if (strtoupper($tingkatan) == "XI") {
            return 2;
        }

        if (strtoupper($tingkatan) == "XII") {
            return 3;
        }

        return null;
    }
}
