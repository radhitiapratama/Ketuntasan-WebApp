<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\TahunAjaran;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Carbon\Carbon;

class KetuntasanController extends Controller
{
    protected $tahun;

    public function siswa(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'user_id' => "required",
                'semester' => "required",
            ],
            [
                'user_id.required' => "User ID wajib di isi",
                'semester.required' => "Semester wajib di isi"
            ]
        );

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => "failed",
                'errors' => $validator->errors()
            ]);
        }

        $tahun = TahunAjaran::select("tahun_ajaran_id")->where("user_aktif", 1)->first();

        $user_id = $request->user_id;
        $semester = $request->semester;



        $ketuntasan = DB::table('ketuntasan as k')
            ->select('m.nama_mapel', 'u.nama', 'k.*')
            ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
            ->join('users as u', 'u.user_id', '=', 'km.user_id')
            ->join('mapel as m', 'm.mapel_id', '=', 'km.mapel_id')
            ->where("k.user_id", $user_id)
            ->where("k.semester", $semester)
            ->where("k.tahun_ajaran_id", $tahun->tahun_ajaran_id)
            ->get();


        if (empty($ketuntasan)) {
            return response()->json([
                'status' => false,
                'message' => "data ketuntasan not found"
            ]);
        }

        return response()->json([
            'status' => true,
            'message' => "success",
            'data' => $ketuntasan
        ]);
    }

    public function guru_mapel(Request $request)
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
                'errors' => $validator->fails()
            ]);
        }

        $mapel = DB::table("guru_mapel as gm")
            ->select('m.mapel_id', 'm.nama_mapel')
            ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
            ->where("gm.user_id", $request->user_id)
            ->where("gm.status", 1)
            ->get();


        return response()->json([
            'status' => true,
            'message' => "success",
            'data' => $mapel,
        ]);
    }

    public function guru_kelas(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => "required",
            'mapel_id' => "required"
        ], [
            'user_id.required' => "User ID wajib di isi",
            'mapel_id.required' => "Mapel ID wajib di isi",
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => "failed",
                'errors' => $validator->fails(),
            ]);
        }

        $this->tahun = TahunAjaran::select("tahun_ajaran_id")->where("user_aktif", 1)->first();

        $sql_kelas = DB::table("kelas_mapel as km")
            ->select("km.tingkatan", 'km.kelas_id', 'km.jurusan_id', 'k.nama_kelas')
            ->join('kelas as k', 'k.kelas_id', '=', 'km.kelas_id')
            ->join('jurusan as j', 'j.jurusan_id', '=', 'km.jurusan_id')
            ->where("km.user_id", $request->user_id)
            ->where("km.mapel_id", $request->mapel_id)
            ->where("km.tahun_ajaran_id", $this->tahun->tahun_ajaran_id)
            ->get();

        return response()->json([
            'status' => false,
            'message' => "success",
            'data' => $sql_kelas
        ]);
    }

    public function guru_siswa(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => "required",
            'mapel_id' => "required",
            'tingkatan' => "required",
            'jurusan_id' => "required",
            'kelas_id' => "required",
            "semester" => "required"
        ], [
            'user_id.required' => "User ID wajib di isi",
            'mapel_id.required' => "Mapel ID wajib di isi",
            'tingkatan.required' => "Tingkatan wajib di isi",
            'kelas_id' => "Kelas ID wajib di isi",
            'jurusan_id' => "Jurusan ID wajib di isi",
            'semester' => "Semester wajib di isi"
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => "failed",
                'errors' => $validator->fails(),
            ]);
        }

        $this->tahun = TahunAjaran::select("tahun_ajaran_id")->where("user_aktif", 1)->first();

        $sql_user = DB::table("users as u")
            ->select("k.ketuntasan_id", 'k.tuntas', 'k.desc', 'k.tgl_tuntas', 'k.semester', 'u.nama')
            ->join('ketuntasan as k', 'k.user_id', '=', 'u.user_id')
            ->join('kelas_mapel as km', 'km.kelas_mapel_id', '=', 'k.kelas_mapel_id')
            ->where("k.semester", $request->semester)
            ->where("k.tahun_ajaran_id", $this->tahun->tahun_ajaran_id)
            ->where("u.tingkatan", $request->tingkatan)
            ->where("u.jurusan_id", $request->jurusan_id)
            ->where("u.kelas_id", $request->kelas_id)
            ->where("km.status", 1)
            ->where("km.user_id", $request->user_id)
            ->where("km.mapel_id", $request->mapel_id)
            ->get();

        return response()->json([
            'status' => true,
            'message' => "success",
            'data' => $sql_user
        ]);
    }

    public function tuntaskan(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'ketuntasan_id' => "required",
        ], [
            'ketuntasan_id.required' => "Ketuntasan ID Wajib di isi"
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => "failed",
                'errors' => $validator->fails(),
            ]);
        }

        $ketuntasan_id = $request->ketuntasan_id;
        $desc = null;
        if ($request->desc != null) {
            $desc = $request->desc;
        }

        for ($i = 0; $i < count($ketuntasan_id); $i++) {
            DB::table("ketuntasan")
                ->where("ketuntasan_id", $ketuntasan_id[$i])
                ->update([
                    'tuntas' => 1,
                    'desc' => $desc,
                    'tgl_tuntas' => Carbon::now(),
                ]);
        }

        return response()->json([
            'status' => true,
            'message' => "Data siswa berhasil di tuntaskan",
            'desc' => $desc,
        ]);
    }

    public function update(Request $request)
    {
        // return response()->json($request->all());

        $validator = Validator::make($request->all(), [
            'ketuntasan_id' => "required",
            'tuntas' => "required",
        ], [
            'ketuntasan_id.required' => "User ID Wajib di isi",
            'tuntas.required' => "Status Tuntas wajib di isi"
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => "failed",
                'errors' => $validator->fails(),
            ]);
        }

        $dataUpdate['desc']  =  $request->desc ? $request->desc : null;
        $dataUpdate['tuntas'] = $request->tuntas;

        if ($request->tuntas == 0) {
            $dataUpdate['tgl_tuntas'] = null;
        }

        if ($request->tuntas == 1) {
            $dataUpdate['tgl_tuntas'] = Carbon::now();
        }

        DB::table("ketuntasan")
            ->where("ketuntasan_id", $request->ketuntasan_id)
            ->update($dataUpdate);

        return response()->json([
            'status' => true,
            'message' => "Data ketuntasan berhasil di update",
        ]);
    }
}
