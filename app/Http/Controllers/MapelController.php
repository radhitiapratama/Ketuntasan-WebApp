<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Mapel;
use App\Imports\MapelImport;
use Illuminate\Auth\Events\Validated;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

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
            $columnsSearch = ['nama_mapel', 'mapel_id'];
            $table  = DB::table("mapel");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            $query = $table->select('mapel_id', 'nama_mapel', 'status');

            if ($request->status != null) {
                $query->where("status", $request->status);
            }

            $count = $query->count();

            $result = $query->offset($request->start)
                ->limit($request->length)
                ->orderBy("mapel_id", 'ASC')
                ->get();

            $data = [];

            if (!empty($result)) {
                $i = $request->start;
                foreach ($result as $row) {
                    $i++;
                    $subData = [];
                    $subData['no'] = $i;
                    $subData['kode'] = '
                    <div class="text-center">
                        ' . $row->mapel_id . '
                    </div>
                    ';

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

        $dataToView = [
            'statuses' => $this->statuses,
        ];
        return view("pages.mapel.index", $dataToView);
    }

    public function add()
    {
        return view("pages.mapel.add");
    }

    public function store(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'nama_mapel' => "required|unique:mapel,nama_mapel",
            ],
            [
                'required' => "Nama Mapel wajib di isi",
                'unique' => "Nama Mapel sudah ada"
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        Mapel::create([
            'nama_mapel' => $request->nama_mapel,
            'created_by' => Auth::guard("admin")->user()->user_id
        ]);

        return redirect()->back()->with("successStore", "successStore");
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

        if ($sql_mapel == null) return redirect()->back();

        if ($sql_mapel->nama_mapel != $request->nama_mapel) {
            $sql_check = Mapel::select("mapel_id")->where("nama_mapel", $request->nama_mapel)->first();
            if ($sql_check) {
                return redirect()->back()->with("duplicateMapel", "duplicateMapel")->withInput();
            }
            $dataUpdate['nama_mapel'] = $request->nama_mapel;
        }

        if ($sql_mapel->status != $request->status) {
            $dataUpdate['status'] = $request->status;
        }

        if ($dataUpdate != []) {
            Mapel::where("mapel_id", $request->mapel_id)
                ->update($dataUpdate);
        }

        return redirect()->back()->with('successUpdate', "successUpdate");
    }

    public function import(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'excel_file' => "required|mimes:xlsx"
            ],
            [
                'excel_file.mimes' => 'Extensi file yg di import wajib .xlsx',
                'excel_file.required' => "File yg ingin di import wajib di isi"
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        $file = $request->file('excel_file');
        $mapel = new MapelImport;
        $mapel->import($file);

        return redirect("/mapel")->with("success_import", "Data Mapel berhasil di import");
    }
}
