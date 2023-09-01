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
use Illuminate\Testing\Constraints\CountInDatabase;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx\Rels;

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
                ->orderByRaw("k.created_at DESC")
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

    public function edit($kelas_id)
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

        $sql_jurusan = DB::table("jurusan")
            ->where('status', 1)
            ->get();

        if (empty($sql_kelas)) {
            return redirect()->back();
        }

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

        $sql_kelas = Kelas::with([
            'jurusan' => function ($query) {
                $query->select("jurusan_id", 'nama_jurusan')
                    ->where("status", 1);
            }
        ])
            ->where("status", 1)
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

        $sql_kelas = Kelas::with([
            'jurusan' => function ($query) {
                $query->select("jurusan_id", 'nama_jurusan')
                    ->where("status", 1);
            }
        ])
            ->where("status", 1)
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
                'kode_guru_mapel' => "required",
            ],
            [
                "tingkatan.required" => "Tingkatan wajib di isi",
                'kelas.required' => "Kelas wajib di isi",
                'kode_guru_mapel.required' => "Kode Guru Mapel wajib di isi"
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        $tahun_ajaran = TahunAjaran::select('tahun_ajaran_id')->where("superadmin_aktif", 1)->first();

        // [0] => jurusan_id
        // [1] => kelas_id
        $arrKelas = explode("|", $request->kelas);

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

        return redirect()->back()->with("successStore", "successStore");
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

        // $sql_mapels = DB::table("kelas_mapel as km")
        //     ->select('m.nama_mapel', 'u.nama', 'km.status')
        //     ->join("jurusan as j", 'j.jurusan_id', '=', 'km.jurusan_id')
        //     ->join('kelas as k', 'k.kelas_id', '=', 'km.kelas_id')
        //     ->join('mapel as m', 'm.mapel_id', '=', 'km.mapel_id')
        //     ->join('users as u', 'u.user_id', '=', 'km.user_id')
        //     ->where('km.tingkatan', $tingkatan)
        //     ->where('km.jurusan_id', $jurusan_id)
        //     ->where('km.kelas_id', $kelas_id)
        //     ->where('km.tahun_ajaran_id', $tahun_ajaran->tahun_ajaran_id)
        //     ->get();

        $sql_mapels = DB::table("kelas_mapel as km")
            ->select('m.nama_mapel', 'g.nama', 'g.kode_guru', 'gm.kode_guru_mapel', 'km.status')
            ->join('guru_mapel as gm', 'gm.guru_mapel_id', '=', 'km.guru_mapel_id')
            ->join('guru as g', 'g.guru_id', '=', 'gm.guru_id')
            ->join('mapel as m', 'm.mapel_id', '=', 'gm.mapel_id')
            ->where("km.tingkatan", $tingkatan)
            ->where("km.jurusan_id", $jurusan_id)
            ->where("km.kelas_id", $kelas_id)
            ->where("km.tahun_ajaran_id", $tahun_ajaran->tahun_ajaran_id)
            ->get();

        $dataToView = [
            'detail' => $sql_detail,
            'mapels' => $sql_mapels,
        ];

        return view("pages.kelas.kelasMapel.show", $dataToView);
    }

    public function kelasMapel_edit($tingkatan_id, $jurusan_id, $kelas_id)
    {
        if (!isset($tingkatan_id) || !isset($jurusan_id) || !isset($kelas_id)) {
            return redirect()->back();
        }

        $tahun = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

        $sql_detail = DB::table("kelas_mapel as km")
            ->select('j.nama_jurusan', 'k.nama_kelas', 'km.tingkatan')
            ->join("jurusan as j", 'j.jurusan_id', '=', 'km.jurusan_id')
            ->join('kelas as k', 'k.kelas_id', '=', 'km.kelas_id')
            ->where('km.tingkatan', $tingkatan_id)
            ->where('km.jurusan_id', $jurusan_id)
            ->where('km.kelas_id', $kelas_id)
            ->where('km.tahun_ajaran_id', $tahun->tahun_ajaran_id)
            ->first();

        if (empty($sql_detail)) {
            return redirect()->back();
        }

        $sql_kelasMapels = KelasMapel::from("kelas_mapel as km")
            ->select(
                "km.kelas_mapel_id",
                'km.mapel_id',
                'km.user_id',
                'km.status'
            )
            ->where("km.tingkatan", $tingkatan_id)
            ->where("km.jurusan_id", $jurusan_id)
            ->where("km.kelas_id", $kelas_id)
            ->where("km.tahun_ajaran_id", $tahun->tahun_ajaran_id)
            ->with(['guru_mapel_user' => function ($query) {
                $query->select("users.*")->where("guru_mapel.status", 1);
            }])
            ->join("mapel as m", 'm.mapel_id', '=', 'km.mapel_id')
            ->get();


        $sql_mapels = DB::table("mapel")
            ->select('mapel_id', 'nama_mapel')
            ->where('status', 1)
            ->get();

        $dataToView = [
            'detail' => $sql_detail,
            'kelas_mapels' => $sql_kelasMapels,
            'statuses' => $this->statuses,
            'mapels' => $sql_mapels,
            'tingkatan_id' => $tingkatan_id,
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
        $validated = $request->validate([
            'kelas_mapel_id' => "required",
            'mapel_id' => "required",
            'guru_id' => "required",
            'status' => "required"
        ]);

        // array
        $kelas_mapel_id = $request->kelas_mapel_id;
        $mapel_id = $request->mapel_id;
        $guru_id  = $request->guru_id;
        $status = $request->status;

        $tahun_ajaran = TahunAjaran::select("tahun_ajaran_id")->where("superadmin_aktif", 1)->first();

        for ($i = 0; $i < count($mapel_id); $i++) {
            // check apaka ada kelas_mapel_id 
            $sql_checkMapelId = DB::table("kelas_mapel")
                ->select('user_id', 'mapel_id', 'status')
                ->where('kelas_mapel_id', $kelas_mapel_id[$i])
                ->first();

            if ($mapel_id[$i] != $sql_checkMapelId->mapel_id || $guru_id[$i] != $sql_checkMapelId->user_id) {
                //check apakah data yg berubah itu ada yg sama dengan mapel_id dan guru_id di database
                $sql_checkMapelAndUser = DB::table("kelas_mapel")
                    ->where('mapel_id', $mapel_id[$i])
                    ->where('user_id', $guru_id[$i])
                    ->where('tahun_ajaran_id', $tahun_ajaran->tahun_ajaran_id)
                    ->where('tingkatan', $request->tingkatan_id)
                    ->where('jurusan_id', $request->jurusan_id)
                    ->where('kelas_id', $request->kelas_id)
                    ->first();

                if ($sql_checkMapelAndUser) {
                    return redirect()->back()->with('duplicate', 'duplicate');
                }

                DB::table("kelas_mapel")
                    ->where('kelas_mapel_id', $kelas_mapel_id[$i])
                    ->update([
                        'mapel_id' => $mapel_id[$i],
                        'user_id' => $guru_id[$i],
                    ]);
            }

            if ($status[$i] != $sql_checkMapelId->status) {
                DB::table('kelas_mapel')
                    ->where('kelas_mapel_id', $kelas_mapel_id[$i])
                    ->update([
                        'status' => $status[$i]
                    ]);
            }
        }

        return redirect()->back()->with("successUpdate", "successUpdate");
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
