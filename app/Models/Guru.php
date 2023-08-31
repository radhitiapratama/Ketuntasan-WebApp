<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Guru extends Authenticatable
{
    use HasFactory, Notifiable;

    protected $table = "guru";
    protected $primaryKey = "guru_id";
    protected $guarded = ["guru_id"];

    protected $guard = 'guru';
}
