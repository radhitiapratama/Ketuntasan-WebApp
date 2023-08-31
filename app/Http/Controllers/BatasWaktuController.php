<?php

namespace App\Http\Controllers;

use App\Models\TahunAjaran;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class BatasWaktuController extends Controller
{
    protected $statuses = [
        '1' => "Aktif",
        '0' => "Nonaktif",
    ];

    public function index(Request $request)
    {
        if ($request->ajax()) {
            $tahun = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

            $columnsSearch = ['start_date', 'end_date'];
            $table = DB::table("batas_waktu");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            $count = $table->where('tahun_ajaran_id', $tahun->tahun_ajaran_id)->count();

            $result = $table->where('tahun_ajaran_id', $tahun->tahun_ajaran_id)
                ->offset($request->start)
                ->limit($request->length)
                ->orderByRaw("batas_waktu_id DESC")
                ->get();

            $data = [];
            if (!empty($result)) {
                $i = $request->start;
                foreach ($result as $row) {
                    $i++;
                    $subData = [];
                    $subData['no'] = $i;
                    $subData['batas_waktu'] = date("d-m-Y", strtotime($row->start_date)) . " - " . date("d-m-Y", strtotime($row->end_date));

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
                        <a href="' . url("batas-waktu/edit/$row->batas_waktu_id") . '"
                            class="setting-edit">
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
        return view("pages.batasWaktu.index");
    }

    public  function add()
    {
        return view("pages.batasWaktu.add");
    }

    public function store(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'tgl_mulai' => "required",
                'tgl_selesai' => "required",
            ],
            [
                'required' => ":attribute wajib di isi"
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        $tahun_ajaran = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();


        $tgl_mulai = date("Y-m-d", strtotime($request->tgl_mulai));
        $tgl_selesai = date("Y-m-d", strtotime($request->tgl_selesai));

        if ($tgl_selesai <  $tgl_mulai) {
            return redirect()->back()->withInput()->with("tglSelesaiLebihKecil", "tglSelesaiLebihKecil");
        }

        //update sebuat batas waktu status nya menjadi off
        DB::table("batas_waktu")
            ->where('tahun_ajaran_id', $tahun_ajaran->tahun_ajaran_id)
            ->update([
                'status' => 0,
            ]);

        DB::table("batas_waktu")
            ->insert([
                'start_date' => $tgl_mulai,
                'end_date' => $tgl_selesai,
                'tahun_ajaran_id' => $tahun_ajaran->tahun_ajaran_id,
                'status' => 1,
                'created_at' => Carbon::now(),
            ]);

        return redirect()->back()->with("successStore", "successStore");
    }

    public function edit($batasWaktu)
    {
        if (!isset($batasWaktu)) {
            return redirect()->back();
        }

        $tahun = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

        $sql_batasWaktu = DB::table("batas_waktu")
            ->where('batas_waktu_id', $batasWaktu)
            ->first();

        if (empty($sql_batasWaktu) || $sql_batasWaktu->tahun_ajaran_id != $tahun->tahun_ajaran_id) {
            return redirect()->back();
        }

        $dataToView = [
            'batasWaktu' => $sql_batasWaktu,
            'start_date' => date("d-m-Y", strtotime($sql_batasWaktu->start_date)),
            'end_date' => date("d-m-Y", strtotime($sql_batasWaktu->end_date)),
            'statuses' => $this->statuses,
        ];

        return view('pages.batasWaktu.edit', $dataToView);
    }


    public function update(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'batas_waktu_id' => "required",
                'tgl_mulai' => "required",
                'tgl_selesai' => "required",
                'status' => "required"
            ],
            [
                'required' => ":attribute wajib di isi"
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        $tahun = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

        $tgl_mulai = date("Y-m-d", strtotime($request->tgl_mulai));
        $tgl_selesai = date("Y-m-d", strtotime($request->tgl_selesai));

        if ($tgl_selesai <  $tgl_mulai) {
            return redirect()->back()->withInput()->with("tglSelesaiLebihKecil", "tglSelesaiLebihKecil");
        }

        if ($request->status == 0) {
            return redirect()->back();
        }

        if ($request->status == 1) {
            // Update semua batas waktu menjadi nonaktif di tahun ajaran yang sama
            DB::table("batas_waktu")
                ->where("tahun_ajaran_id", $tahun->tahun_ajaran_id)
                ->update([
                    'status' => 0,
                ]);

            DB::table("batas_waktu")
                ->where('batas_waktu_id', $request->batas_waktu_id)
                ->where('tahun_ajaran_id', $tahun->tahun_ajaran_id)
                ->update([
                    'start_date' => $tgl_mulai,
                    'end_date' => $tgl_selesai,
                    'status' => $request->status,
                ]);
        }

        return redirect()->back()->with("successUpdate", "successUpdate");
    }
}
