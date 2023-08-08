<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class tahunAjaranSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table("tahun_ajaran")
            ->insert([
                'tahun_ajaran_id' => 1,
                'tahun_ajaran' => "2023-2024",
                'user_aktif' => 1,
                'superadmin_aktif' => 1,
                'created_at' => Carbon::now(),
            ]);
    }
}
