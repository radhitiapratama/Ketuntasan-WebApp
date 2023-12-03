<?php

namespace App\Http\Controllers;

use App\Models\Utils;
use Carbon\Carbon;
use Dflydev\DotAccessData\Util;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\View\ViewFinderInterface;

class OperatorController extends Controller
{
    public function index()
    {
        $sql_operator = DB::table("operator")
            ->where('status', 1)
            ->get();

        $dataToView =  [
            'operators' => $sql_operator,
        ];

        return view("pages.operator.index", $dataToView);
    }

    public function add()
    {
        $dataToView = [
            'levels' => Utils::$operatorLevels,
        ];

        return view("pages.operator.add", $dataToView);
    }

    public function store(Request $request)
    {
        $username = $request->username;

        $sql_admin  = DB::table("admin")
            ->where('username', $username)
            ->first();

        if ($sql_admin) {
            return redirect()->back("duplicate", "Username sudah di gunakan")->withInput();
        }

        $sql_guru = DB::table("guru")
            ->where('username', $username)
            ->first();

        if ($sql_guru) {
            return redirect()->back("duplicate", "Username sudah di gunakan")->withInput();
        }

        $sql_siswa = DB::table("siswa")
            ->where('username', $username)
            ->first();

        if ($sql_siswa) {
            return redirect()->back("duplicate", "Username sudah di gunakan")->withInput();
        }

        $user_id = DB::table("users")
            ->insertGetId([
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
                'created_by' => Auth::guard("admin")->user()->user_id,
            ]);

        DB::table("operator")
            ->insert([
                'user_id' => $user_id,
                'username' => $username,
                'nama' => $request->nama,
                'password' => Hash::make($request->password),
                'status' => 1,
                'level' => $request->level,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]);

        return redirect()->back()->with("success", "Data berhasil di tambahkan");
    }

    public function edit($id)
    {
        if (!isset($id)) {
            return redirect()->back();
        }

        $sql_op = DB::table("operator")
            ->where('id', $id)
            ->first();

        if (empty($sql_op)) {
            return redirect()->back();
        }

        $dataToView = [
            'data' => $sql_op,
            'levels' => Utils::$operatorLevels
        ];

        return view("pages.operator.edit", $dataToView);
    }

    public function update(Request $request)
    {
        $username = $request->username;

        $sql_admin  = DB::table("admin")
            ->where('username', $username)
            ->first();

        if ($sql_admin) {
            return redirect()->back("duplicate", "Username sudah di gunakan")->withInput();
        }

        $sql_guru = DB::table("guru")
            ->where('username', $username)
            ->first();

        if ($sql_guru) {
            return redirect()->back("duplicate", "Username sudah di gunakan")->withInput();
        }

        $sql_siswa = DB::table("siswa")
            ->where('username', $username)
            ->first();

        if ($sql_siswa) {
            return redirect()->back("duplicate", "Username sudah di gunakan")->withInput();
        }

        DB::table("operator")
            ->where('id', $request->id)
            ->update([
                'username' => $username,
                'nama' => $request->nama,
                'level' => $request->level,
            ]);

        return redirect()->back()->with("success", "Data berhasil di update");
    }
}
