<?php

namespace App\Http\Controllers;

use App\Imports\KelasImport;
use App\Imports\KelasMapelImport;
use App\Models\GuruMapel;
use App\Models\Kelas;
use App\Models\KelasMapel;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\TahunAjaran;
use Illuminate\Support\Facades\Validator;

class KelasController extends Controller
{
    protected $statuses = [
        '1' => "Aktif",
        '0' => "Nonaktif",
    ];

    protected $tingkatans = [
        '1' => "X",
        '2' => "XI",
        '3' => "XII"
    ];

    public function index(Request $request)
    {
        if ($request->ajax()) {
            $columnsSearch = ['k.nama_kelas', 'j.nama_jurusan', 'kelas_id'];
            $table = DB::table("kelas as k");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            $query = $table->select('k.*', 'j.nama_jurusan')
                ->join('jurusan as j', 'k.jurusan_id', '=', 'j.jurusan_id')
                ->where('j.status', 1);

            if ($request->status != null) {
                $query->where('k.status', $request->status);
            }

            $count = $query->count();

            $result = $query->offset($request->start)
                ->limit($request->length)
                ->orderByRaw("k.created_at ASC")
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
                    ' . $row->kelas_id . '
                    </div>
                    ';

                    $subData['kelas'] = $row->nama_jurusan . " | " . $row->nama_kelas;

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
                        <a href="kelas/edit/' . $row->kelas_id . '" class="setting-edit">
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

        $sql_kelas = DB::table("kelas as k")
            ->select('k.*', 'j.nama_jurusan')
            ->join('jurusan as j', 'j.jurusan_id', '=', 'k.jurusan_id')
            ->get();

        $dataToView = [
            "kelases" => $sql_kelas,
        ];

        return view("pages.kelas.index", $dataToView);
    }

    public function add()
    {
        $sql_jurusan = DB::table("jurusan")
            ->where('status', 1)
            ->get();

        $dataToView = [
            'jurusans' => $sql_jurusan,
        ];

        return view("pages.kelas.add", $dataToView);
    }

    public function store(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'nama_kelas' => "required|unique:kelas,nama_kelas",
                'jurusan_id' => 'required',
            ],
            [
                'nama_kelas.required' => "Nama Kelas Wajib di isi",
                'nama_kelas.unique' => "Nama Kelas sudah di gunakan",
                'jurusan_id.required' => "Jurusan ID Wajib di isi",
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        Kelas::create([
            'nama_kelas' => strtoupper($request->nama_kelas),
            'jurusan_id' => $request->jurusan_id,
            'created_by' => auth()->guard("admin")->user()->user_id
        ]);

        return redirect()->back()->with("successStore", "successStore");
    }

    public function edit(Request $request, $kelas_id)
    {
        if (!isset($kelas_id)) {
            return redirect()->back();
        }

        $sql_kelas = DB::table("kelas as k")
            ->select('k.*', 'j.nama_jurusan',)
            ->join('jurusan as j', 'j.jurusan_id', '=', 'k.jurusan_id')
            ->where('k.kelas_id', $kelas_id)
            ->where('j.status', 1)
            ->first();

        if (empty($sql_kelas)) {
            return redirect()->back();
        }

        $sql_jurusan = DB::table("jurusan")
            ->where('status', 1)
            ->get();

        $dataToView = [
            'kelas' => $sql_kelas,
            'jurusans' => $sql_jurusan,
            'statuses' => $this->statuses,
        ];

        return view("pages.kelas.edit", $dataToView);
    }

    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'kelas_id' => "required",
            'nama_kelas' => "required",
            'jurusan_id' => "required",
            'status' => "required",
        ], [
            'nama_kelas.required' => "Nama Kelas wajib di isi",
            'jurusan_id.required' => "Nama Jurusan wajib di isi",
            'status.required' => "Stataus wajib di isi",
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        $dataUpdate = [];

        $sql_kelas = Kelas::where("kelas_id", $request->kelas_id)->first();

        if ($sql_kelas->nama_kelas != $request->nama_kelas) {
            $sql_check = Kelas::select("kelas_id")->where("nama_kelas", $request->nama_kelas)->first();
            if ($sql_check) {
                return redirect()->back()->with("duplicateKelas", "duplicateKelas")->withInput();
            }
            $dataUpdate['nama_kelas'] = $request->nama_kelas;
        }

        if ($sql_kelas->jurusan_id != $request->jurusan_id) {
            $dataUpdate['jurusan_id'] = $request->jurusan_id;
        }

        if ($sql_kelas->status != $request->status) {
            $dataUpdate['status'] = $request->status;
        }

        if (!empty($dataUpdate)) {
            $dataUpdate['updated_by'] = auth()->guard("admin")->user()->user_id;
            DB::table("kelas")
                ->where('kelas_id', $request->kelas_id)
                ->update($dataUpdate);
        }

        return redirect()->back()->with('successUpdate', 'successUpdate');
    }

