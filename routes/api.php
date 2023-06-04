<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\KendaraanController;
use App\Http\Controllers\Api\ModelMobilController;
use App\Http\Controllers\Api\ReservasiController;
use App\Http\Controllers\Api\ServiceController;
use App\Http\Middleware\ApiAuthCheck;
use Illuminate\Http\Request;
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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('register',[AuthController::class, 'register']);
Route::post('login',[AuthController::class, 'login']);

Route::middleware(ApiAuthCheck::class)->group(function(){
    Route::group(['prefix'=>'kendaraan'],function(){
        Route::get('/',[KendaraanController::class, 'index']);
        Route::post('insert',[KendaraanController::class, 'insert']);
        Route::get('/{no_rangka}',[KendaraanController::class, 'edit']);

    });
    Route::group(['prefix'=>'reservasi'],function(){
        Route::post('insert',[ReservasiController::class, 'insert']);
        Route::post('complete/service/{id}',[ReservasiController::class, 'setService']);
        
    });
    Route::group(['prefix'=>'service'],function(){
        Route::get('/{id_kendaraan}',[ServiceController::class, 'index']);

        Route::get('/show/all',[ServiceController::class, 'showAll']);
        Route::get('/{id_service}',[ServiceController::class, 'detail']);
    });
});

Route::get('/model-mobil',[ModelMobilController::class, 'index']);
Route::get('/merk',[KendaraanController::class,'merk_mobil']);
Route::post('/merk/insert',[KendaraanController::class,'insertMerk']);
Route::get('reservasi/{status}',[ReservasiController::class,'index']);
Route::get('reservasi/detail/{id}',[ReservasiController::class, 'detail']);
Route::get('reservasi/status/{id}',[ReservasiController::class, 'changeStatus']);
Route::get('reservasi/cancel/{id}',[ReservasiController::class, 'changeStatusCancel']);


