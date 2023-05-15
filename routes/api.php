<?php

use Illuminate\Http\Request;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group([
 
    'middleware' => ['api','jwt.verify'],
  
 ], function ($router) {
  
    
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');
    Route::get('getBarang', 'BarangController@getBarang');
    Route::post('tambahBarang', 'BarangController@tambahBarang');
    Route::post('ubahBarang', 'BarangController@ubahBarang');
    Route::get('hapusBarang/{id}', 'BarangController@hapusBarang');

    Route::get('getLokasi', 'LokasiController@getLokasi');
    Route::post('tambahLokasi', 'LokasiController@tambahLokasi');
    Route::post('ubahLokasi', 'LokasiController@ubahLokasi');
    Route::get('hapusLokasi/{id}', 'LokasiController@hapusLokasi');


 });
Route::post('login', 'AuthController@login');
Route::post('users', 'UserController@store');
Route::get('users', 'UserController@index');
