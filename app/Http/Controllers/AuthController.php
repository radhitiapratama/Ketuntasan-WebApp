<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Facades\Gate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

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

        if (Auth::attempt($validated)) {
            $request->session()->regenerate();


            if (auth()->user()->role == 1) {
                return redirect()->intended("/tahun-ajaran");
            }

            if (auth()->user()->role == 2 || auth()->user()->role == 3) {
                return redirect()->intended("/ketuntasan");
            }
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
        if (Gate::allows("siswa")) {
            $sql_user = DB::table('users as u')
                ->join("jurusan as j", 'j.jurusan_id', '=', 'u.jurusan_id')
                ->join('kelas as k', 'k.kelas_id', '=', 'u.kelas_id')
                ->where('u.user_id', auth()->user()->user_id)
                ->first();

            $dataToView = [
                'user' => $sql_user,
            ];

            return view("pages.akun.index", $dataToView);
        }

        if (Gate::allows("admin")) {
            $sql_user = DB::table('users as u')
                ->where('u.user_id', auth()->user()->user_id)
                ->first();

            $dataToView = [
                'user' => $sql_user
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
        $validated = $request->validate([
            'new_password' => "required|min:6",
        ]);

        DB::table("users")
            ->where('user_id', auth()->user()->user_id)
            ->update([
                'password' => Hash::make($request->new_password)
            ]);

        return redirect()->back()->with("successUpdate", "successUpdate");
    }
}
