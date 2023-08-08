<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Carbon\Doctrine\CarbonDoctrineType;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class tingkatanSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $tingkatan = [
            [
                'tingkatan_id' => 1,
                'nama_tingkatan' => "X",
                'status' => 1,
                'created_at' => Carbon::now(),
            ],
            [
                'tingkatan_id' => 2,
                'nama_tingkatan' => "XI",
                'status' => 1,
                'created_at' => Carbon::now(),
            ],
            [
                'tingkatan_id' => 3,
                'nama_tingkatan' => "XII",
                'status' => 1,
                'created_at' => Carbon::now(),
            ]
        ];

        DB::table("tingkatan")->insert($tingkatan);
    }
}
