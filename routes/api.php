<?php

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\Api\BatasWaktuController;
use App\Http\Controllers\API\KetuntasanController;
use Illuminate\Support\Facades\Route;
use Psy\CodeCleaner\FunctionReturnInWriteContextPass;

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

    Route::get("ketuntasan", [KetuntasanController::class, 'index']);
    Route::get("account", [AuthController::class, 'account']);
    Route::post("account/change-password", [AuthController::class, 'changePassword']);
    Route::post("account/change-username", [AuthController::class, 'changeUsername']);

    Route::post("ketuntasan/update", [KetuntasanController::class, 'update']);
    Route::get("ketuntasan/edit", [KetuntasanController::class, 'edit']);

    Route::post("ketuntasan/tuntaskan", [KetuntasanController::class, 'tuntaskan']);

    Route::get("batas-waktu", [BatasWaktuController::class, 'index']);
});
