<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\TahunAjaran;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

use App\Models\User;

class GuruController extends Controller
{
    protected $tahun;
    public function siswa(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => "required",
        ], [
            'user_id.required' => "User ID wajib di isi"
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => "failed",
                'errors' => $validator->errors()
            ]);
        }

        $this->tahun = TahunAjaran::select("tahun_ajaran_id")->where("user_aktif", 1)->first();

        $sql_waliKelas = DB::table("wali_kelas")
            ->select("tingkatan", 'jurusan_id', 'kelas_id')
            ->where("user_id", $request->user_id)
            ->first();

        $sql_totalMapel = DB::table("kelas_mapel")
            ->where("tingkatan", $sql_waliKelas->tingkatan)
            ->where("jurusan_id", $sql_waliKelas->jurusan_id)
            ->where("kelas_id", $sql_waliKelas->kelas_id)
            ->where("status", 1)
            ->count();

        $sql_user = User::with([
            'ketuntasan' => function ($query) {
                $query->where("tuntas", 1)
                    ->whereIn("semester", ['1', '2'])
                    ->where("tahun_ajaran_id", $this->tahun->tahun_ajaran_id);
            }
        ])
            ->where("tingkatan", $sql_waliKelas->tingkatan)
            ->where("jurusan_id", $sql_waliKelas->jurusan_id)
            ->where("kelas_id", $sql_waliKelas->kelas_id)
            ->where('status', 1)
            ->get();

        $dataResponse = [
            'status' => true,
            'message' => "success"
        ];

        foreach ($sql_user as $user) {
            $subData['user_id'] = $user->user_id;
            $subData['nama'] = $user->nama;
            $subData['semester1'] = $user->ketuntasan->where("semester", 1)->count() . " / " . $sql_totalMapel;
            $subData['semester2'] =  $user->ketuntasan->where("semester", 2)->count() . " / " . $sql_totalMapel;

            $dataResponse[] = $subData;
        }

        return response()->json($dataResponse, 200);
    }
}
