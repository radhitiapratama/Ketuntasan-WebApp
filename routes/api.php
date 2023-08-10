<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Models\User;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get("/users", function (Request $request) {
    $user_id = $request->query('user_id');
    if (isset($user_id)) {
        $users = User::where("user_id", $user_id)->first();
    } else {
        $users = User::all();
    }

    return response()->json([
        'status' => "success",
        'users' => $users,
    ]);
});
