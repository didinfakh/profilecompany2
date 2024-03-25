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

Route::resource('sys-menus', App\Http\Controllers\API\SysMenuAPIController::class)
    ->except(['create', 'edit']);

Route::resource('sys-actions', App\Http\Controllers\API\SysActionAPIController::class)
    ->except(['create', 'edit']);

Route::resource('sys-groups', App\Http\Controllers\API\SysGroupAPIController::class)
    ->except(['create', 'edit']);

Route::resource('sys-group-menus', App\Http\Controllers\API\SysGroupMenuAPIController::class)
    ->except(['create', 'edit']);

Route::resource('sys-settings', App\Http\Controllers\API\SysSettingAPIController::class)
    ->except(['create', 'edit']);