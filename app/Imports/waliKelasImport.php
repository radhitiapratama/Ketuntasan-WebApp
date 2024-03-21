<?php

namespace App\Imports;

use App\Models\Guru;
use App\Models\Kelas;
use Carbon\Carbon;
use App\Models\TahunAjaran;
use App\Models\WaliKelas;
use Illuminate\Database\QueryException;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithStartRow;
use PhpOffice\PhpSpreadsheet\Calculation\Category;

class waliKelasImport implements ToCollection, WithStartRow
{
    use Importable;

    protected $guru;
    protected $kelas;
    protected $wali_kelas;
    protected $tahun;
    protected $wali_kelas_excel;

    public function __construct()
    {
        $this->tahun = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first()->tahun_ajaran_id;
        $this->guru = Guru::select("kode_guru", "guru_id")->get();
        $this->kelas = Kelas::select("kelas_id", "jurusan_id")->get();
        $this->wali_kelas = WaliKelas::where("tahun_ajaran_id", $this->tahun)->get();
    }

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

        $dataWaliKelas = [];

        DB::beginTransaction();

        foreach ($rows as $row) {
            $kode_guru = $row[0];
            $kelas_id = $row[2];
            $tingkatan_romawi = strtoupper($row[1]);

            $tingkatan = $this->checkTingkatan(strtoupper($row[1]));
            $check_kode_guru = $this->guru->where("kode_guru", $kode_guru)->first();
            $check_kode_kelas = $this->kelas->where("kelas_id", $kelas_id)->first();
            $check_wali_kelas = $this->wali_kelas->where("guru_id", $check_kode_guru->guru_id)
                ->where("kelas_id", $kelas_id)->first();

            $check_wali_kelas_excel = collect($this->wali_kelas_excel)->filter(function ($item) use ($kode_guru, $kelas_id) {
                return $item['kode_guru'] == $kode_guru && $item['kelas_id'] == $kelas_id;
            })->first();

            if ($check_kode_guru == null) {
                DB::rollBack();
                return redirect()->back()->with("guru_null", 'Kode Guru ' . $kode_guru . ' tidak ditemukan!');
            }

            if ($check_kode_kelas == null) {
                DB::rollBack();
                return redirect()->back()->with("kelas_null", 'Kode Kelas ' . $kelas_id . ' tidak ditemukan!');
            }

            if ($check_wali_kelas != null) {
                DB::rollBack();
                return redirect()->back()->with("wali_kelas_duplicate", "Gagal silahkan cek kembali data yang ingin di import!");
            }

            if ($check_wali_kelas_excel != null) {
                DB::rollBack();
                return redirect()->back()->with("wali_kelas_duplicate", "Gagal silahkan cek kembali data yang ingin di import!");
            }

            if ($tingkatan == null) {
                DB::rollBack();
                return redirect()->back()->with("invalid_tingkatan", strtoupper($row[1]) . " bukan termasuk tingkatan !");
            }

            $this->wali_kelas_excel[] = [
                'kode_guru' => $kode_guru,
                'kelas_id' => $kelas_id,
                'tingkatan' => $tingkatan_romawi,
            ];

            $dataWaliKelas[] = [
                'tingkatan' => $tingkatan,
                'jurusan_id' => $check_kode_kelas->jurusan_id,
                'kelas_id' => $kelas_id,
                'guru_id' => $check_kode_guru->guru_id,
                'tahun_ajaran_id' => $this->tahun,
                'status' => 1,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
                'created_by' => Auth::guard("admin")->user()->user_id
            ];
        }

        $check_waliKelas_kode_guru_excel = $this->array_has_duplicate(array_column($this->wali_kelas_excel, "kode_guru"));

        if ($check_waliKelas_kode_guru_excel == true) {
            DB::rollBack();
            $array_duplicate = $this->get_array_duplicate($this->wali_kelas_excel, "kode_guru");
            return redirect()->back()->with("wali_kelas_duplicate", 'Gagal Kode Guru ' . $array_duplicate . ' sudah jadi wali kelas!');
        }

        try {
            WaliKelas::insert($dataWaliKelas);
            DB::commit();
            return redirect()->back()->with("import_success", "Wali kelas berhasil di import!");
        } catch (QueryException $ex) {
            DB::rollBack();
            dd($ex);
            return redirect()->back()->with("import_failed", "Import wali kelas gagal,silahkan cek kembali datanya!");
        }
    }

    public function startRow(): int
    {
        return 3;
    }

    public function array_has_duplicate($array)
    {
        return count($array) !== count(array_unique($array));
    }

    public function get_array_duplicate($array, $column_name)
    {
        $arr = array_column($array, $column_name);
        return current(array_diff_assoc($arr, array_unique($arr)));
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
