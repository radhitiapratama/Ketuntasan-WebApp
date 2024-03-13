<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\BatasWaktuController;
use App\Http\Controllers\GuruController;
use App\Http\Controllers\HelperController;
use App\Http\Controllers\JurusanController;
use App\Http\Controllers\KelasController;
use App\Http\Controllers\KeterlambatanController;
use App\Http\Controllers\KetidakhadiranController;
use App\Http\Controllers\KetuntasanController;
use App\Http\Controllers\MapelController;
use App\Http\Controllers\OperatorController;
use App\Http\Controllers\SiswaController;
use App\Http\Controllers\TahunAjaranController;
use App\Http\Controllers\UjianController;
use App\Http\Controllers\UserController;
use App\Models\Ujian;
use Illuminate\Support\Facades\Route;
use Symfony\Component\CssSelector\Node\FunctionNode;

Route::middleware(['isGuest'])->group(function () {
    Route::get("/", [AuthController::class, 'index'])->name('login');
    Route::post("/login", [AuthController::class, 'login']);
});

Route::middleware(['checkAuth'])->group(function () {
    //logout
    Route::get('/logout', [AuthController::class, 'logout']);

    // Superadmin
    Route::group(['prefix' => "superadmin"], function () {
        Route::get("/", [UserController::class, 'index']);
        Route::get("add", [UserController::class, 'add']);
        Route::post("store", [UserController::class, 'store']);
    });


    // Guru
    Route::group(['prefix' => "guru"], function () {
        Route::get("/", [GuruController::class, 'index']);
        Route::get("add", [GuruController::class, 'add']);
        Route::post("store", [GuruController::class, 'store']);
        Route::get("edit/{guru_id}", [GuruController::class, 'edit']);
        Route::post("update", [GuruController::class, 'update']);
        Route::post("import", [GuruController::class, 'importGuru']);
    });

    // Guru Mapel
    Route::group(['prefix' => "guru-mapel"], function () {
        Route::get("", [GuruController::class, 'guruMapel']);
        Route::get("add", [GuruController::class, 'guruMapel_add']);
        Route::post("store", [GuruController::class, 'guruMapel_store']);
        Route::get("edit/{guru_mapel_id}", [GuruController::class, 'guruMapel_edit']);
        Route::post("update", [GuruController::class, 'guruMapel_update']);
        Route::post("import", [GuruController::class, 'importGuruMapel']);
        // Route::post("/guru-mapels", [GuruController::class, 'getDataMapelByGuru']);
    });

    // Wali Kelas
    Route::group(['prefix' => "wali-kelas"], function () {
        Route::get("/", [GuruController::class, 'waliKelas']);
        Route::get("add", [GuruController::class, 'waliKelas_add']);
        Route::post("store", [GuruController::class, 'waliKelas_store']);
        Route::get("edit/{wali_kelas_id}", [GuruController::class, 'waliKelas_edit']);
        Route::post("update", [GuruController::class, 'waliKelas_update']);
        Route::post("import", [GuruController::class, 'waliKelas_import']);
    });

    // Jurusan
    Route::group(['prefix' => "jurusan"], function () {
        Route::get("/", [JurusanController::class, 'index']);
        Route::get("add", [JurusanController::class, 'add']);
        Route::post("store", [JurusanController::class, 'store']);
        Route::get("edit/{jurusan_id}", [JurusanController::class, 'edit']);
        Route::post("update", [JurusanController::class, 'update']);
        Route::post("import", [JurusanController::class, 'importJurusan']);
    });

    // Mapel
    Route::group(['prefix' => "mapel"], function () {
        Route::get("/", [MapelController::class, 'index']);
        Route::get("add", [MapelController::class, 'add']);
        Route::get("edit/{mapel_id}", [MapelController::class, 'edit']);
        Route::post("store", [MapelController::class, 'store']);
        Route::post("update", [MapelController::class, 'update']);
        Route::post("import", [MapelController::class, 'import']);
    });

    // Kelas
    Route::group(['prefix' => "kelas"], function () {
        Route::get("/", [KelasController::class, 'index']);
        Route::get("add", [KelasController::class, 'add']);
        Route::get("edit/{kelas_id}", [KelasController::class, 'edit']);
        Route::post("store", [KelasController::class, 'store']);
        Route::post("update", [KelasController::class, 'update']);
        Route::post("import", [KelasController::class, 'import']);
    });

    // Kelas mapel
    Route::group(['prefix' => "kelas-mapel"], function () {
        Route::get("/", [KelasController::class, 'kelasMapel']);
        Route::get("add", [KelasController::class, 'kelasMapel_add']);
        Route::post("store", [KelasController::class, 'kelasMapel_store']);
        Route::get("show/{tingkatan_id}/{jurusan_id}/{kelas_id}", [KelasController::class, 'kelasMapel_show']);
        Route::get("edit/{tingkatan_id}/{jurusan_id}/{kelas_id}", [KelasController::class, 'kelasMapel_edit']);
        Route::post("getDataGuruByMapel", [KelasController::class, 'kelasMapel_getDataGuruByMapel']);
        Route::post("update", [KelasController::class, 'kelasMapel_update']);
        Route::post("import", [KelasController::class, 'kelasMapel_import']);
    });

    // Tahun Ajaran
    Route::group(['prefix' => "tahun-ajaran"], function () {
        Route::get("/", [TahunAjaranController::class, 'index']);
        Route::get("add", [TahunAjaranController::class, 'add']);
        Route::post("store", [TahunAjaranController::class, 'store']);
        Route::get("edit/{tahun_ajaran_id}", [TahunAjaranController::class, 'edit']);
        Route::post('update', [TahunAjaranController::class, 'update']);
    });

    //Batas Waktu 
    Route::group(['prefix' => "batas-waktu"], function () {
        Route::get("/", [BatasWaktuController::class, 'index']);
        Route::get("add", [BatasWaktuController::class, 'add']);
        Route::post("store", [BatasWaktuController::class, 'store']);
        Route::get("edit/{batas_waktu_id}", [BatasWaktuController::class, 'edit']);
        Route::post("update", [BatasWaktuController::class, 'update']);
    });

    // Siswa
    Route::group(['prefix' => "siswa"], function () {
        Route::get("/", [SiswaController::class, 'index']);
        Route::get("add", [SiswaController::class, 'add']);
        Route::post("store", [SiswaController::class, 'store']);
        Route::get("edit/{user_id}", [SiswaController::class, 'edit']);
        Route::post("update", [SiswaController::class, 'update']);
        Route::post("import", [SiswaController::class, 'import']);
        Route::post("nonaktifkan-siswa", [SiswaController::class, 'nonaktifkanSiswa']);
        Route::get("naik-kelas", [SiswaController::class, 'naikKelas']);
        Route::post("naik-kelas/do", [SiswaController::class, 'doNaikKelas']);
    });

    // Ketuntasan 
    Route::group(['prefix' => "ketuntasan"], function () {
        Route::get("", [KetuntasanController::class, 'index']);
        Route::get("add", [KetuntasanController::class, 'add']);
        Route::post("store", [KetuntasanController::class, 'store']);
        Route::post("update", [KetuntasanController::class, 'update']);
        Route::post("tuntaskan-siswa", [KetuntasanController::class, 'tuntaskanSiswa']);

        Route::post('tuntaskanByGuru', [KetuntasanController::class, 'byGuruTuntaskan']);


        // param tingkatan,jurusan_id,kelas_id,user_id,ketuntasan_id;
        Route::match(['get', 'post'], "siswas", [KetuntasanController::class, 'siswa']);
        Route::match(['get', 'post'], "siswas/show", [KetuntasanController::class, 'siswa_show']);
        Route::match(['get', 'post'], 'siswas/edit', [KetuntasanController::class, 'edit']);

        Route::match(['get', 'post'], "by-guru", [KetuntasanController::class, 'byGuru']);
        Route::get("by-guru/{guru_id}", [KetuntasanController::class, 'byGuruMapel']);
        Route::get("by-guru/{guru_id}/{mapel_id}/{tingkatan}/{kelas_id}", [KetuntasanController::class, 'byGuruKetuntasan']);
        Route::get("by-guru/{guru_id}/{mapel_id}/{tingkatan}/{kelas_id}/edit/{ketuntasan_id}", [KetuntasanController::class, 'byGuruKetuntasanEdit']);
        Route::post("by-guru/cetak", [KetuntasanController::class, 'cetakByGuru']);

        Route::get("by-ruang", [KetuntasanController::class, 'byRuang']);
        Route::get("by-ruang/siswa/{siswa_id}", [KetuntasanController::class, 'byRuangKetuntasan']);
        Route::get("by-ruang/siswa/{siswa_id}/edit/{ketuntasan_id}", [KetuntasanController::class, 'byRuangEdit']);
    });

    // Ketuntasan Role Guru
    Route::group(['prefix' => "guru/ketuntasan"], function () {
        //param mapel_id,tingkatan.jurusan_id,kelas_id,ketuntasan_id
        Route::match(['get', 'post'], 'kelas', [KetuntasanController::class, 'guru_kelas']);
        Route::match(['get', 'post'], 'kelas/siswa', [KetuntasanController::class, 'guru_siswa']);
        Route::match(['get', 'post'], 'kelas/siswa/edit', [KetuntasanController::class, 'guru_edit']);
    });

    // Ketuntasan Guru Wali Kelas
    Route::group(['prefix' => "guru/wali-kelas"], function () {
        Route::get("", [GuruController::class, 'waliKelas_dataSiswa']);
        Route::match(['get', 'post'], "siswa/detail", [GuruController::class, 'waliKelas_detailKetuntasanSiswa']);
    });

    //Akun seting
    Route::group(['prefix' => "akun"], function () {
        Route::get('/', [AuthController::class, 'akun']);
        Route::get("change-password", [AuthController::class, 'changePasswordPage']);
        Route::post("change-password", [AuthController::class, 'changePassword']);
        Route::get("change-username", [AuthController::class, 'changeUsernamePage']);
        Route::post("change-username", [AuthController::class, 'changeUsername']);
    });

    // Reset-password 
    Route::get("/reset-password", [AuthController::class, 'resetPassword']);
    Route::post("/reset-password", [AuthController::class, 'doResetPassword']);
    Route::post("/getDataAccountByUsername", [AuthController::class, 'getDataAccountByUsername']);

    // Keterlambatan
    Route::group(['prefix' => 'keterlambatan'], function () {
        Route::get("", [KeterlambatanController::class, 'index']);
        Route::get("add", [KeterlambatanController::class, 'add']);
        Route::post("store", [KeterlambatanController::class, 'store']);
        Route::get("edit/{id_terlambat}", [KeterlambatanController::class, 'edit']);
        Route::post("update", [KeterlambatanController::class, 'update']);
        Route::post("cetak", [KeterlambatanController::class, 'cetak']);
        Route::get("add/by-qr", [KeterlambatanController::class, 'addByQr']);
        Route::post('delete', [KeterlambatanController::class, 'delete']);
    });

    // Operator
    Route::group(['prefix' => "operator"], function () {
        Route::get("/", [OperatorController::class, 'index']);
        Route::get("add", [OperatorController::class, 'add']);
        Route::post("store", [OperatorController::class, 'store']);
        Route::get("edit/{id_operator}", [OperatorController::class, 'edit']);
        Route::post("update", [OperatorController::class, 'update']);
    });

    // Ujian
    Route::group(['prefix' => "ujian"], function () {
        Route::match(["get", "post"], "/", [UjianController::class, 'index']);
        Route::get("add", [UjianController::class, 'add']);
        Route::post("store", [UjianController::class, 'store']);
        Route::get("edit/{id}", [UjianController::class, 'edit']);
        Route::post("update", [UjianController::class, 'update']);
        Route::post("cetak-qr", [UjianController::class, 'cetakQr']);
        // Route::post("check-siswa", [UjianController::class, 'checkSiswa']);
        Route::get("siswa/semester/{semester}", [UjianController::class, 'getDataSiswaBySemester']);
        Route::get("/{ujian_id}", [UjianController::class, 'getDataUjianById']);
    });

    // Ketidakhadiran
    Route::group(['prefix' => "ketidakhadiran"], function () {
        Route::match(['get', 'post'], "/", [KetidakhadiranController::class, 'index']);
        Route::get("add/by-qr");
        Route::get("add", [KetidakhadiranController::class, 'add']);
        Route::post("store", [KetidakhadiranController::class, 'store']);
        Route::get("edit/{id}", [KetidakhadiranController::class, 'edit']);
        Route::post("update", [KetidakhadiranController::class, 'update']);
        Route::get("add/by-qr", [KetidakhadiranController::class, 'addByQr']);
        Route::post("cetak", [KetidakhadiranController::class, 'cetak']);
        Route::post('delete', [KetidakhadiranController::class, 'delete']);
    });

    Route::group(['prefix' => "helper"], function () {
        Route::get("ordered-siswa-by-kelas/{tingkatan}/{jurusan}/{kelas}/{semester}", [HelperController::class, 'getOrderedSiswaByKelas']);
    });

    // ajax jgn di ubah
    Route::post("getDataGuruByMapel", [GuruController::class, 'getDataGuruByMapel']);

    Route::get("dashboard/kelas/siswas", [SiswaController::class, 'getDataSiswaByKelas']);
    Route::post("getGuruMapelByGuruMapelId", [GuruController::class, 'getGuruMapelByGuruMapelId']);
});
