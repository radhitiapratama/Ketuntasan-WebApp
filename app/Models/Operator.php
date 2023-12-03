<?php

namespace App\Models;

use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Operator extends Authenticatable
{
    use HasFactory, Notifiable, HasApiTokens;

    protected $table = "operator";
    protected $primaryKey  = "id";
    protected $guarded = ["id"];

    protected $guard = 'operator';
}
