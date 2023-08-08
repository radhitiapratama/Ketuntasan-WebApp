<?php

namespace App\Imports;

use App\Models\Jurusan;
use Carbon\Carbon;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\SkipsErrors;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Concerns\SkipsOnError;

class JurusanImport implements
    ToModel,
    WithHeadingRow,
    SkipsOnError,
    WithValidation
{
    use Importable,
        SkipsErrors;

    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */
    public function model(array $row)
    {

        return new Jurusan([
            'nama_jurusan' => $row['jurusan'],
            'status' => 1,
            'created_at' => Carbon::now(),
        ]);
    }

    public function rules(): array
    {
        return  [
            '*.jurusan' => "unique:jurusan,nama_jurusan"
        ];
    }
}
