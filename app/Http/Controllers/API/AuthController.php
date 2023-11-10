<?php

namespace App\Http\Controllers\API;

use App\Models\Guru;
use App\Models\User;
use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\Siswa;
use App\Models\Utils;
use Illuminate\Support\Facades\Auth;
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
        //jika user tidak di temukan
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

    public function logout()
    {
        request()->user()->tokens()->delete();
        request()->user()->currentAccessToken()->delete();
        return response()->json([
            "status" => true,
            'message' => "Berhasil Logout",
        ]);
    }

    public function account()
    {

        // Jika yg login siswa
        if (Auth::user()->siswa_id) {
            $sql_siswa = DB::table('siswa as s')
                ->join('jurusan as j', 'j.jurusan_id', '=', 's.jurusan_id')
                ->join('kelas as k', 'k.kelas_id', '=', 's.kelas_id')
                ->where('s.siswa_id', Auth::user()->siswa_id)
                ->select('s.*', 'j.nama_jurusan', 'k.nama_kelas')
                ->first();

            if (empty($sql_siswa)) {
                return response()->json([
                    'status' => "false",
                    'message' => "siswa not found",
                ]);
            }

            $responseSiswa = [
                'tingkatan' => Utils::checkTingkatan($sql_siswa->tingkatan),
                'kelas' => $sql_siswa->nama_jurusan . " | " . $sql_siswa->nama_kelas,
                'username' => $sql_siswa->username,
                'nama' => $sql_siswa->nama,
            ];

            return response()->json([
                'status' => "success",
                'data' => [
                    'detail_siswa' => $responseSiswa,
                ]
            ]);
        }


        // Jika yg login guru
        if (Auth::user()->guru_id) {
            $sql_guru = DB::table("guru")
                ->where('guru_id', Auth::user()->guru_id)
                ->first();

            $sql_mapel = DB::table("guru_mapel as gm")
                ->select('m.nama_mapel', 'gm.status', 'gm.kode_guru_mapel', 'g.kode_guru')
                ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
                ->join('guru as g', 'g.guru_id', '=', 'gm.guru_id')
                ->where('gm.guru_id', Auth::user()->guru_id)
                ->where('gm.status', 1)
                ->get();

            $responseMapels = [];

            if (!empty($sql_mapel)) {
                foreach ($sql_mapel as $row) {
                    if ($row->kode_guru_mapel) {
                        $kodeGuruMapel = $row->kode_guru . "," . $row->kode_guru_mapel;
                    } else {
                        $kodeGuruMapel = $row->kode_guru;
                    }

                    $detailMapel = [
                        'nama_mapel' => $row->nama_mapel,
                        'kode_guru_mapel' => $kodeGuruMapel,
                    ];

                    $responseMapels[] = $detailMapel;
                }
            }


            return response()->json([
                'status' => "success",
                'data' => [
                    'detail' => [
                        'username' => $sql_guru->username,
                        'nama' => $sql_guru->nama,
                        'kode_guru' => $sql_guru->kode_guru,
                        'status' => $sql_guru->status,
                    ],
                    'mapels' => $responseMapels,
                ],
            ]);
        }
    }

    public function changePassword(Request $request)
    {
        $password = $request->password;

        if (!isset($password)) {
            return response()->json([
                'status' => false,
                'message' => "Password wajib di isi",
            ]);
        }

        if (Auth::user()->siswa_id) {
            DB::table("siswa")
                ->where("siswa_id", Auth::user()->siswa_id)
                ->update([
                    'password' => Hash::make($password),
                ]);

            return response()->json([
                'status' => true,
                'message' => "Password anda berhasil di perbarui",
            ]);
        }

        if (Auth::user()->guru_id) {
            DB::table("guru")
                ->where("guru_id", Auth::user()->guru_id)
                ->update([
                    'password' => Hash::make($password),
                ]);

            return response()->json([
                'status' => true,
                'message' => "Password anda berhasil di perbarui",
            ]);
        }

        return response()->json([
            'status' => false,
            'message' => "Gagal mengubah password",
        ]);
    }

    public function changeUsername(Request $request)
    {
        $newUsername = $request->newUsername;

        if (!isset($newUsername)) {
            return response()->json([
                'status' => false,
                'message' => "Username wajib di isi",
            ]);
        }

        if (Auth::user()->siswa_id) {
            $sql_checkUsername = DB::table("siswa")->where("username", $newUsername)->first();

            if ($sql_checkUsername) {
                return response()->json([
                    'status' => false,
                    'message' => "Username sudah di gunakan",
                ]);
            }

            DB::table("siswa")->where("siswa_id", Auth::user()->siswa_id)
                ->update([
                    'username' => $newUsername,
                ]);

            return response()->json([
                'status' => true,
                'message' => "Username anda berhasil di perbarui",
            ]);
        }

        if (Auth::user()->guru_id) {
            $sql_checkUsername = DB::table("guru")->where("username", $newUsername)->first();

            if ($sql_checkUsername) {
                return response()->json([
                    'status' => false,
                    'message' => "Username sudah di gunakan",
                ]);
            }

            DB::table("guru")->where("guru_id", Auth::user()->guru_id)
                ->update([
                    'username' => $newUsername,
                ]);

            return response()->json([
                'status' => true,
                'message' => "Username anda berhasil di perbarui",
            ]);
        }

        return response()->json([
            'status' => false,
            'message' => "Gagal mengubah username",
        ]);
    }
}
