<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Imports\JurusanImport;
use App\Models\Jurusan;
use Illuminate\Support\Facades\Validator;

class JurusanController extends Controller
{
    protected $statuses = [
        '1' => "Aktif",
        '0' => "Nonaktif",
    ];

    public function index(Request $request)
    {
        if ($request->ajax()) {
            $columnsSearch = ['nama_jurusan'];
            $table = DB::table("jurusan");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            if ($request->status != null) {
                $table->where("status", $request->status);
            }

            $count = $table->count();

            $result = $table->offset($request->start)
                ->limit($request->length)
                ->orderByRaw("jurusan_id DESC")
                ->get();

            $data = [];
            if (!empty($result)) {
                $i = $request->start;
                foreach ($result as $row) {
                    $i++;
                    $subData = [];
                    $subData['no'] = $i;
                    $subData['kode_kelas'] = ' 
                    <div class="text-center">
                        ' . $row->jurusan_id . '
                    </div>
                    ';

                    $subData['jurusan'] = $row->nama_jurusan;
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
                    $subData['settings'] = '
                    <div class="setting-icons">
                        <a href=" ' . url("jurusan/edit/$row->jurusan_id") . '" class="setting-edit m-auto">
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

        return view("pages.jurusan.index");
    }

    public function add()
    {
        return view("pages.jurusan.add");
    }

    public function store(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'nama_jurusan' => "required|unique:jurusan,nama_jurusan"
            ],
            [
                'unique' => ":attribute sudah ada"
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        Jurusan::create([
            'nama_jurusan' => $request->nama_jurusan
        ]);

        return redirect()->back()->with("successStore", "successStore");
    }

    public function edit($jurusan_id)
    {
        if (!isset($jurusan_id)) {
            return redirect()->back();
        }

        $sql_jurusan = DB::table("jurusan")
            ->select('jurusan_id', 'nama_jurusan', 'status')
            ->where('jurusan_id', $jurusan_id)
            ->first();

        if (empty($sql_jurusan)) {
            return redirect()->back();
        }

        $dataToView = [
            "jurusan" => $sql_jurusan,
            'statuses' => $this->statuses,
        ];

        return view("pages.jurusan.edit", $dataToView);
    }

    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            "jurusan_id" => "required",
            'nama_jurusan' => "required",
            'status' => "required"
        ]);

        if ($validator->fails()) {
            redirect()->back()->withErrors($validator)->withInput();
        }

        $dataUpdate = [];
        $sql_jurusan = Jurusan::where("jurusan_id", $request->jurusan_id)->first();

        if ($sql_jurusan->nama_jurusan != $request->nama_jurusan) {
            $sql_check = Jurusan::select("jurusan_id")->where('nama_jurusan', $request->nama_jurusan)->first();
            if ($sql_check) {
                return redirect()->back()->with("duplicateJurusan", "duplicateJurusan")->withInput();
            }
            $dataUpdate['nama_jurusan'] = $request->nama_jurusan;
        }

        if ($sql_jurusan->status != $request->status) {
            $dataUpdate['status'] = $request->status;
        }


        DB::table("jurusan")
            ->where('jurusan_id', $request->input("jurusan_id"))
            ->update($dataUpdate);

        return redirect()->back()->with("successUpdate", "successUpdate");
    }

    public function importJurusan(Request $request)
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
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $file = $request->file("excel_file");

        $jurusan = new JurusanImport;
        $jurusan->import($file);

        return redirect("/jurusan")->with("successImport", "Data jurusan berhasil di import");
    }
}
