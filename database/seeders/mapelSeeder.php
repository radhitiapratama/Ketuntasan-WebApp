<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class mapelSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('mapel')
            ->insert([
                [
                    'mapel_id' => 1,
                    'nama_mapel' => "Matematika",
                    'status' => 1,
                    'created_at' => Carbon::Now(),
                ],
                [
                    'mapel_id' => 2,
                    'nama_mapel' => "PAI dan Budi Pekerti ",
                    'status' => 1,
                    'created_at' => Carbon::Now(),
                ],
                [
                    'mapel_id' => 3,
                    'nama_mapel' => "Pendidikan Pancasila",
                    'status' => 1,
                    'created_at' => Carbon::Now(),
                ],
                [
                    'mapel_id' => 4,
                    'nama_mapel' => "Bahasa Indonesia ",
                    'status' => 1,
                    'created_at' => Carbon::Now(),
                ],
                [
                    'mapel_id' => 5,
                    'nama_mapel' => "Mulok Bahasa Daerah Jawa",
                    'status' => 1,
                    'created_at' => Carbon::Now(),
                ],
            ]);
    }
}
