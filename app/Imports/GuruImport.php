<?php

namespace App\Imports;

use App\Models\Admin;
use App\Models\Guru;
use App\Models\Operator;
use App\Models\Siswa;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Database\QueryException;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Concerns\WithCalculatedFormulas;
use PhpOffice\PhpSpreadsheet\Calculation\Engine\Operands\Operand;

// gunakan WithCalculatedFormulas untuk mendapatkan value dari formulla excel
class GuruImport implements ToCollection, WithStartRow, WithCalculatedFormulas
{
    use Importable;

    protected $username;
    protected $kode_guru;
    protected $username_guru_excel;
    protected $kode_guru_excel;

    public function __construct()
    {
        $query_admin = Admin::query();
        $query_guru = Guru::query();
        $query_siswa = Siswa::query();
        $query_operator = Operator::query();


        $this->username = collect(array_merge(
            $query_admin->select("user_id", 'username')->get()->toArray(),
            $query_guru->select("user_id", 'username')->get()->toArray(),
            $query_siswa->select("user_id", 'username')->get()->toArray(),
            $query_operator->select("user_id", 'username')->get()->toArray(),
        ));

        $this->kode_guru = collect($query_guru->select("user_id", 'kode_guru')->get()->toArray());
    }

    public function collection(Collection $rows)
    {
        $validator =  Validator::make(
            $rows->toArray(),
            [
                '*.0' => "required",
                '*.1' => "required",
                "*.2" => "required"
            ],
            [
                '*.0.required' => "Gagal ! Username guru wajib di isi",
                '*.1.required' => "Gagal ! Nama guru wajib di isi",
                "*.2.required" => "Gagal ! Kode Guru wajib di isi",
            ]
        );

        if ($validator->fails()) {
            return redirect()->back()->with("import_failed", "Gagal ! terjadi kesalahan pastikan data yg di import sesuai");
        }

        if (count($rows) > 200) {
            DB::rollBack();
            return redirect()->back()->with("max_count", "Gagal! Row yg di import tidak boleh lebih dari 200");
        }

        $sql_userID = User::orderBy("user_id", "DESC")->pluck("user_id")->first();
        $last_user_id = $sql_userID;

        $charsReplace = [
            '[', ']',
        ];


        $data_guru = [];
        $data_user = [];



        DB::beginTransaction();

        // $row[0] => username
        // $row[1] => nama
        // $row[2] => kode_guru
        $num = 1;
        foreach ($rows as $row) {
            $num++;
            $kode_guru = str_replace($charsReplace, "", $row[2]);

            $username_exist = $this->username->where("username", $row[0])->first();
            $kode_guru_exist = $this->kode_guru->where("kode_guru", $kode_guru)->first();
            $username_guru_excel_exist = collect($this->username_guru_excel)->where("username", $row[0])->first();
            $kode_guru_excel_exist = collect($this->kode_guru_excel)->where("kode_guru", $kode_guru)->first();

            $this->username_guru_excel[] = [
                'num' => $num,
                'username' => $row[0]
            ];
            $this->kode_guru_excel[] = [
                'num' => $num,
                'kode_guru' => $kode_guru
            ];


            if ($username_exist != null || $username_guru_excel_exist != null) {
                DB::rollBack();
                return redirect()->back()->with("username_not_unique", "Gagal ! Username " . $row[0] . " sudah di gunakan");
            }

            if ($kode_guru_exist != null || $kode_guru_excel_exist != null) {
                DB::rollBack();
                return redirect()->back()->with("duplicate_kodeGuru", "Gagal ! Kode guru " . $kode_guru . " sudah di gunakan");
            }

            $last_user_id++;

            $data_user[] = [
                'user_id' => $last_user_id,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
                'created_by' => Auth::guard("admin")->user()->user_id
            ];

            $data_guru[] = [
                'user_id' => $last_user_id,
                'username' => $row[0],
                'nama' => $row[1],
                'password' => Hash::make("123456"),
                'role' => 2,
                'kode_guru' => $kode_guru,
                'status' => 1,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
                'created_by' => Auth::guard("admin")->user()->user_id
            ];
        }

        try {
            User::insert($data_user);
            Guru::insert($data_guru);
            DB::commit();
            return redirect()->back()->with("successImport", "Data Guru berhasil di import!");
        } catch (QueryException $ex) {
            DB::rollBack();
            return redirect()->back()->with("import_failed", "Gagal mengimport data guru silahkan cek datanya lagi!");
        }
    }

    public function startRow(): int
    {
        return 3;
    }
}
