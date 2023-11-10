<?php

namespace App\Models;

class Utils
{
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
}
