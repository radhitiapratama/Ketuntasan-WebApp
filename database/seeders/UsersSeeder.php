<?php

namespace Database\Seeders;

use App\Models\Admin;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user = User::create([
            'created_by' => 1,
        ]);

        $lastUserId = $user->user_id;

        Admin::create([
            'user_id' => $lastUserId,
            'username' => "superadmin",
            "nama" => "Super Admin",
            'password' => Hash::make("123456"),
            'role' => 1,
            'status' => 1,
            'created_by' => 1,
        ]);
    }
}
