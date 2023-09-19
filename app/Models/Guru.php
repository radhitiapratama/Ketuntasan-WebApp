<?php

namespace App\Models;

use Laravel\Sanctum\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Guru extends Authenticatable
{
    use HasFactory, Notifiable, HasApiTokens;

    protected $table = "guru";
    protected $primaryKey = "guru_id";
    protected $guarded = ["guru_id"];

    protected $guard = 'guru';
}
