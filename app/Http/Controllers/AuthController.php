<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use Illuminate\Support\Facades\Gate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use PDO;

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

        // $credentials = array();

        // $sql_admin = DB::table("users as u")
        //     ->join('admin as ad', 'ad.user_id', '=', 'u.user_id')
        //     ->where("ad.username", $request->username)
        //     ->first();

        // if (!empty($sql_admin)) {
        //     $credentials = (array) $sql_admin;
        // }

        // $sql_guru = DB::table("users as u")
        //     ->join('guru as g', 'g.user_id', '=', 'u.user_id')
        //     ->where("g.username", $request->username)
        //     ->first();

        // if (!empty($sql_guru)) {
        //     $credentials = (array) $sql_guru;
        // }

        // $sql_siswa = DB::table("users as u")
        //     ->join('siswa as s', 's.user_id', '=', 'u.user_id')
        //     ->where("s.username", $request->username)
        //     ->first();

        // if (!empty($sql_siswa)) {
        //     $credentials = (array) $sql_siswa;
        // }

        // if (Auth::attempt($validated)) {
        //     dd(auth()->user());

        //     $request->session()->regenerate();


        //     if (auth()->user()->role == 1) {
        //         return redirect()->intended("/tahun-ajaran");
        //     }

        //     if (auth()->user()->role == 2 || auth()->user()->role == 3) {
        //         return redirect()->intended("/ketuntasan");
        //     }
        // }

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

        if (Gate::allows("guru")) {
            $sql_user = DB::table("users")
                ->where("user_id", auth()->user()->user_id)
                ->first();

            $sql_mapel = DB::table("guru_mapel as gm")
                ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
                ->where("gm.user_id", auth()->user()->user_id)
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

            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        DB::table("users")
            ->where('user_id', auth()->user()->user_id)
            ->update([
                'password' => Hash::make($request->new_password)
            ]);

        return redirect()->back()->with("successUpdate", "successUpdate");
    }
}
