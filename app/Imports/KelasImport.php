<?php

namespace App\Imports;

use App\Models\Kelas;
use App\Models\Jurusan;
use Carbon\Carbon;
use Carbon\Doctrine\CarbonDoctrineType;
use Illuminate\Database\QueryException;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Illuminate\Support\Str;
use Symfony\Component\CssSelector\Node\FunctionNode;

class KelasImport implements ToCollection, WithStartRow
{
    use Importable;

    protected $jurusans;
    protected $kelases;
    protected $kelas_excel;


    public function __construct()
    {
        $this->jurusans = Jurusan::select("jurusan_id", 'nama_jurusan')->get();
        $this->kelases = DB::table("kelas")->select(DB::raw("LOWER(nama_kelas) as nama_kelas"))
            ->get();
    }

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

        $data_kelas = [];
        $num = 0;
        DB::beginTransaction();

        foreach ($rows as $row) {
            $num++;
            $jurusan_id = $row[0];
            $nama_kelas = strtolower($row[1]);

            $jurusan_exist = $this->jurusans->where("jurusan_id", $jurusan_id)->first();
            $kelas_exist  = $this->kelases->where("nama_kelas", $nama_kelas)->first();
            $kelas_excel_exist = collect($this->kelas_excel)->where("nama_kelas", $nama_kelas)->first();

            if ($jurusan_exist == null) {
                DB::rollback();
                return redirect()->back()->with("jurusan_null", "Kode Jurusan {$jurusan_id} tidak ditemukan!");
            }

            if ($kelas_exist != null) {
                DB::rollBack();
                return redirect()->back()->with("kelas_duplicate", "Nama kelas " . $row[1] . " sudah digunakan!");
            }

            if ($kelas_excel_exist != null) {
                DB::rollBack();
                return redirect()->back()->with("kelas_duplicate", "Nama kelas " . $row[1] . " sudah digunakan!",);
            }

            $this->kelas_excel[] = [
                'num' => $num,
                'nama_kelas' => $nama_kelas
            ];

            $data_kelas[] = [
                'jurusan_id' => $jurusan_id,
                'nama_kelas' => $row[1],
                'status' => 1,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
                'created_by' => Auth::guard("admin")->user()->user_id
            ];
        }

        try {
            Kelas::insert($data_kelas);
            DB::commit();
            return redirect()->back()->with("import_success", "Kelas berhasil di import");
        } catch (QueryException $ex) {
            DB::rollBack();
            return redirect()->back()->with("import_failed", "Import gagal silahkan cek kembali datanya!");
        }
    }

    public function startRow(): int
    {
        return 2;
    }
}
