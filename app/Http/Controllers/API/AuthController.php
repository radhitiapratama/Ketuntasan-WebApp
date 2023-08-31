<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\Mapel;
use Illuminate\Support\Facades\DB;

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

        $user = User::where("username", $request->username)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json([
                'status' => false,
                'message' => "username / password salah",
            ]);
        }

        return response()->json([
            'status' => true,
            'message' => "login success",
            'data' => [
                'user' => $user,
                'token' => $user->createToken("auth-token")->plainTextToken,
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

    public function account(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'user_id' => "required",
            ],
            [
                'user_id.required' => "User ID wajib di isi"
            ]
        );

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => "failed",
                'errors' => $validator->errors(),
            ]);
        }

        $user_id = $request->user_id;

        $user = User::where("user_id", $user_id)->first();

        if ($user->role == 2) {
            $sql_mapel = DB::table('guru_mapel as gm')
                ->select('m.nama_mapel')
                ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
                ->where("gm.user_id", $user->user_id)
                ->where("gm.status", 1)
                ->get();

            return response()->json([
                'status' => true,
                'message' => "success",
                'data' => [
                    'user' => $user,
                    'mapels' => $sql_mapel,
                ]
            ]);
        }

        if ($user->role == 3) {
            return response()->json([
                'status' => true,
                'message' => "success",
                'data' => $user
            ]);
        }
    }

    public function changePassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => "required",
        ], [
            'user_id.required' => "User ID wajib di isi",
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => "falled",
                'errors' => $validator->errors()
            ]);
        }

        DB::table('users')
            ->where("user_id", $request->user_id)
            ->update([
                'password' => Hash::make($request->password)
            ]);

        return response()->json([
            'status' => true,
            'message' => "success password successfully changed",
        ]);
    }
}
