<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Siswa extends Authenticatable
{
    use HasFactory, Notifiable;

    protected $table = "siswa";
    protected $primaryKey = "siswa_id";
    protected $guarded = ["siswa_id"];

    protected $guard = 'siswa';
}
