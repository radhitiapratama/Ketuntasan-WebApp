<?php

namespace App\Http\Controllers;

use App\Models\Utils;
use Carbon\Carbon;
use Dflydev\DotAccessData\Util;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
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
        $validator = Validator::make($request->all(), [
            'username' => "required",
            "nama" => "required",
            "level" => "required"
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator->errors());
        }

        $username = $request->username;

        if (!Utils::validateUsername([
            'type' => "insert",
            'username' => $request->username
        ])) {
        }


        try {
            DB::beginTransaction();
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

            DB::commit();
            return redirect()->back()->with("success", "Data berhasil di tambahkan");
        } catch (QueryException $ex) {
            DB::rollBack();
            return redirect()->back()->withInput()->with("duplicate", "Username sudah di gunakan!");
        }
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
        $validator = Validator::make($request->all(), [
            'username' => "required",
            "nama" => "required",
            "level" => "required"
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator->errors());
        }

        $username = $request->username;

        if (!Utils::validateUsername([
            'type' => "update",
            'table' => "operator",
            'id' => $request->id,
            'username' => $request->username
        ])) {
            return redirect()->back()->withInput()->with("duplicate", "Username sudah di gunakan!");
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
