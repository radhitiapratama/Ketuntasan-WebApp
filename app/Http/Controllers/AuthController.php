<?php

namespace App\Http\Controllers;

use PDO;
use App\Models\Guru;
use App\Models\Admin;
use App\Models\Siswa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Psr\Http\Message\ResponseInterface;

class AuthController extends Controller
{
    public function index()
    {
        return view("pages.login.index");
    }

    public function login(Request $request)
    {
        $validated = $request->validate([
            'username' => "required",
            'password' => "required",
        ]);

        if (Auth::guard("admin")->attempt($validated)) {
            $request->session()->regenerate();
            return redirect()->intended("/tahun-ajaran");
        }
        if (Auth::guard('guru')->attempt($validated)) {
            $request->session()->regenerate();
            return redirect()->intended("/ketuntasan");
        }

        if (Auth::guard("siswa")->attempt($validated)) {
            $request->session()->regenerate();
            return redirect()->intended("/ketuntasan");
        }

        return redirect()->back()->with("loginFailed", "loginFailed")->withInput();
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect('/');
    }

    public function akun()
    {
        if (Auth::guard("siswa")->check()) {
            $sql_siswa = DB::table("siswa as s")
                ->join("jurusan as j", 'j.jurusan_id', '=', 's.jurusan_id')
                ->join('kelas as k', 'k.kelas_id', '=', 's.kelas_id')
                ->where('s.siswa_id', auth()->guard("siswa")->user()->siswa_id)
                ->first();

            $dataToView = [
                'user' => $sql_siswa,
            ];

            return view("pages.akun.index", $dataToView);
        }

        if (Auth::guard("admin")->check()) {
            $sql_user = Admin::where("admin_id", auth()->guard("admin")->user()->admin_id)->first();

            $dataToView = [
                'user' => $sql_user
            ];

            return view("pages.akun.index", $dataToView);
        }

        if (Auth::guard("guru")->check()) {
            $sql_user = Guru::where("guru_id", auth()->guard("guru")->user()->guru_id)->first();

            $sql_mapel = DB::table("guru_mapel as gm")
                ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
                ->where("gm.guru_id", auth()->guard("guru")->user()->guru_id)
                ->where("gm.status", 1)
                ->get();

            $dataToView =  [
                'user' => $sql_user,
                'mapels' => $sql_mapel
            ];

            return view("pages.akun.index", $dataToView);
        }
    }

    public function changePasswordPage()
    {
        return view("pages.akun.change-password");
    }

    public function changePassword(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'new_password' => "required|min:6",

            ],
            [
                'new_password.required' => "Password wajib di isi",
                'new_password.min' => "Password minimal 6 huruf"
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        if (Auth::guard("admin")->check()) {
            Admin::where("admin_id", auth()->guard("admin")->user()->admin_id)
                ->update([
                    'password' => Hash::make($request->new_password)
                ]);
            return redirect()->back()->with("successUpdate", "successUpdate");
        }

        if (Auth::guard("guru")->check()) {
            Guru::where("guru_id", auth()->guard("guru")->user()->guru_id)
                ->update([
                    'password' => Hash::make($request->new_password)
                ]);
            return redirect()->back()->with("successUpdate", "successUpdate");
        }

        if (Auth::guard("siswa")->check()) {
            Siswa::where("siswa_id", auth()->guard("siswa")->user()->siswa_id)
                ->update([
                    'password' => Hash::make($request->new_password)
                ]);
            return redirect()->back()->with("successUpdate", "successUpdate");
        }
    }

    public function resetPassword()
    {
        return view("pages.reset-password.index");
    }

    public function getDataAccountByUsername(Request $request)
    {
        $sql_admin = Admin::where("username", $request->username)->first();

        if (isset($sql_admin)) {
            return response()->json($sql_admin);
        }

        $sql_guru = Guru::where("username", $request->username)->first();

        if (isset($sql_guru)) {
            return response()->json($sql_guru);
        }

        $sql_siswa = DB::table('siswa as s')
            ->select('s.*', 'j.nama_jurusan', 'k.nama_kelas')
            ->join('jurusan as j', 'j.jurusan_id', '=', 's.jurusan_id')
            ->join('kelas as k', 'k.kelas_id', '=', 's.kelas_id')
            ->where('s.username', $request->username)
            ->first();

        if (isset($sql_siswa)) {
            return response()->json($sql_siswa);
        }

        return response()->json([
            'status' => false,
        ]);
    }

    public function doResetPassword(Request $request)
    {
        $role = $request->role;
        $newPassword = $request->newPassword;

        if ($role == 1) {
            $adminId = $request->adminId;

            DB::table("admin")
                ->where('admin_id', $adminId)
                ->update([
                    'password' => Hash::make($newPassword),
                ]);

            return response()->json([
                'status' => "success",
            ]);
        }

        if ($role == 2) {
            $guruId = $request->guruId;

            DB::table("guru")
                ->where('guru_id', $guruId)
                ->update([
                    'password' => Hash::make($newPassword),
                ]);

            return response()->json([
                'status' => "success",
            ]);
        }


        if ($role == 3) {
            $siswaId = $request->siswaId;

            DB::table("siswa")
                ->where('siswa_id', $siswaId)
                ->update([
                    'password' => Hash::make($newPassword),
                ]);

            return response()->json([
                'status' => "success",
            ]);
        }
    }
}
