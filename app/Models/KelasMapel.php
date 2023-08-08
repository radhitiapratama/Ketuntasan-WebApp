<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Psy\CodeCleaner\FunctionReturnInWriteContextPass;

class KelasMapel extends Model
{
    use HasFactory;

    protected $table = "kelas_mapel";
    protected $primaryKey = "kelas_mapel_id";

    public function mapel()
    {
        return $this->belongsTo(Mapel::class, 'mapel_id');
    }

    public function kelas()
    {
        return $this->belongsTo(Kelas::class, 'kelas_id');
    }

    public function jurusan()
    {
        return $this->belongsTo(Jurusan::class, 'jurusan_id');
    }

    public function guru_mapel_user()
    {
        return $this->hasManyThrough(User::class, GuruMapel::class, 'mapel_id', 'user_id', 'mapel_id', 'user_id');
    }

    public function guru_mapel_mapel()
    {
        //param 
        //1 => model mana yang ingin jadi relationship
        //2 => foreign key di model relasi yg tertuju (GuruMapel)
        //3 => foreign key di model kita saat ini (kelasMapel)
        return $this->hasMany(GuruMapel::class, 'mapel_id', 'mapel_id');
    }
}
