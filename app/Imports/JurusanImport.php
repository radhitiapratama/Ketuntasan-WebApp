<?php

namespace App\Imports;

use App\Http\Middleware\RedirectIfAuthenticated;
use Carbon\Carbon;
use App\Models\Jurusan;
use Illuminate\Database\QueryException;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithStartRow;


class JurusanImport implements ToCollection, WithStartRow
{
    use Importable;

    protected $jurusans;
    protected $jurusans_excel;

    public function __construct()
    {
        $this->jurusans = Jurusan::select("jurusan_id", "nama_jurusan")->get();
    }

    public function collection(Collection $rows)
    {
        $validator =  Validator::make(
            $rows->toArray(),
            [
                '*.0' => "required"
            ],
            [
                '*.0.required' => "Nama Jurusan wajib di isi",
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->with("validation_failed", "Gagal ! Terjadi kesalahan saat mengimport file");
        }

        if (count($rows) > 200) {
            session()->flash("max_count", "Gagal! Row yg di import tidak boleh lebih dari 200");
            return;
        }

        DB::beginTransaction();

        $insert_jurusans = [];
        $num = 0;

        foreach ($rows as $row) {
            $num++;
            $jurusan_exist = $this->jurusans->where("nama_jurusan", $row[0])->first();
            $jurusan_excel_exist = collect($this->jurusans_excel)->where("nama_jurusan", $row[0])->first();

            if ($jurusan_exist != null) {
                return redirect()->back()->with("jurusan_duplicate", 'Jurusan ' . $jurusan_exist->nama_jurusan . ' sudah di gunakan!');
            }

            if ($jurusan_excel_exist != null) {
                return redirect()->back()->with("jurusan_duplicate", 'Jurusan ' . $jurusan_excel_exist->nama_jurusan . ' sudah di gunakan!');
            }

            $this->jurusans_excel[] = [
                'no' => $num,
                'nama_jurusan' => $row[0]
            ];

            $insert_jurusans[] = [
                'nama_jurusan' => $row[0],
                'status' => 1,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
                'created_by' => Auth::guard("admin")->user()->user_id
            ];
        }

        try {
            Jurusan::insert($insert_jurusans);
            DB::commit();
            return redirect()->back()->with("import_success", "Jurusan berhasil di import!");
        } catch (QueryException $ex) {
            DB::rollBack();
            return redirect()->back()->with("import_failed", "Import gagal silahkan periksa kembali datanya!");
        }
    }

    public function startRow(): int
    {
        return 2;
    }
}
