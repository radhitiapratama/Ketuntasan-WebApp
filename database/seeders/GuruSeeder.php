<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class GuruSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')
            ->insert([
                [
                    'user_id' => 2,
                    'username' => "ahmad_hamam",
                    'nama' => "Ahmad Hamam Al Fadil, S.Ag ",
                    'password' => Hash::make("123456"),
                    'role' => 2,
                ],
                [
                    'user_id' => 3,
                    'username' => "ahmad_salehudin",
                    'nama' => "Akhmad Salehudin, S.Ag",
                    'password' => Hash::make("123456"),
                    'role' => 2,
                ],
                [
                    'user_id' => 4,
                    'username' => "moh_ghandy",
                    'nama' => "Moh. Ghandy Y, S.Pdi",
                    'password' => Hash::make("123456"),
                    'role' => 2,
                ],
                [
                    'user_id' => 5,
                    'username' => "haimron",
                    'nama' => "Haimron, S. PdI",
                    'password' => Hash::make("123456"),
                    'role' => 2,
                ],
                [
                    'user_id' => 6,
                    'username' => "abrori",
                    'nama' => "Muhammad Abrori, S. PdI",
                    'password' => Hash::make("123456"),
                    'role' => 2,
                ],
                [
                    'user_id' => 7,
                    'username' => "supriyadi",
                    'nama' => "Drs. Supriyadi",
                    'password' => Hash::make("123456"),
                    'role' => 2,
                ],
                [
                    'user_id' => 8,
                    'username' => "ridwan_saidi",
                    'nama' => "Mohammad Ridwan Saidi, S.Pd ",
                    'password' => Hash::make("123456"),
                    'role' => 2,
                ],
                [
                    'user_id' => 9,
                    'username' => "triana_heri",
                    'nama' => "Triana Heri Wibowo, S.Pd",
                    'password' => Hash::make("123456"),
                    'role' => 2,
                ],
                [
                    'user_id' => 10,
                    'username' => "Dimas",
                    'nama' => "Dimas",
                    'password' => Hash::make("123456"),
                    'role' => 2,
                ],
                [
                    'user_id' => 11,
                    'username' => "dwi_atika",
                    'nama' => "Dwi Atika ",
                    'password' => Hash::make("123456"),
                    'role' => 2,
                ],
                [
                    'user_id' => 12,
                    'username' => "citria_nilam",
                    'nama' => "Citria Nilam Asri C.W, S.Pd",
                    'password' => Hash::make("123456"),
                    'role' => 2,
                ],
                [
                    'user_id' => 13,
                    'username' => "siswa_wardani",
                    'nama' => "Siswa Wardani, S. Pd ",
                    'password' => Hash::make("123456"),
                    'role' => 2,
                ],
                [
                    'user_id' => 14,
                    'username' => "sri_purwati",
                    'nama' => "Sri Purwati, S. Pd",
                    'password' => Hash::make("123456"),
                    'role' => 2,
                ],
                [
                    'user_id' => 15,
                    'username' => "nuning_evana",
                    'nama' => "Nuning Evana, S. Pd",
                    'password' => Hash::make("123456"),
                    'role' => 2,
                ],
                [
                    'user_id' => 16,
                    'username' => "achmad_muzaki",
                    'nama' => "Achmad Muzakki, S.Pd",
                    'password' => Hash::make("123456"),
                    'role' => 2,
                ],
                [
                    'user_id' => 17,
                    'username' => "meytha_suryaningtari",
                    'nama' => "Meytha Suryaningtari, S.Pd",
                    'password' => Hash::make("123456"),
                    'role' => 2,
                ],
                [
                    'user_id' => 18,
                    'username' => "didik_cahyono",
                    'nama' => "Drs. Didik Cahyono",
                    'password' => Hash::make("123456"),
                    'role' => 2,
                ],
                [
                    'user_id' => 19,
                    'username' => "dwi_arianto",
                    'nama' => "Drs. Dwi Arianto,M.M",
                    'password' => Hash::make("123456"),
                    'role' => 2,
                ],
                [
                    'user_id' => 20,
                    'username' => "ach_soegianto",
                    'nama' => "Ach. Soegianto, S.Pd",
                    'password' => Hash::make("123456"),
                    'role' => 2,
                ],
                [
                    'user_id' => 21,
                    'username' => "deni_putra",
                    'nama' => "Deni Putra Pratama, S.Pd",
                    'password' => Hash::make("123456"),
                    'role' => 2,
                ],
            ]);
    }
}
