<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;

class Utils
{
    public static $sesis = [
        1, 2, 3
    ];

    public static $ruangs = [
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
    ];

    public static $tidak_lanjuts = [
        1 => "Diperbolehkan Masuk",
        2 => "Ikut di sesi berikutnya"
    ];

    public static $operatorLevels = [
        1, 2
    ];

    public static $tuntases = [
        '1' => "Tuntas",
        '0' => "Belum Tuntas",
    ];

    public static $semesters = [
        1, 2
    ];

    public static $alasansTidakHadir = [
        '1' => "Izin",
        '2' => "Sakit",
        '3' => "Tanpa Keterangan"
    ];

    public static function checkTingkatan($tingkatan)
    {
        if ($tingkatan == 1) {
            return "X";
        }
        if ($tingkatan == 2) {
            return "XI";
        }
        if ($tingkatan == 3) {
            return "XII";
        }
    }

    public static function checkTidakLanjut($string)
    {
        if ($string == 1) {
            return "Diperbolehkan Masuk";
        }

        if ($string == 2) {
            return "Ikut di sesi berikutnya";
        }
    }

    public static function checkAlasanTidakHadir($string)
    {
        if ($string == 1) {
            return "Izin";
        }

        if ($string == 2) {
            return "Izin";
        }

        if ($string == 3) {
            return "Tanpa Keterangan";
        }
    }

    public static function getTahunAjaranUser()
    {
        $sql = DB::table("tahun_ajaran")
            ->where('user_aktif', 1)
            ->first();

        return $sql->tahun_ajaran_id;
    }
}
