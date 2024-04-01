<?php

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

Route::middleware(['auth:sanctum'])->get('/user', function (Request $request) {
    return $request->user();
});

Route::resource('sys_menu', App\Http\Controllers\API\SysMenuAPIController::class)
    ->except(['create', 'edit']);

Route::resource('sys_action', App\Http\Controllers\API\SysActionAPIController::class)
    ->except(['create', 'edit']);

Route::resource('sys_group', App\Http\Controllers\API\SysGroupAPIController::class)
    ->except(['create', 'edit']);

Route::resource('sys_group_menu', App\Http\Controllers\API\SysGroupMenuAPIController::class)
    ->except(['create', 'edit']);

Route::resource('sys_setting', App\Http\Controllers\API\SysSettingAPIController::class)
    ->except(['create', 'edit']);

Route::resource('sys_log', App\Http\Controllers\API\SysLogAPIController::class)
    ->except(['create', 'edit']);
