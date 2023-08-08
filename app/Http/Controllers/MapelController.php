<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Mapel;
use App\Imports\MapelImport;
use Illuminate\Auth\Events\Validated;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\CssSelector\XPath\Extension\FunctionExtension;
use Symfony\Component\HttpKernel\Event\ResponseEvent;

class MapelController extends Controller
{
    protected $roles = [];
    protected $statuses = [];

    public function __construct()
    {
        $this->roles = [
            '1' => "Superadmin",
            '2' => "Guru",
            '3' => "Siswa",
        ];

        $this->statuses = [
            '1' => "Aktif",
            '0' => "Nonaktif",
        ];
    }

    public function index(Request $request)
    {
        if ($request->ajax()) {
            $columnsSearch = ['nama_mapel'];
            $table  = DB::table("mapel");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            $query = $table->select('mapel_id', 'nama_mapel', 'status');

            $count = $query->count();

            $result = $query->offset($request->start)->limit($request->length)->get();

            $data = [];

            if (!empty($result)) {
                $i = $request->start;
                foreach ($result as $row) {
                    $i++;
                    $subData = [];
                    $subData['no'] = $i;
                    $subData['nama_mapel'] = $row->nama_mapel;

                    $subData['status'] = '
                    <div class="text-center">
                        <span class="badge badge-danger p-2">Nonaktif</span>
                    </div>
                    ';

                    if ($row->status == 1) {
                        $subData['status'] = '
                        <div class="text-center">
                            <span class="badge badge-success p-2">Aktif</span>
                        </div>
                        ';
                    }

                    $subData['setting'] = '
                    <div class="setting-icons">
                        <a href="/mapel/edit/' . $row->mapel_id . '" class="setting-edit m-auto">
                            <i class="ri-pencil-line"></i>
                        </a>
                    </div>
                    ';

                    $data[] = $subData;
                }
            }

            return response()->json([
                'draw' => $request->draw,
                'recordsFiltered' => $count,
                'recordsTotal' => $count,
                'data' => $data,
            ]);
        }

        return view("pages.mapel.index");
    }

    public function add()
    {
        return view("pages.mapel.add");
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'nama_mapel' => "required",
        ]);

        $data_insert = [
            'nama_mapel' => $request->input("nama_mapel"),
        ];

        DB::table("mapel")
            ->insert($data_insert);

        return redirect("/mapel")->with("successStore", "successStore");
    }

    public function edit($mapel_id)
    {
        $sql_mapel = DB::table("mapel")
            ->select('mapel_id', 'nama_mapel', 'status')
            ->where('mapel_id', '=', $mapel_id)
            ->first();

        $sql_mapel = Mapel::select("mapel_id", 'nama_mapel', 'status')->where("mapel_id", $mapel_id)->first();

        if (empty($sql_mapel)) {
            return redirect()->back();
        }

        $dataToView = [
            'mapel' => $sql_mapel,
            'statuses' => $this->statuses,
        ];

        return view("pages.mapel.edit", $dataToView);
    }

    public function update(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'mapel_id' => "required",
                'nama_mapel' => 'required',
                'status' => 'required',
            ],
            [
                'required' => ":attribute wajib di isi"
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $dataUpdate = [];
        $sql_mapel = Mapel::where("mapel_id", $request->mapel_id)->first();

        if ($sql_mapel->nama_mapel != $request->nama_mapel) {
            $sql_check = Mapel::select("mapel_id")->where("nama_mapel", $request->nama_mapel)->first();
            if ($sql_check) {
                return redirect()->back()->with("duplicateMapel", "duplicateMapel");
            }
            $dataUpdate['nama_mapel'] = $request->nama_mapel;
        }

        if ($sql_mapel->status != $request->status) {
            $dataUpdate['status'] = $request->status;
        }

        DB::table("mapel")
            ->where('mapel_id', '=', $request->mapel_id)
            ->update($dataUpdate);

        return redirect()->back()->with('successUpdate', "successUpdate");
    }

    public function importMapel(Request $request)
    {
        $validated = $request->validate([
            'file' => "required|mimes:xlsx,csv"
        ]);

        $file = $request->file('file');
        $mapel = new MapelImport;
        $mapel->import($file);

        return redirect("/mapel")->with("successImport", "successImport");
    }

    public function getDataMapel(Request $request)
    {
    }
}
