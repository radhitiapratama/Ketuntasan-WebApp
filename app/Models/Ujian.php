<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ujian extends Model
{
    use HasFactory;

    protected $table = "ujian";
    protected $primaryKey = "id";
    protected $guarded = ['id'];

    public function siswa()
    {
        return $this->hasOne(Siswa::class, "siswa_id", 'siswa_id');
    }
}
