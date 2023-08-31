<?php

namespace Database\Seeders;

use App\Models\TahunAjaran;
use Illuminate\Database\Seeder;

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
            'tahun_ajaran_id' => "1",
            'tahun_ajaran' => '2023-2024',
            'user_aktif' => 1,
            'superadmin_aktif' => 1,
            'created_by' => 1,
        ]);
    }
}
