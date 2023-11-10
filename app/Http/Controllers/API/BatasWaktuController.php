<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\TahunAjaran;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BatasWaktuController extends Controller
{
    public function index()
    {
        $tahun = TahunAjaran::select("tahun_ajaran_id")->where("user_aktif", 1)->first();
        $sql = DB::table('batas_waktu')
            ->where("tahun_ajaran_id", $tahun->tahun_ajaran_id)
            ->where("status", 1)
            ->first();

        return response()->json([
            'status' => true,
            'data' => [
                'tglMulai' => $sql->start_date,
                'tglSelesai' => $sql->end_date,
            ],
        ]);
    }
}
