<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use App\Models\GuruMapel;

class Mapel extends Model
{
    use HasFactory;

    protected $table = "mapel";
    protected $guarded = ['mapel_id'];
    protected $primaryKey = "mapel_id";

    public function guru_mapel()
    {
        return $this->hasMany(GuruMapel::class);
    }
}
