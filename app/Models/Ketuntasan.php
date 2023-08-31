<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ketuntasan extends Model
{
    use HasFactory;

    protected $table = "ketuntasan";
    protected $primaryKey = "ketuntasan_id";
    protected $guarded = "ketuntasan_id";
}
