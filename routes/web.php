<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\BatasWaktuController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\GuruController;
use App\Http\Controllers\JurusanController;
use App\Http\Controllers\User;
use App\Http\Controllers\KelasController;
use App\Http\Controllers\KetuntasanController;
use App\Http\Controllers\MapelController;
use App\Http\Controllers\SiswaController;
use App\Http\Controllers\TahunAjaranController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

use Illuminate\Support\Facades\DB;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::middleware(['isGuest'])->group(function () {
    Route::get("/", [AuthController::class, 'index'])->name('login');
    // Login
    Route::post("/login", [AuthController::class, 'login']);
});


Route::middleware(['auth'])->group(function () {
    Route::middleware(['isAdmin'])->group(function () {
        // Superadmin
        Route::get("superadmin", [UserController::class, 'superadmin']);
        Route::get("superadmin/add", [UserController::class, 'superadmin_add']);
        Route::post("superadmin/store", [UserController::class, 'superadmin_store']);
        Route::get("superadmin/edit/{user_id}", [UserController::class, 'superadmin_edit']);
        Route::post("superadmin/update", [UserController::class, 'superadmin_update']);

        // Guru
        Route::get("/guru", [GuruController::class, 'index']);
        Route::get("/guru/add", [GuruController::class, 'add']);
        Route::get("/guru/edit/{guru_id}", [GuruController::class, 'edit']);
        Route::post("/guru/update", [GuruController::class, 'update']);
        Route::post("/guru/store", [GuruController::class, 'store']);
        Route::post("/guru/import", [GuruController::class, 'importGuru']);

        // Route::get("/guru/updateUsername", function () {
        //     $guru = DB::table("users")
        //         ->where('role', 2)
        //         ->get();

        //     foreach ($guru as $row) {
        //         $arr = explode(" ", $row->nama);
        //         if (count($arr) < 2) {
        //             $temp_name = str_replace([',', '.'], '', strtolower($arr[0])  . rand(0, 100) . rand(0, 100));
        //         } else {
        //             $temp_name = str_replace([',', '.'], '', strtolower($arr[0]) . strtolower($arr[1]) . rand(0, 100) . rand(0, 100));
        //         }

        //         echo $temp_name . "<br>";

        //         // DB::table("users")
        //         //     ->where('user_id', $row->user_id)
        //         //     ->update([
        //         //         'username' => $temp_name,
        //         //     ]);
        //     }

        //     // dd('selesai');
        // });

        // Guru Mapel   
        Route::get("/guru-mapel", [GuruController::class, 'guruMapel']);
        Route::get("/guru-mapel/add", [GuruController::class, 'guruMapel_add']);
        Route::post("/guru-mapel/store", [GuruController::class, 'guruMapel_store']);
        Route::get("/guru-mapel/edit/{guru_id}", [GuruController::class, 'guruMapel_edit']);
        Route::post("/guru-mapel/update", [GuruController::class, 'guruMapel_update']);
        Route::post("/guru-mapels", [GuruController::class, 'getDataMapelByGuru']);


        // Wali Kelas
        Route::get("/wali-kelas", [GuruController::class, 'waliKelas']);
        Route::get("/wali-kelas/add", [GuruController::class, 'waliKelas_add']);
        Route::post("/wali-kelas/store", [GuruController::class, 'waliKelas_store']);
        Route::get("wali-kelas/edit/{wali_kelas_id}", [GuruController::class, 'waliKelas_edit']);
        Route::post("wali-kelas/update", [GuruController::class, 'waliKelas_update']);

        // Mapel
        Route::get("/mapel", [MapelController::class, 'index']);
        Route::get("/mapel/add", [MapelController::class, 'add']);
        Route::get("/mapel/edit/{mapel_id}", [MapelController::class, 'edit']);
        Route::post("/mapel/store", [MapelController::class, 'store']);
        Route::post("/mapel/update", [MapelController::class, 'update']);
        Route::post("/mapel/importMapel", [MapelController::class, 'importMapel']);

        // Kelas
        Route::get("/kelas", [KelasController::class, 'index']);
        Route::get("/kelas/add", [KelasController::class, 'add']);
        Route::get("/kelas/edit/{kelas_id}", [KelasController::class, 'edit']);
        Route::post("/kelas/store", [KelasController::class, 'store']);
        Route::post("/kelas/update", [KelasController::class, 'update']);


        // Kelas mapel
        Route::get("/kelas-mapel", [KelasController::class, 'kelasMapel']);
        Route::get("/kelas-mapel/add", [KelasController::class, 'kelasMapel_add']);
        Route::post("/kelas-mapel/store", [KelasController::class, 'kelasMapel_store']);
        Route::get("/kelas-mapel/show/{tingkatan_id}/{jurusan_id}/{kelas_id}", [KelasController::class, 'kelasMapel_show']);
        Route::get("/kelas-mapel/edit/{tingkatan_id}/{jurusan_id}/{kelas_id}", [KelasController::class, 'kelasMapel_edit']);
        Route::post("/kelas-mapel/getDataGuruByMapel", [KelasController::class, 'kelasMapel_getDataGuruByMapel']);
        Route::post("/kelas-mapel/update", [KelasController::class, 'kelasMapel_update']);

        // Jurusan
        Route::get("/jurusan", [JurusanController::class, 'index']);
        Route::get("/jurusan/add", [JurusanController::class, 'add']);
        Route::post("/jurusan/store", [JurusanController::class, 'store']);
        Route::get("/jurusan/edit/{jurusan_id}", [JurusanController::class, 'edit']);
        Route::post("/jurusan/update", [JurusanController::class, 'update']);
        Route::post("/jurusan/import", [JurusanController::class, 'importJurusan']);

        // Tahun Ajaran
        Route::get("/tahun-ajaran", [TahunAjaranController::class, 'index'])->middleware('isAdmin');
        Route::get("/tahun-ajaran/add", [TahunAjaranController::class, 'add']);
        Route::post("/tahun-ajaran/store", [TahunAjaranController::class, 'store']);
        Route::get("/tahun-ajaran/edit/{tahun_ajaran_id}", [TahunAjaranController::class, 'edit']);
        Route::post('/tahun-ajaran/update', [TahunAjaranController::class, 'update']);

        //Batas Waktu 
        Route::get("/batas-waktu", [BatasWaktuController::class, 'index']);
        Route::get("/batas-waktu/add", [BatasWaktuController::class, 'add']);
        Route::post("/batas-waktu/store", [BatasWaktuController::class, 'store']);
        Route::get("/batas-waktu/edit/{batas_waktu_id}", [BatasWaktuController::class, 'edit']);
        Route::post("/batas-waktu/update", [BatasWaktuController::class, 'update']);

        // Siswa
        Route::get("/siswa", [SiswaController::class, 'index']);
        Route::get("/siswa/add", [SiswaController::class, 'add']);
        Route::post("/siswa/store", [SiswaController::class, 'store']);
        Route::get("/siswa/edit/{user_id}", [SiswaController::class, 'edit']);
        Route::post("/siswa/update", [SiswaController::class, 'update']);

        // Siswa Naik Kelass
        Route::get("/siswa-naik-kelas", [SiswaController::class, 'naikKelas']);
        Route::post("/siswa/do-naik-kelas", [SiswaController::class, 'doNaikKelas']);

        // Ketuntasan
        Route::get("/ketuntasan/add", [KetuntasanController::class, 'add']);
        Route::post("/ketuntasan/store", [KetuntasanController::class, 'store']);

        // param tingkatan,jurusan_id,kelas_id,user_id,ketuntasan_id;
        Route::match(['get', 'post'], "ketuntasan/kelas", [KetuntasanController::class, 'kelas']);
        Route::match(['get', 'post'], 'ketuntasan/kelas/siswa', [KetuntasanController::class, 'siswa']);
        Route::match(['get', 'post'], 'ketuntasan/kelas/siswa/edit', [KetuntasanController::class, 'edit']);
    });

    Route::middleware('isGuru')->group(function () {
        // ketuntasan role guru

        //param mapel_id,tingkatan.jurusan_id,kelas_id,ketuntasan_id
        Route::match(['get', 'post'], 'guru/ketuntasan/kelas', [KetuntasanController::class, 'guru_kelas']);
        Route::match(['get', 'post'], 'guru/ketuntasan/kelas/siswa', [KetuntasanController::class, 'guru_siswa']);
        Route::match(['get', 'post'], 'guru/ketuntasan/kelas/siswa/edit', [KetuntasanController::class, 'guru_edit']);

        Route::get("/guru/wali-kelas", [GuruController::class, 'waliKelas_dataSiswa']);
        Route::match(['get', 'post'], "/guru/wali-kelas/siswa/detail", [GuruController::class, 'waliKelas_detailKetuntasanSiswa']);
    });

    //Ketuntasan
    Route::get("/ketuntasan", [KetuntasanController::class, 'index']);
    Route::post("ketuntasan/update", [KetuntasanController::class, 'update']);
    Route::post("/ketuntasan/tuntaskan-siswa", [KetuntasanController::class, 'tuntaskanSiswa']);

    //Akun seting
    Route::get('/akun', [AuthController::class, 'akun']);
    Route::get("/akun/change-password", [AuthController::class, 'changePasswordPage']);
    Route::post("/akun/change-password", [AuthController::class, 'changePassword']);

    // ajax jgn di ubah
    Route::post("getDataGuruByMapel", [GuruController::class, 'getDataGuruByMapel']);
    Route::get("/getDataSiswaNaikKelas", [SiswaController::class, 'getDataSiswaNaikKelas']);
    Route::post("/getDataKelasByJurusan", [KelasController::class, 'getDataKelasByJurusan']);

    //logout
    Route::get('/logout', [AuthController::class, 'logout']);
});
