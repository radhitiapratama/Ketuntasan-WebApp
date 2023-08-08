<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class jurusanSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table("jurusan")
            ->insert([
                [
                    'jurusan_id' => 1,
                    'nama_jurusan' => "Rekayasa Perangkat Lunak",
                    'created_at' => Carbon::now(),
                ],
                [
                    'jurusan_id' => 2,
                    'nama_jurusan' => "Teknik Komputer dan Jaringan",
                    'created_at' => Carbon::now(),
                ],
                [
                    'jurusan_id' => 3,
                    'nama_jurusan' => "Multimedia",
                    'created_at' => Carbon::now(),
                ],
                [
                    'jurusan_id' => 4,
                    'nama_jurusan' => "Perbankan dan Keuangan Mikro",
                    'created_at' => Carbon::now(),
                ],
                [
                    'jurusan_id' => 5,
                    'nama_jurusan' => "Akuntansi",
                    'created_at' => Carbon::now(),
                ],
                [
                    'jurusan_id' => 6,
                    'nama_jurusan' => "Layanan Perbankan",
                    'created_at' => Carbon::now(),
                ],
                [
                    'jurusan_id' => 7,
                    'nama_jurusan' => "Administrasi Perkantoran",
                    'created_at' => Carbon::now(),
                ],
            ]);
    }
}
