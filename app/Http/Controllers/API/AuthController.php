<?php

namespace App\Http\Controllers\API;

use App\Models\Guru;
use App\Models\User;
use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Siswa;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username' => "required",
            'nama' => "required",
            'password' => "required",
            'role' => "required",
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => $validator->errors(),
            ]);
        }

        $user = User::create([
            'username' => $request->username,
            'nama' => $request->nama,
            'password' => Hash::make($request->password),
            'role' => 1,
        ]);

        return response()->json([
            'status' => true,
            'message' => "user successfully registered",
            'data' => [
                'token' => $user->createToken("auth-token")->plainTextToken,
            ]
        ]);
    }

    public function login(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'username' => "required",
                'password' => "required|min:6"
            ],
            [
                'username.required' => "username wajib di isi",
                'password.required' => "password wajib di isi",
                'password.min' => "password minimal 6 karakter",
            ]
        );

        if ($validator->fails()) {
            return response()->json(
                [
                    'status' => false,
                    'message' => "login failed",
                    'data' => $validator->errors(),
                ]
            );
        }

        $sql_admin = Admin::where("username", $request->username)->first();

        if ($sql_admin) {
            $token = $sql_admin->createToken("api-token")->plainTextToken;
            return $this->checkLogin($sql_admin, $request->password, $token);
        }

        $sql_guru = Guru::where("username", $request->username)->first();

        if ($sql_guru) {
            $token = $sql_guru->createToken("api-token")->plainTextToken;
            return $this->checkLogin($sql_guru, $request->password, $token);
        }

        $sql_siswa = Siswa::where("username", $request->username)->first();

        if ($sql_siswa) {
            $token = $sql_siswa->createToken("api-token")->plainTextToken;
            return $this->checkLogin($sql_siswa, $request->password, $token);
        }

        return response()->json([
            'status' => false,
            'message' => "username / password salah",
        ]);
    }

    public function checkLogin($user_data, $request_password, $token)
    {
        if (!$user_data || !Hash::check($request_password, $user_data->password)) {
            return response()->json([
                'status' => false,
                'message' => "username / password salah",
            ]);
        }

        return response()->json([
            'status' => true,
            'message' => "login success",
            'data' => [
                'user' => $user_data,
                'token' => $token,
            ]
        ]);
    }

    public function logout(Request $request)
    {
        $request->user()->tokens()->delete();
        $request->user()->currentAccessToken()->delete();
        return response()->json([
            "status" => true,
            'message' => "success logout",
        ]);
    }

    // public function account(Request $request)
    // {
    //     $validator = Validator::make(
    //         $request->all(),
    //         [
    //             'user_id' => "required",
    //         ],
    //         [
    //             'user_id.required' => "User ID wajib di isi"
    //         ]
    //     );

    //     if ($validator->fails()) {
    //         return response()->json([
    //             'status' => false,
    //             'message' => "failed",
    //             'errors' => $validator->errors(),
    //         ]);
    //     }

    //     $user_id = $request->user_id;

    //     $user = User::where("user_id", $user_id)->first();

    //     if ($user->role == 2) {
    //         $sql_mapel = DB::table('guru_mapel as gm')
    //             ->select('m.nama_mapel')
    //             ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
    //             ->where("gm.user_id", $user->user_id)
    //             ->where("gm.status", 1)
    //             ->get();

    //         return response()->json([
    //             'status' => true,
    //             'message' => "success",
    //             'data' => [
    //                 'user' => $user,
    //                 'mapels' => $sql_mapel,
    //             ]
    //         ]);
    //     }

    //     if ($user->role == 3) {
    //         return response()->json([
    //             'status' => true,
    //             'message' => "success",
    //             'data' => $user
    //         ]);
    //     }
    // }

    public function account(Request $request)
    {
        $siswa_id = $request->query("siswa");
        $guru_id = $request->query("guru");

        if (isset($siswa_id)) {
            $sql_siswa = DB::table('siswa as s')
                ->join('jurusan as j', 'j.jurusan_id', '=', 's.jurusan_id')
                ->join('kelas as k', 'k.kelas_id', '=', 's.kelas_id')
                ->where('s.siswa_id', $siswa_id)
                ->select('s.*', 'j.nama_jurusan', 'k.nama_kelas')
                ->first();

            if (empty($sql_siswa)) {
                return response()->json([
                    'status' => "false",
                    'message' => "siswa not found",
                ]);
            }

            return response()->json([
                'status' => "success",
                'data' => $sql_siswa,
            ]);
        }

        if (isset($guru_id)) {
            $sql_guru = DB::table("guru")
                ->where('guru_id', $guru_id)
                ->first();

            $sql_mapel = DB::table("guru_mapel as gm")
                ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
                ->where('gm.guru_id', $guru_id)
                ->where('gm.status', 1)
                ->get();

            return response()->json([
                'status' => "success",
                'data' => [
                    'detail' => $sql_guru,
                    'mapels' => $sql_mapel,
                ],
            ]);
        }
    }

    public function changePassword(Request $request)
    {
        $siswa_id = $request->siswa;
        $guru_id = $request->guru;
        $password = $request->password;

        if (isset($siswa_id)) {
            DB::table("siswa")
                ->where("siswa_id", $siswa_id)
                ->update([
                    'password' => Hash::make($password),
                ]);

            return response()->json([
                'status' => "success",
            ]);
        }

        if (isset($guru_id)) {
            DB::table("guru")
                ->where("guru_id", $guru_id)
                ->update([
                    'password' => Hash::make($password),
                ]);

            return response()->json([
                'status' => "success",
            ]);
        }
    }


    // public function changePassword(Request $request)
    // {
    //     $validator = Validator::make($request->all(), [
    //         'user_id' => "required",
    //     ], [
    //         'user_id.required' => "User ID wajib di isi",
    //     ]);

    //     if ($validator->fails()) {
    //         return response()->json([
    //             'status' => false,
    //             'message' => "falled",
    //             'errors' => $validator->errors()
    //         ]);
    //     }

    //     DB::table('users')
    //         ->where("user_id", $request->user_id)
    //         ->update([
    //             'password' => Hash::make($request->password)
    //         ]);

    //     return response()->json([
    //         'status' => true,
    //         'message' => "success password successfully changed",
    //     ]);
    // }
}
