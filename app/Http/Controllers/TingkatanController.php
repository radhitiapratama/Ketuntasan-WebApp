<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TingkatanController extends Controller
{
    protected $statuses = [
        '1' => "Aktif",
        '0' => "Nonaktif",
    ];

    public function index()
    {
        $sql_tingkatan = DB::table("tingkatan")
            ->select("tingkatan_id", 'nama_tingkatan', 'status')
            ->get();

        $dataToView = [
            'tingkatans' => $sql_tingkatan,
            'statuses' => $this->statuses,
        ];

        return view("pages.tingkatan.index", $dataToView);
    }

    public function add()
    {
        return view("pages.tingkatan.add");
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'nama_tingkatan' => "required",
        ]);

        DB::table("tingkatan")->insert([
            "nama_tingkatan" => $request->input("nama_tingkatan"),
            'created_at' => date("Y-m-d")
        ]);


        return redirect("/tingkatan");
    }

    public function edit($tingkatan_id)
    {
        if (!isset($tingkatan_id)) {
            return redirect("/tingkatan");
        }

        $sql_tingkatan = DB::table("tingkatan")
            ->select('tingkatan_id', 'nama_tingkatan', 'status')
            ->where('tingkatan_id', $tingkatan_id)
            ->first();

        if (empty($sql_tingkatan)) {
            return redirect('/tingkatan');
        }

        $dataToView = [
            'tingkatan' => $sql_tingkatan,
            'statuses' => $this->statuses
        ];

        return  view("pages.tingkatan.edit", $dataToView);
    }

    public function update(Request $request)
    {
        $validated = $request->validate([
            "tingkatan_id" => "required",
            'nama_tingkatan' => "required",
            'status' => "required",
        ]);


        $data_update = [
            "nama_tingkatan" => $request->input("nama_tingkatan"),
            'status' => $request->input("status"),
        ];

        DB::table("tingkatan")
            ->where("tingkatan_id", '=', $request->input("tingkatan_id"))
            ->update($data_update);

        return redirect("/tingkatan");
    }
}