    public function kelasMapel(Request $request)
    {
        if ($request->ajax()) {
            $tahun = TahunAjaran::select("tahun_ajaran_id")->where('superadmin_aktif', 1)->first();

            $columnsSearch = ['k.nama_kelas', 'j.nama_jurusan'];
            $table = DB::table("kelas_mapel as km");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            $query = $table->select('km.*', 'k.nama_kelas', 'j.nama_jurusan')
                ->join('jurusan as j', 'j.jurusan_id', '=', 'km.jurusan_id')
                ->join('kelas as k', 'k.kelas_id', '=', 'km.kelas_id')
                ->where('k.status', 1)
                ->where('j.status', 1)
                ->where('km.tahun_ajaran_id', $tahun->tahun_ajaran_id);

            if ($request->tingkatan != null) {
                $query->where("km.tingkatan", $request->tingkatan);
            }

            if ($request->kelas_id != null) {
                // [0] => jurusan_id
                // [1] => kelas_id
                $arr = explode("|", $request->kelas_id);
                $query->where("km.jurusan_id", $arr[0])
                    ->where('km.kelas_id', $arr[1]);
            }

            $count = count($query->groupBy("km.tingkatan", "km.kelas_id")->get());

            $result = $query->groupBy('km.tingkatan', 'km.kelas_id')
                ->offset($request->start)
                ->limit($request->length)
                ->orderBy("km.tingkatan")
                ->get();

            $data = [];
            if (!empty($result)) {
                $i = $request->start;
                foreach ($result as $row) {
                    $i++;
                    $subData = [];
                    $subData['no'] = $i;

                    if ($row->tingkatan == 1) {
                        $tingkatan = "X";
                    }
                    if ($row->tingkatan == 2) {
                        $tingkatan = "XI";
                    }
                    if ($row->tingkatan == 3) {
                        $tingkatan = "XII";
                    }

                    $subData['tingkatan'] = '
                    <div class="text-center">
                        ' . $tingkatan . '
                    </div>
                    ';

                    $subData['kelas'] = $row->nama_jurusan . " | " . $row->nama_kelas;

                    $subData['settings'] = '
                    <div class="d-flex">
                    <div class="setting-icons">
                            <a href="/kelas-mapel/show/' . $row->tingkatan . '/' . $row->jurusan_id . '/' . $row->kelas_id . '"
                                class="setting-detail ">
                                <i class="ri-eye-line"></i>
                            </a>
                            <a href="/kelas-mapel/edit/' . $row->tingkatan . '/' . $row->jurusan_id . '/' . $row->kelas_id . '"
                                class="setting-edit">
                                <i class="ri-pencil-line"></i>
                            </a>
                        </div>
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

        $sql_kelas = DB::table("kelas as k")
            ->join('jurusan as j', 'j.jurusan_id', '=', 'k.jurusan_id')
            ->where('j.status', 1)
            ->where('k.status', 1)
            ->get();

        $dataToView = [
            'tingkatans' => $this->tingkatans,
            'kelases' => $sql_kelas,
        ];

        return view("pages.kelas.kelasMapel.index", $dataToView);
    }

    public function kelasMapel_add()
    {
        $sql_guruMapel = DB::table("guru_mapel as gm")
            ->select("gm.guru_mapel_id", 'gm.guru_id', 'gm.kode_guru_mapel', 'g.kode_guru')
            ->join('guru as g', 'g.guru_id', '=', 'gm.guru_id')
            ->where("gm.status", 1)
            ->get();

        // $sql_kelas = Kelas::with([
        //     'jurusan' => function ($query) {
        //         $query->select("jurusan_id", 'nama_jurusan')
        //             ->where("status", 1);
        //     }
        // ])
        //     ->where("status", 1)
        //     ->get();

        $sql_kelas = DB::table("kelas as k")
            ->join('jurusan as j', 'j.jurusan_id', '=', 'k.jurusan_id')
            ->where('j.status', 1)
            ->where('k.status', 1)
            ->get();

        $dataToView = [
            'kelases' => $sql_kelas,
            'tingkatans' => $this->tingkatans,
            'guruMapels' => $sql_guruMapel
        ];

        return view("pages.kelas.kelasMapel.add", $dataToView);
    }

    public function getDataKelasByJurusan(Request $request)
    {
        $jurusan_id = $request->jurusan_id;

        $sql_kelas = DB::table("kelas")
            ->select('kelas_id', 'nama_kelas')
            ->where('jurusan_id', $jurusan_id)
            ->where('status', 1)
            ->get();

        $dataResponse = [
            'kelases' => $sql_kelas,
            'status' => true,
        ];

        return response()->json($dataResponse);
    }

    public function kelasMapel_store(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'tingkatan' => "required",
                'kelas' => "required",
                'kode_guru_mapel.*' => "required",
            ],
            [
                "tingkatan.required" => "Tingkatan wajib di isi",
                'kelas.required' => "Kelas wajib di isi",
                'kode_guru_mapel.*.required' => "Kode Guru Mapel wajib di isi"
            ]
        );

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => "validation failed",
                'data' => $validator->errors(),
            ]);
        }

        $tahun_ajaran = TahunAjaran::select('tahun_ajaran_id')->where("superadmin_aktif", 1)->first();

        // [0] => jurusan_id
        // [1] => kelas_id
        $arrKelas = explode("|", $request->kelas);

        // select data guru_mapel di table kelas_mapel
        $sql_guruMapelId = DB::table('kelas_mapel')
            ->select("guru_mapel_id")
            ->where("tingkatan", $request->tingkatan)
            ->where("jurusan_id", $arrKelas[0])
            ->where("kelas_id", $arrKelas[1])
            ->where("tahun_ajaran_id", $tahun_ajaran->tahun_ajaran_id)
            ->pluck("guru_mapel_id")->toArray();

        // guru_mapel_id yg tidak ada di dalam table kelas_mapel
        $filtered_kode_guru_mapel = array_diff(array_unique($request->kode_guru_mapel), $sql_guruMapelId);
        $filtered_kode_guru_mapel = array_values($filtered_kode_guru_mapel);

        DB::beginTransaction();

        if (!empty($filtered_kode_guru_mapel)) {
            for ($i = 0; $i < count($filtered_kode_guru_mapel); $i++) {
                DB::table("kelas_mapel")
                    ->insert([
                        'tingkatan' => $request->tingkatan,
                        'jurusan_id' => $arrKelas[0],
                        'kelas_id' => $arrKelas[1],
                        'guru_mapel_id' => $filtered_kode_guru_mapel[$i],
                        'tahun_ajaran_id' => $tahun_ajaran->tahun_ajaran_id,
                        'status' => 1,
                        'created_at' => Carbon::now(),
                        'updated_at' => Carbon::now(),
                        'created_by' => auth()->guard("admin")->user()->user_id
                    ]);
            }
        }

        DB::commit();

        $dataResponse = [
            'status' => true,
            'message' => "success",
            'success_message' => "Data Kelas Mapel berhasil di tambahkan"
        ];

        return response()->json($dataResponse);
    }

    public function kelasMapel_show($tingkatan, $jurusan_id, $kelas_id)
    {
        if (!isset($tingkatan) || !isset($jurusan_id) || !isset($kelas_id)) {
            return redirect()->back();
        }

        $tahun_ajaran = DB::table("tahun_ajaran")
            ->select('tahun_ajaran_id')
            ->where('superadmin_aktif', 1)
            ->first();

        $sql_detail = DB::table("kelas_mapel as km")
            ->select('j.nama_jurusan', 'k.nama_kelas', 'km.tingkatan')
            ->join("jurusan as j", 'j.jurusan_id', '=', 'km.jurusan_id')
            ->join('kelas as k', 'k.kelas_id', '=', 'km.kelas_id')
            ->where('km.tingkatan', $tingkatan)
            ->where('km.jurusan_id', $jurusan_id)
            ->where('km.kelas_id', $kelas_id)
            ->where('km.tahun_ajaran_id', $tahun_ajaran->tahun_ajaran_id)
            ->first();

        if (empty($sql_detail)) {
            return redirect()->back();
        }

        $sql_mapels = DB::table("kelas_mapel as km")
            ->select('m.nama_mapel', 'g.nama', 'g.kode_guru', 'gm.kode_guru_mapel', 'km.status')
            ->join('guru_mapel as gm', 'gm.guru_mapel_id', '=', 'km.guru_mapel_id')
            ->join('guru as g', 'g.guru_id', '=', 'gm.guru_id')
            ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
            ->where("km.tingkatan", $tingkatan)
            ->where("km.jurusan_id", $jurusan_id)
            ->where("km.kelas_id", $kelas_id)
            ->where("km.tahun_ajaran_id", $tahun_ajaran->tahun_ajaran_id)
            ->where('m.status', 1)
            ->where('g.status', 1)
            ->orderByRaw("g.kode_guru ASC")
            ->get();

        $dataToView = [
            'detail' => $sql_detail,
            'mapels' => $sql_mapels,
        ];

        return view("pages.kelas.kelasMapel.show", $dataToView);
    }

    public function kelasMapel_edit($tingkatan, $jurusan_id, $kelas_id)
    {
        if (!isset($tingkatan) || !isset($jurusan_id) || !isset($kelas_id)) {
            return redirect()->back();
        }

        $tahun = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

        $sql_detail = DB::table("kelas_mapel as km")
            ->select('j.nama_jurusan', 'k.nama_kelas', 'km.tingkatan')
            ->join("jurusan as j", 'j.jurusan_id', '=', 'km.jurusan_id')
            ->join('kelas as k', 'k.kelas_id', '=', 'km.kelas_id')
            ->where('km.tingkatan', $tingkatan)
            ->where('km.jurusan_id', $jurusan_id)
            ->where('km.kelas_id', $kelas_id)
            ->where('km.tahun_ajaran_id', $tahun->tahun_ajaran_id)
            ->first();

        if (empty($sql_detail)) {
            return redirect()->back();
        }

        $sql_kelasMapels = DB::table("kelas_mapel as km")
            ->select("km.*", 'g.nama', 'm.nama_mapel')
            ->join("guru_mapel as gm", 'gm.guru_mapel_id', '=', 'km.guru_mapel_id')
            ->join('guru as g', 'g.guru_id', '=', 'gm.guru_id')
            ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
            ->where('km.tingkatan', $tingkatan)
            ->where("km.jurusan_id", $jurusan_id)
            ->where("km.kelas_id", $kelas_id)
            ->where("km.tahun_ajaran_id", $tahun->tahun_ajaran_id)
            ->where('m.status', 1)
            ->where("g.status", 1)
            ->get();

        $sql_guruMapel = DB::table('guru_mapel as gm')
            ->select("gm.guru_mapel_id", 'gm.kode_guru_mapel', 'gm.status', 'g.kode_guru')
            ->join('guru as g', 'g.guru_id', '=', 'gm.guru_id')
            ->where('g.status', 1)
            ->where('gm.status', 1)
            ->get();

        $dataToView = [
            'detail' => $sql_detail,
            'kelas_mapels' => $sql_kelasMapels,
            'guru_mapels' => $sql_guruMapel,
            'statuses' => $this->statuses,
            'tingkatan' => $tingkatan,
            'jurusan_id' => $jurusan_id,
            'kelas_id' => $kelas_id,
        ];

        return view("pages.kelas.kelasMapel.edit", $dataToView);
    }

    public function kelasMapel_getDataGuruByMapel(Request $request)
    {
        $mapel_id = $request->mapel_id;

        //select guru mapel
        $sql_guru = DB::table("guru_mapel as gm")
            ->select('u.user_id', 'u.nama')
            ->join('users as u', 'u.user_id', '=', 'gm.user_id')
            ->where('gm.mapel_id', $mapel_id)
            ->where('gm.status', 1)
            ->get();

        $dataResponse = [
            'gurus' => $sql_guru,
        ];

        return response()->json($dataResponse);
    }

    public function kelasMapel_update(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'hidden_guru_mapel_id' => "required",
                'hidden_status' => "required",
                'hidden_kelas_mapel_id' => "required",
                'kode_guru_mapel.*' => "required",
                'status.*' => "required",
            ],
            [
                'kode_guru_mapel.*.required' => "Kode Guru Mapel wajib di isi",
                'status.*.required' => "Status wajib di isi",
            ]
        );


        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        $kode_guru_mapel = $request->kode_guru_mapel;

        // cek apakah ada kode guru mapel yang sama 
        $duplicate = count($kode_guru_mapel) != count(array_unique($kode_guru_mapel));

        if ($duplicate) {
            return redirect()->back()->withInput()->with("duplicateKodeGuruMapel", "Kode Guru Mapel sudah ada di kelas yg di pilih");
        }

        $hidden_kelas_mapel_id = $request->hidden_kelas_mapel_id;
        $hidden_guru_mapel_id = $request->hidden_guru_mapel_id;
        $hidden_status = $request->hidden_status;
        $kode_guru_mapel = $request->kode_guru_mapel; // valuenya guru_mapel_id
        $status = $request->status;

        DB::beginTransaction();

        for ($i = 0; $i < count($kode_guru_mapel); $i++) {
            $dataUpdate = [];

            if ($hidden_guru_mapel_id[$i] != $kode_guru_mapel[$i]) {
                $dataUpdate['guru_mapel_id'] = $kode_guru_mapel[$i];
            }

            if ($hidden_status[$i] != $status[$i]) {
                $dataUpdate['status'] = $status[$i];
            }

            if (!empty($dataUpdate)) {
                $dataUpdate['updated_by'] = auth()->guard("admin")->user()->user_id;
                DB::table('kelas_mapel')
                    ->where("kelas_mapel_id", $hidden_kelas_mapel_id[$i])
                    ->update($dataUpdate);
            }
        }

        DB::commit();

        return redirect()->back()->withInput()->with("successUpdate", "Data Kelas Mapel berhasil di update");
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
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $fileName = $request->file("excel_file");
        $kelasImport = new KelasImport;
        $kelasImport->import($fileName);

        return redirect()->back()->with("success_import", "Data Kelas berhasil di import");
    }

    public function kelasMapel_import(Request $request)
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
        $kelasMapelImport = new KelasMapelImport;
        $kelasMapelImport->import($file);

        return redirect()->back()->with("success_import", "Data Kelas Mapel berhasil di import");
    }
}
