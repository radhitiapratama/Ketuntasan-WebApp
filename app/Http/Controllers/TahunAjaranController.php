<?php

namespace App\Http\Controllers;

use App\Models\TahunAjaran;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Gate;

class TahunAjaranController extends Controller
{
    protected $statuses = [
        '1' => "Aktif",
        '0' => "Nonaktif",
    ];

    public function index(Request $request)
    {
        if ($request->ajax()) {
            $columnsSearch = ['tahun_ajaran'];
            $table = DB::table("tahun_ajaran");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            $count = $table->count();

            $result = $table->offset($request->start)
                ->limit($request->length)
                ->orderByRaw("tahun_ajaran_id DESC")
                ->get();

            $data = [];
            if (!empty($result)) {
                $i = $request->start;
                foreach ($result as $row) {
                    $i++;
                    $subData = [];
                    $subData['no'] = $i;
                    $subData['tahun_ajaran'] = $row->tahun_ajaran;
                    $subData['user'] = '
                    <div class="text-center">
                        <span class="badge badge-danger p-2">Nonaktif</span>
                    </div>
                    ';

                    $subData['superadmin'] = '
                    <div class="text-center">
                        <span class="badge badge-danger p-2">Nonaktif</span>
                    </div>
                    ';



                    if ($row->user_aktif == 1) {
                        $subData['user'] = '
                        <div class="text-center">
                            <span class="badge badge-success p-2">Aktif</span>
                        </div>
                        ';
                    }

                    if ($row->superadmin_aktif == 1) {
                        $subData['superadmin'] = '
                        <div class="text-center">
                            <span class="badge badge-success p-2">Aktif</span>
                        </div>
                        ';
                    }

                    $subData['settings'] = '
                    <div class="setting-icons">
                        <a href="' . url("tahun-ajaran/edit/$row->tahun_ajaran_id") . '"
                            class="setting-edit m-auto">
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

        return view('pages.tahunAjaran.index');
    }

    public function add()
    {
        return view("pages.tahunAjaran.add");
    }

    public function store(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'tahun_start' => "required",
                'tahun_end' => 'required',
            ],
            [
                'required' => ":attribute wajib di isi"
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        $tahun_ajaran = $request->tahun_start . "-" . $request->tahun_end;

        DB::table("tahun_ajaran")
            ->insert([
                'tahun_ajaran' => $tahun_ajaran,
                'created_at' => Carbon::now(),
            ]);

        return redirect()->back()->with("successStore", "successStore");
    }

    public function edit($tahun_ajaran_id)
    {
        if (!isset($tahun_ajaran_id)) {
            return redirect()->back();
        }

        $sql_tahunAjaran = DB::table('tahun_ajaran')
            ->where('tahun_ajaran_id', $tahun_ajaran_id)
            ->first();

        if (empty($sql_tahunAjaran)) {
            return redirect()->back();
        }

        $parser = explode("-", $sql_tahunAjaran->tahun_ajaran);
        $tahun_start = $parser[0];
        $tahun_end =  $parser[1];

        $dataToView = [
            'tahun_start' => $tahun_start,
            'tahun_end' => $tahun_end,
            'tahun_ajaran' => $sql_tahunAjaran,
            'statuses' => $this->statuses
        ];

        return view("pages.tahunAjaran.edit", $dataToView);
    }

    public function update(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'tahun_ajaran_id' => "required",
                'tahun_start' => "required",
                'tahun_end' => "required",
                'user_status' => "required",
                'superadmin_status' => "required",
            ],
            [
                'required' => ":attribute wajib di isi"
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        $sql_tahunAjaran = TahunAjaran::where("tahun_ajaran_id", $request->tahun_ajaran_id)->first();

        $dataUpdate = [];
        $dataUpdate['tahun_ajaran'] = $request->tahun_start . "-" . $request->tahun_end;
        $dataUpdate['updated_at'] = Carbon::now();

        if ($sql_tahunAjaran->user_aktif != $request->user_status) {
            if ($request->user_status == 1) {
                DB::table("tahun_ajaran")->update(['user_aktif' => 0]);
                $dataUpdate['user_aktif'] = $request->user_status;
            } else {
                return redirect()->back()->with("min1Aktif", "min1Aktif");
            }
        }

        if ($sql_tahunAjaran->superadmin_aktif != $request->superadmin_status) {
            if ($request->superadmin_status == 1) {
                DB::table("tahun_ajaran")->update(['superadmin_aktif' => 0]);
                $dataUpdate['superadmin_aktif'] = $request->superadmin_status;
            } else {
                return redirect()->back()->with("min1Aktif", "min1Aktif");
            }
        }

        DB::table('tahun_ajaran')
            ->where('tahun_ajaran_id', $request->tahun_ajaran_id)
            ->update($dataUpdate);

        return redirect()->back()->with("successUpdate", "successUpdate");
    }
}
