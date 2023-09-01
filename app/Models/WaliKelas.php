<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WaliKelas extends Model
{
    use HasFactory;

    protected $table = "wali_kelas";
    protected $primaryKey = "wali_kelas_id";
    protected $guarded = ['wali_kelas_id'];
}
