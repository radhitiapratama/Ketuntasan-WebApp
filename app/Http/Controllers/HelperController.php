<?php

namespace App\Http\Controllers;

use App\Models\Siswa;
use App\Models\TahunAjaran;
use App\Models\Ujian;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HelperController extends Controller
{
    protected $tahun;

    public function __construct()
    {
        $this->tahun = TahunAjaran::where("superadmin_aktif", 1)->first()->tahun_ajaran_id;
    }

    // @response type JSON
    public function getOrderedSiswaByKelas($tingkatan, $jurusan, $kelas, $semester)
    {
        $siswa_has_ujian = Ujian::query()
            ->with([
                'siswa' => function ($query) use ($tingkatan, $jurusan, $kelas) {
                    $query->where("status", 1)
                        ->where("tingkatan", $tingkatan)
                        ->where("jurusan_id", $jurusan)
                        ->where("kelas_id", $kelas);
                }
            ])
            ->where('tahun_ajaran_id', $this->tahun)
            ->where("semester", $semester)->get();

        $siswa = Siswa::where('tingkatan', $tingkatan)
            ->where("jurusan_id", $jurusan)
            ->where("kelas_id", $kelas)
            ->where("status", 1)
            ->whereNotIn("siswa_id", $siswa_has_ujian->pluck("siswa_id"))
            ->orderBy("nama", "ASC")
            ->get();

        return response()->json($siswa);
    }
}
