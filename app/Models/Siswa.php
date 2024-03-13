<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Sanctum\HasApiTokens;

class Siswa extends Authenticatable
{
    use HasFactory, Notifiable, HasApiTokens;

    protected $table = "siswa";
    protected $primaryKey = "siswa_id";
    protected $guarded = ["siswa_id"];

    protected $guard = 'siswa';

    public function ketuntasan()
    {
        return $this->hasMany(Ketuntasan::class, 'siswa_id', 'siswa_id');
    }
    public function ketuntasan2()
    {
        return $this->hasMany(Ketuntasan::class, 'siswa_id', 'siswa_id');
    }

    public function kelas()
    {
        return $this->belongsTo(Kelas::class, 'kelas_id', 'kelas_id');
    }
}
