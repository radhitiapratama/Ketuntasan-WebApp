<?php

namespace Database\Seeders;

use App\Models\TahunAjaran;
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
        TahunAjaran::create([
            'tahun_ajaran_id' => 1,
            'tahun_ajaran' => "2023-2024",
            'user_aktif' => 1,
        ]);
    }
}
