<?php

namespace App\Imports;

use App\Models\Mapel;
use Carbon\Carbon;
use Clockwork\Request\Request;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Svg\Tag\Rect;

class MapelImport implements ToCollection, WithStartRow
{
    use Importable;

    protected $mapels_name;
    protected $mapels_excel_name;

    public function __construct()
    {
        $this->mapels_name = collect(Mapel::select("mapel_id", 'nama_mapel')->get()->toArray());
    }

    public function collection(Collection $rows)
    {
        $validator =  Validator::make(
            $rows->toArray(),
            [
                '*.0' => "required",
            ],
            [
                '*.0.required' => "Gagal! Nama Mapel wajib di isi",
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->with("import_failed", "Import mapel gagal silahkan cek kembali data yang di kirim!");
        }

        if (count($rows) > 200) {
            session()->flash("max_rows", "Gagal! Row yg di import tidak boleh lebih dari 200");
            return;
        }

        $dataMapel = [];
        $num = 0;

        DB::beginTransaction();

        foreach ($rows as $row) {
            $num++;
            $check_mapel_exist = $this->mapels_name->where("nama_mapel", $row[0])->first();
            $check_mapel_excel_exist = collect($this->mapels_excel_name)->where("nama_mapel", $row[0])->first();

            if ($check_mapel_exist != null || $check_mapel_excel_exist != null) {
                DB::rollBack();
                return redirect()->back()->with("duplicate_mapel_name", "Nama mapel {$row[0]} sudah di gunakan!");
            }

            $this->mapels_excel_name[] = [
                'num' => $num,
                'nama_mapel' => $row[0],
            ];

            $dataMapel[] = [
                'nama_mapel' => $row[0],
                'status' => 1,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
                'created_by' => auth()->guard("admin")->user()->user_id,
            ];
        }

        try {
            Mapel::insert($dataMapel);
            DB::commit();
        } catch (\Illuminate\Database\QueryException $ex) {
            DB::rollBack();
            return redirect()->back()->with("import_failed", "Import mapel gagal silahkan cek kembali data yang di kirim!");
        }
    }

    public function startRow(): int
    {
        return 2;
    }
}
