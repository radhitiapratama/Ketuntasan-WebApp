<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

use App\Models\GuruMapel;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = "users";
    protected $primaryKey  = "user_id";
    protected $guarded = ['user_id'];

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    // protected $fillable = [
    //     'username',
    //     'nama',
    //     'email',
    //     'password',
    //     'role',
    // ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function guru_mapel()
    {
        return $this->hasMany(GuruMapel::class);
    }

    public function ketuntasan()
    {
        return $this->hasMany(Ketuntasan::class, 'user_id', 'user_id');
    }

    public function admin()
    {
        return $this->belongsTo(Admin::class, 'user_id', 'user_id');
    }
}
