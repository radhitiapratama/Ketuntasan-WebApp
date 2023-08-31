<?php

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\GuruController;
use App\Http\Controllers\API\KetuntasanController;
use App\Models\Ketuntasan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Psy\Command\ListCommand\FunctionEnumerator;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post("login", [AuthController::class, 'login']);

Route::middleware(["auth:sanctum"])->group(function () {
    // Route::get("hello", function () {
    //     return response()->json("Hello world");
    // });

    Route::post("logout", [AuthController::class, 'logout']);
    Route::post("change-password", [AuthController::class, 'changePassword']);

    // Ketuntasan
    Route::post("siswa/ketuntasan", [KetuntasanController::class, 'siswa']);

    Route::post("guru/ketuntasan/mapel", [KetuntasanController::class, 'guru_mapel']);
    Route::post("guru/ketuntasan/mapel/kelas", [KetuntasanController::class, 'guru_kelas']);
    Route::post("guru/ketuntasan/mapel/kelas/siswa", [KetuntasanController::class, 'guru_siswa']);

    Route::put("guru/ketuntasan/mapel/kelas/siswa/edit", [KetuntasanController::class, 'update']);

    Route::post("guru/ketuntasan/tuntaskan", [KetuntasanController::class, 'tuntaskan']);



    // Account Setting
    Route::post("account", [AuthController::class, 'account']);

    // Wali Kelas
    Route::post("wali-kelas/ketuntasan/siswa", [GuruController::class, 'siswa']);
});
