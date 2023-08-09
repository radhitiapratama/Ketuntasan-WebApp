<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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
        $request->validate([
            'tahun_start' => "required",
            'tahun_end' => 'required',
        ]);

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
        $validated = $request->validate([
            'tahun_ajaran_id' => "required",
            'tahun_start' => "required",
            'tahun_end' => "required",
            'user_status' => "required",
            'superadmin_status' => "required",
        ]);

        $tahun_ajaran = $request->tahun_start . "-" . $request->tahun_end;

        // jika user_aktif == 1 update semua user_aktif di database menjadi 0 dulu
        if ($request->user_status == 1) {
            DB::table('tahun_ajaran')
                ->update([
                    'user_aktif' => 0,
                ]);
        }

        // jika super_admin == 1 update semua superadmin_aktif di database menjadi 0 dulu
        if ($request->superadmin_status == 1) {
            DB::table('tahun_ajaran')
                ->update([
                    'superadmin_aktif' => 0,
                ]);
        }

        if ($request->superadmin_status == 0) {
            return redirect()->back()->with("min1Aktif", "min1Aktif");
        }

        // jika user & superadmin di updat menjadi 1 update semua di db menjadi 0
        if ($request->user_status == 1 && $request->superadmin_status == 1) {
            DB::table('tahun_ajaran')
                ->update([
                    'user_aktif' => 0,
                    'superadmin_aktif' => 0,
                ]);
        }

        DB::table('tahun_ajaran')
            ->where('tahun_ajaran_id', $request->tahun_ajaran_id)
            ->update([
                'tahun_ajaran' => $tahun_ajaran,
                'user_aktif' => $request->user_status,
                'superadmin_aktif' => $request->superadmin_status,
                'updated_at' => Carbon::now(),
            ]);

        return redirect()->back()->with("successUpdate", "successUpdate");
    }
}
