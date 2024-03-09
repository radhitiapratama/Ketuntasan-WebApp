<?php

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\Api\BatasWaktuController;
use App\Http\Controllers\API\KetuntasanController;
use Illuminate\Support\Facades\Route;

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

Route::post("login", [AuthController::class, 'login']); //login

Route::middleware(["auth:sanctum"])->group(function () {
    Route::get("logout", [AuthController::class, 'logout']);

    Route::group(['prefix' => "account"], function () {
        Route::get("", [AuthController::class, 'account']);
        Route::post("change-password", [AuthController::class, 'changePassword']);
        Route::post("change-username", [AuthController::class, 'changeUsername']);
    });

    Route::group(['prefix' => "ketuntasan"], function () {
        Route::get("", [KetuntasanController::class, 'index']);
        Route::get("edit/{ketuntasan_id}", [KetuntasanController::class, 'edit']);
        Route::post("update", [KetuntasanController::class, 'update']);
        Route::post("tuntaskan", [KetuntasanController::class, 'tuntaskan']);
        Route::get("{siswa_id}/detail", [KetuntasanController::class, 'detailKetuntasan']);
    });

    Route::get("batas-waktu", [BatasWaktuController::class, 'index']);
    Route::get("wali-kelas/ketuntasan", [KetuntasanController::class, 'waliKelas_ketuntasan']);
});
