<?php

namespace App\Imports;

use App\Models\Mapel;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\SkipsErrors;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\SkipsOnError;
use Maatwebsite\Excel\Concerns\WithValidation;
use Throwable;

class MapelImport implements
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
        return new Mapel([
            'nama_mapel' => $row['mapel'],
            'status' => 1,
        ]);
    }

    public function rules(): array
    {
        return [
            '*.mapel' => 'unique:mapel,nama_mapel'
        ];
    }
}
