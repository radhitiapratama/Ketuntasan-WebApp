<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;

class Admin extends Authenticatable
{
    protected $table = "admin";
    protected $primaryKey  = "admin_id";
    protected $guarded = ["admin_id"];

    protected $guard = 'admin';
}
