<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class userSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // DB::table("users")->insert([
        //     [
        //         'user_id' => 1,
        //         'username' => "superadmin",
        //         'password' => Hash::make("123456"),
        //         'role_id' => 1,
        //         'status' => 1,
        //         'created_at' => date("Y-m-d"),
        //     ],
        //     [
        //         'user_id' => 2,
        //         'username' => "ahmadhamam",
        //         'password' => Hash::make("123456"),
        //         'role_id' => 2,
        //         'status' => 1,
        //         'created_at' => date("Y-m-d"),
        //     ],
        //     [
        //         'user_id' => 3,
        //         'username' => "ahmadsalehudin",
        //         'password' => Hash::make("123456"),
        //         'role_id' => 2,
        //         'status' => 1,
        //         'created_at' => date("Y-m-d"),
        //     ],
        //     [
        //         'user_id' => 4,
        //         'username' => "ghandy",
        //         'password' => Hash::make("123456"),
        //         'role_id' => 2,
        //         'status' => 1,
        //         'created_at' => date("Y-m-d"),
        //     ],
        // ]);

        $user = new  User();

        $user->user_id = 1;
        $user->username = "superadmin";
        $user->nama = "superadmin";
        $user->password = Hash::make("123456");
        $user->role = 1;

        $user->save();
    }
}
