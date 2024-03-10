<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;
use App\Models\Admin;
use PhpOffice\PhpSpreadsheet\Calculation\Engine\Operands\Operand;
use Symfony\Component\CssSelector\Node\FunctionNode;

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

    public static  $tingkatans = [
        '1' => "X",
        '2' => "XI",
        '3' => "XII",
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

    /**
     * @param array => [
     *      type,
     *      table?,
     *      id?
     *      username
     * ]
     */
    public static function validateUsername(array $array)
    {
        if ($array['type'] == "insert") {
            $admin_users = Admin::where("status", 1)->pluck("username")->toArray();
            $operator_users = Operator::where("status", 1)->pluck("username")->toArray();
            $guru_users = Guru::where("status", 1)->pluck("username")->toArray();
            $siswa_users = Siswa::where("status", 1)->pluck("username")->toArray();
            $array_users = array_merge($admin_users, $operator_users, $guru_users, $siswa_users);
            if (in_array($array['username'], $array_users)) {
                return false;
            }

            return true;
        }

        if ($array['type'] == "update") {
            $admin_users = Admin::where("status", 1)->when($array['table'] == "admin", function ($query) use ($array) {
                $query->where("admin_id", '!=', $array['id']);
            })->pluck("username")->toArray();

            $operator_users = Operator::where("status", 1)->when($array['table'] == "operator", function ($query) use ($array) {
                $query->where("id", '!=', $array['id']);
            })->pluck("username")->toArray();

            $guru_users = Guru::where("status", 1)->when($array['table'] == "guru", function ($query) use ($array) {
                $query->where("guru_id", '!=', $array['id']);
            })->pluck("username")->toArray();

            $siswa_users = Siswa::where("status", 1)->when($array['table'] == "siswa", function ($query) use ($array) {
                $query->where("siswa_id", '!=', $array['id']);
            })->pluck("username")->toArray();

            $array_users = array_merge($admin_users, $operator_users, $guru_users, $siswa_users);

            if (in_array($array['username'], $array_users)) {
                return false;
            }

            return true;
        }
    }

    /**
     * 
     * @param arrayAssoc => [
     *      type,
     *      teacher_code,
     *      id
     * ]
     */
    public static function validateTeacherCode(array $array)
    {
        if ($array['type'] == "insert") {
            $teacher = Guru::where("status", 1)
                ->where("kode_guru", $array['teacher_code'])
                ->first();

            if ($teacher != null) {
                return false;
            }

            return true;
        }

        if ($array['type'] == "update") {
            $teacher = Guru::where("status", 1)
                ->where("kode_guru", $array['teacher_code'])
                ->where("guru_id", '!=', $array['id'])
                ->first();

            if ($teacher != null) {
                return false;
            }

            return true;
        }
    }

    public static function getTingkatans()
    {
        return self::$tingkatans;
    }
}
