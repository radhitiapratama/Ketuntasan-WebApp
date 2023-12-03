<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\BatasWaktuController;
use App\Http\Controllers\GuruController;
use App\Http\Controllers\JurusanController;
use App\Http\Controllers\KelasController;
use App\Http\Controllers\KeterlambatanController;
use App\Http\Controllers\KetuntasanController;
use App\Http\Controllers\MapelController;
use App\Http\Controllers\OperatorController;
use App\Http\Controllers\SiswaController;
use App\Http\Controllers\TahunAjaranController;
use App\Http\Controllers\UjianController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;


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
    Route::post("/login", [AuthController::class, 'login']);
});

Route::middleware(['checkAuth'])->group(function () {
    // Superadmin
    Route::get("superadmin", [UserController::class, 'superadmin']);
    Route::get("superadmin/add", [UserController::class, 'superadmin_add']);
    Route::post("superadmin/store", [UserController::class, 'superadmin_store']);

    // Guru
    Route::get("/guru", [GuruController::class, 'index']);
    Route::get("/guru/add", [GuruController::class, 'add']);
    Route::post("/guru/store", [GuruController::class, 'store']);
    Route::get("/guru/edit/{guru_id}", [GuruController::class, 'edit']);
    Route::post("/guru/update", [GuruController::class, 'update']);
    Route::post("/guru/import", [GuruController::class, 'importGuru']);

    // Guru Mapel   
    Route::get("/guru-mapel", [GuruController::class, 'guruMapel']);
    Route::get("/guru-mapel/add", [GuruController::class, 'guruMapel_add']);
    Route::post("/guru-mapel/store", [GuruController::class, 'guruMapel_store']);
    Route::get("/guru-mapel/edit/{guru_mapel_id}", [GuruController::class, 'guruMapel_edit']);
    Route::post("/guru-mapel/update", [GuruController::class, 'guruMapel_update']);
    Route::post("/guru-mapels", [GuruController::class, 'getDataMapelByGuru']);
    Route::post("/guru-mapel/import", [GuruController::class, 'importGuruMapel']);

    // Wali Kelas
    Route::get("/wali-kelas", [GuruController::class, 'waliKelas']);
    Route::get("/wali-kelas/add", [GuruController::class, 'waliKelas_add']);
    Route::post("/wali-kelas/store", [GuruController::class, 'waliKelas_store']);
    Route::get("wali-kelas/edit/{wali_kelas_id}", [GuruController::class, 'waliKelas_edit']);
    Route::post("wali-kelas/update", [GuruController::class, 'waliKelas_update']);
    Route::post("wali-kelas/import", [GuruController::class, 'waliKelas_import']);

    // Jurusan
    Route::get("/jurusan", [JurusanController::class, 'index']);
    Route::get("/jurusan/add", [JurusanController::class, 'add']);
    Route::post("/jurusan/store", [JurusanController::class, 'store']);
    Route::get("/jurusan/edit/{jurusan_id}", [JurusanController::class, 'edit']);
    Route::post("/jurusan/update", [JurusanController::class, 'update']);
    Route::post("/jurusan/import", [JurusanController::class, 'importJurusan']);

    // Mapel
    Route::get("/mapel", [MapelController::class, 'index']);
    Route::get("/mapel/add", [MapelController::class, 'add']);
    Route::get("/mapel/edit/{mapel_id}", [MapelController::class, 'edit']);
    Route::post("/mapel/store", [MapelController::class, 'store']);
    Route::post("/mapel/update", [MapelController::class, 'update']);
    Route::post("/mapel/import", [MapelController::class, 'import']);

    // Kelas
    Route::get("/kelas", [KelasController::class, 'index']);
    Route::get("/kelas/add", [KelasController::class, 'add']);
    Route::get("/kelas/edit/{kelas_id}", [KelasController::class, 'edit']);
    Route::post("/kelas/store", [KelasController::class, 'store']);
    Route::post("/kelas/update", [KelasController::class, 'update']);
    Route::post("/kelas/import", [KelasController::class, 'import']);


    // Kelas mapel
    Route::get("/kelas-mapel", [KelasController::class, 'kelasMapel']);
    Route::get("/kelas-mapel/add", [KelasController::class, 'kelasMapel_add']);
    Route::post("/kelas-mapel/store", [KelasController::class, 'kelasMapel_store']);
    Route::get("/kelas-mapel/show/{tingkatan_id}/{jurusan_id}/{kelas_id}", [KelasController::class, 'kelasMapel_show']);
    Route::get("/kelas-mapel/edit/{tingkatan_id}/{jurusan_id}/{kelas_id}", [KelasController::class, 'kelasMapel_edit']);
    Route::post("/kelas-mapel/getDataGuruByMapel", [KelasController::class, 'kelasMapel_getDataGuruByMapel']);
    Route::post("/kelas-mapel/update", [KelasController::class, 'kelasMapel_update']);
    Route::post("/kelas-mapel/import", [KelasController::class, 'kelasMapel_import']);


    // Tahun Ajaran
    Route::get("/tahun-ajaran", [TahunAjaranController::class, 'index']);
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
    Route::post("/siswa/import", [SiswaController::class, 'import']);
    Route::post("/siswa/nonaktifkan-siswa", [SiswaController::class, 'nonaktifkanSiswa']);

    // Siswa Naik Kelass
    Route::get("/siswa-naik-kelas", [SiswaController::class, 'naikKelas']);
    Route::post("/siswa/do-naik-kelas", [SiswaController::class, 'doNaikKelas']);

    // Ketuntasan
    Route::get("/ketuntasan/add", [KetuntasanController::class, 'add']);
    Route::post("/ketuntasan/store", [KetuntasanController::class, 'store']);

    // Ketuntasan Admin

    // param tingkatan,jurusan_id,kelas_id,user_id,ketuntasan_id;
    Route::match(['get', 'post'], "ketuntasan/siswas", [KetuntasanController::class, 'siswa']);
    Route::match(['get', 'post'], "ketuntasan/siswas/show", [KetuntasanController::class, 'siswa_show']);
    Route::match(['get', 'post'], 'ketuntasan/siswas/edit', [KetuntasanController::class, 'edit']);

    // End Ketuntasan Admin


    // Ketuntasan Guru

    //param mapel_id,tingkatan.jurusan_id,kelas_id,ketuntasan_id
    Route::match(['get', 'post'], 'guru/ketuntasan/kelas', [KetuntasanController::class, 'guru_kelas']);
    Route::match(['get', 'post'], 'guru/ketuntasan/kelas/siswa', [KetuntasanController::class, 'guru_siswa']);
    Route::match(['get', 'post'], 'guru/ketuntasan/kelas/siswa/edit', [KetuntasanController::class, 'guru_edit']);

    Route::get("/guru/wali-kelas", [GuruController::class, 'waliKelas_dataSiswa']);
    Route::match(['get', 'post'], "/guru/wali-kelas/siswa/detail", [GuruController::class, 'waliKelas_detailKetuntasanSiswa']);

    // End Ketuntasan Guru

    //Ketuntasan
    Route::get("/ketuntasan", [KetuntasanController::class, 'index']);
    Route::post("ketuntasan/update", [KetuntasanController::class, 'update']);
    Route::post("/ketuntasan/tuntaskan-siswa", [KetuntasanController::class, 'tuntaskanSiswa']);

    //Akun seting
    Route::get('/akun', [AuthController::class, 'akun']);
    Route::get("/akun/change-password", [AuthController::class, 'changePasswordPage']);
    Route::post("/akun/change-password", [AuthController::class, 'changePassword']);
    Route::get("/akun/change-username", [AuthController::class, 'changeUsernamePage']);
    Route::post("/akun/change-username", [AuthController::class, 'changeUsername']);

    Route::get("/reset-password", [AuthController::class, 'resetPassword']);
    Route::post("/getDataAccountByUsername", [AuthController::class, 'getDataAccountByUsername']);
    Route::post("/reset-password", [AuthController::class, 'doResetPassword']);

    // ajax jgn di ubah
    Route::post("getDataGuruByMapel", [GuruController::class, 'getDataGuruByMapel']);

    Route::get("dashboard/kelas/siswas", [SiswaController::class, 'getDataSiswaByKelas']);
    Route::post("getGuruMapelByGuruMapelId", [GuruController::class, 'getGuruMapelByGuruMapelId']);

    //logout
    Route::get('/logout', [AuthController::class, 'logout']);

    Route::match(['get', 'post'], "/ketuntasan/by-guru", [KetuntasanController::class, 'byGuru']);

    Route::get("/ketuntasan/by-guru/{guru_id}", [KetuntasanController::class, 'byGuruMapel']);
    Route::get("/ketuntasan/by-guru/{guru_id}/{mapel_id}/{tingkatan}/{kelas_id}", [KetuntasanController::class, 'byGuruKetuntasan']);
    Route::get("/ketuntasan/by-guru/{guru_id}/{mapel_id}/{tingkatan}/{kelas_id}/edit/{ketuntasan_id}", [KetuntasanController::class, 'byGuruKetuntasanEdit']);
    Route::post("ketuntasan/by-guru/cetak", [KetuntasanController::class, 'cetakByGuru']);

    Route::post('ketuntasan/tuntaskanByGuru', [KetuntasanController::class, 'byGuruTuntaskan']);
    Route::post("/byGuru/updateKetuntasan", [KetuntasanController::class, 'byGuruUpdate']);

    Route::get("/ketuntasan/by-ruang", [KetuntasanController::class, 'byRuang']);
    Route::get("/ketuntasan/by-ruang/siswa/{siswa_id}", [KetuntasanController::class, 'byRuangKetuntasan']);
    Route::get("//ketuntasan/by-ruang/siswa/{siswa_id}/edit/{ketuntasan_id}", [KetuntasanController::class, 'byRuangEdit']);

    Route::get("keterlambatan", [KeterlambatanController::class, 'index']);

    Route::get("/keterlambatan/add", [KeterlambatanController::class, 'add']);
    Route::post("/keterlambatan/store", [KeterlambatanController::class, 'store']);

    Route::get("/keterlambatan/edit/{id_terlambat}", [KeterlambatanController::class, 'edit']);
    Route::post("/keterlambatan/update", [KeterlambatanController::class, 'update']);

    Route::post("/keterlambatan/cetak", [KeterlambatanController::class, 'cetak']);
    Route::get("/keterlambatan/add/by-qr", [KeterlambatanController::class, 'addByQr']);


    Route::get("/operator", [OperatorController::class, 'index']);
    Route::get("/operator/add", [OperatorController::class, 'add']);
    Route::post("/operator/store", [OperatorController::class, 'store']);
    Route::get("/operator/edit/{id_operator}", [OperatorController::class, 'edit']);
    Route::post("/operator/update", [OperatorController::class, 'update']);

    Route::match(["get", "post"], "/ujian", [UjianController::class, 'index']);
    Route::get("/ujian/add", [UjianController::class, 'add']);
    Route::post("/ujian/store", [UjianController::class, 'store']);
    Route::get("/ujian/edit/{id}", [UjianController::class, 'edit']);
    Route::post("/ujian/update", [UjianController::class, 'update']);
    Route::post("/ujian/cetak-qr", [UjianController::class, 'cetakQr']);
    Route::post("/ujian/check-siswa", [UjianController::class, 'checkSiswa']);
});
