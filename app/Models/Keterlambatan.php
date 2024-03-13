<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Keterlambatan extends Model
{
    use HasFactory;
    protected $table = "keterlambatan";
    protected $primaryKey = "id";
    protected $guarded = ['id'];
}
