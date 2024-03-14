<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Models\Utils;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    protected $statuses = [
        '1' => "Aktif",
        '0' => "Nonaktif",
    ];

    public function index(Request $request)
    {
        if ($request->ajax()) {
            $columnsSearch = ['a.username', 'a.nama'];
            $table = DB::table("users as u");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            $query = $table->select('u.user_id', 'a.username', 'a.nama', 'a.status')
                ->join('admin as a', 'a.user_id', '=', 'u.user_id');

            $records = $query->count();

            $result = $query->offset($request->start)
                ->limit($request->length)
                ->get();

            $data = [];
            if (!empty($result)) {
                $i = $request->start;
                foreach ($result as $row) {
                    $i++;
                    $subData = [];
                    $subData['no'] = $i;
                    $subData['username'] = $row->username;
                    $subData['nama'] = $row->nama;
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
                        <a href="' . url("superadmin/edit/$row->user_id") . '" class="setting-edit">
                            <i class="ri-pencil-line"></i>
                        </a>
                    </div>
                    ';

                    $data[] = $subData;
                }
            }

            return response()->json([
                'draw' => $request->draw,
                'recordsFiltered' => $records,
                'recordsTotal' => $records,
                'data' => $data,
            ]);
        }
        return view("pages.user.superadmin.index");
    }

    public function add()
    {
        return view("pages.user.superadmin.add");
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username' => "required",
            'nama' => "required",
            'password' => "required|min:6",
        ], [

            'username.required' => "Username wajib di isi",
            'username.unique' => "Username sudah di gunakan",
            'username.password' => "Password minimal 6"
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        if (!Utils::validateUsername([
            'type' => "insert",
            'username' => $request->username
        ])) {
            return redirect()->back()->with("duplicate_username", "duplicate_username")->withInput();
        }

        $user = User::create([
            'created_by' => auth()->guard("admin")->user()->user_id,
        ]);

        $lastUserId = $user->user_id;

        Admin::create([
            'user_id' => $lastUserId,
            'username' => $request->username,
            'nama' => $request->nama,
            'password' => Hash::make($request->password),
            'role' => 1,
            'status' => 1,
            'created_by' => auth()->guard("admin")->user()->user_id,
        ]);

        return redirect()->back()->with("successStore", "successStore");
    }
}
