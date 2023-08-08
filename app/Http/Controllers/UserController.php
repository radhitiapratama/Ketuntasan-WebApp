<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    protected $statuses = [
        '1' => "Aktif",
        '0' => "Nonaktif",
    ];

    public function superadmin(Request $request)
    {
        if ($request->ajax()) {
            $columnsSearch = ['username', 'nama'];
            $table = DB::table("users");

            if ($request->input("search.value")) {
                $table->where(function ($q) use ($columnsSearch, $request) {
                    foreach ($columnsSearch as $column) {
                        $q->orWhere($column, 'like', '%' . $request->input("search.value") . "%");
                    }
                });
            }

            $query = $table->select('user_id', 'username', 'nama', 'status')
                ->where("role", 1);

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

        $superadmin = User::select('user_id', "username", 'nama', 'status')->where("role", 1)->get();


        $dataToView = [
            'superadmins' => $superadmin,
        ];

        return view("pages.user.superadmin.index", $dataToView);
    }

    public function superadmin_add()
    {
        return view("pages.user.superadmin.add");
    }

    public function superadmin_store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username' => "required|unique:users,username",
            'nama' => "required",
            'password' => "required|min:6",
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        User::create([
            'username' => $request->username,
            'nama' => $request->nama,
            'password' => Hash::make($request->password),
            'role' => 1,
        ]);

        return redirect()->back()->with("successStore", "successStore");
    }

    public function superadmin_edit($user_id)
    {
        if (!isset($user_id)) {
            return redirect('superadmin');
        }

        $dataUser = User::select("user_id", 'username', 'nama', 'status', 'role')->where("user_id", $user_id)->first();

        if (empty($dataUser) || $dataUser->role != 1) {
            return redirect("superadmin");
        }

        $dataToView  = [
            'user' => $dataUser,
            'statuses' => $this->statuses,
        ];

        return view('pages.user.superadmin.edit', $dataToView);
    }

    public function superadmin_update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username' => "required",
            'nama' => "required",
            'status' => "required",
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $user = User::select("user_id", 'username', 'nama', 'status')->where('user_id', $request->user_id)->first();

        $dataUpdate = [];

        if ($request->username != $user->username) {
            $check = User::select("username")->where("username", $request->username)->first();
            if ($check) {
                return redirect()->back()->with("usernameDuplicate", "usernameDuplicate");
            }
            $dataUpdate['username'] = $request->username;
        }

        if ($request->nama != $user->nama) {
            $dataUpdate['nama'] = $request->nama;
        }

        $dataUpdate['status'] = $request->status;

        User::where("user_id", $request->user_id)
            ->update($dataUpdate);

        return redirect()->back()->with("successUpdate", "successUpdate");
    }
}
