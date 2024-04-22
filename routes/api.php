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

Route::put('sys_group/setmenu/{id_group}', [App\Http\Controllers\API\SysGroupAPIController::class, 'setmenu']);

Route::get('sys_group/getmenu/{id_group}', [App\Http\Controllers\API\SysGroupAPIController::class, 'getmenu']);

Route::post('sys_user/create', [App\Http\Controllers\API\SysUserAPIController::class, 'create']);

Route::resource('sys_group_menu', App\Http\Controllers\API\SysGroupMenuAPIController::class)
    ->except(['create', 'edit']);

Route::resource('sys_setting', App\Http\Controllers\API\SysSettingAPIController::class)
    ->except(['create', 'edit']);

Route::resource('sys_log', App\Http\Controllers\API\SysLogAPIController::class)
    ->except(['create', 'edit']);


Route::resource('sys-settings', App\Http\Controllers\API\SysSettingAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_dampak', App\Http\Controllers\API\MtRiskDampakAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_kemungkinan', App\Http\Controllers\API\MtRiskKemungkinanAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_kriteria_dampak', App\Http\Controllers\API\MtRiskKriteriaDampakAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_matrix', App\Http\Controllers\API\MtRiskMatrixAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_perlakuan', App\Http\Controllers\API\MtRiskPerlakuanAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_tingkat', App\Http\Controllers\API\MtRiskTingkatAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_kriteria_dampak_detail', App\Http\Controllers\API\MtRiskKriteriaDampakDetailAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_sdm_jabatan', App\Http\Controllers\API\MtSdmJabatanAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_sdm_pegawai', App\Http\Controllers\API\MtSdmPegawaiAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_sdm_unit', App\Http\Controllers\API\MtSdmUnitAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_tingkat_perlakuan', App\Http\Controllers\API\MtRiskTingkatPerlakuanAPIController::class)
    ->except(['create', 'edit']);


Route::resource('mt_sdm_unit', App\Http\Controllers\API\MtSdmUnitAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_dampak', App\Http\Controllers\API\MtSdmUnitAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_kemungkinan', App\Http\Controllers\API\MtSdmUnitAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_kriteria_dampak', App\Http\Controllers\API\MtSdmUnitAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_kriteria_dampak_detail', App\Http\Controllers\API\MtSdmUnitAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_matrix', App\Http\Controllers\API\MtSdmUnitAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_perlakuan', App\Http\Controllers\API\MtSdmUnitAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_sikap_terhadap_risiko', App\Http\Controllers\API\MtSdmUnitAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_taksonomi', App\Http\Controllers\API\MtSdmUnitAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_taksonomi_area', App\Http\Controllers\API\MtSdmUnitAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_taksonomi_objective', App\Http\Controllers\API\MtSdmUnitAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_tingkat', App\Http\Controllers\API\MtSdmUnitAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_tingkat_perlakuan', App\Http\Controllers\API\MtSdmUnitAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_sdm_jabatan', App\Http\Controllers\API\MtSdmUnitAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_sdm_pegawai', App\Http\Controllers\API\MtSdmUnitAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_metrik_strategi_risiko', App\Http\Controllers\API\MtSdmUnitAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_dampak', App\Http\Controllers\API\MtRiskDampakAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_kemungkinan', App\Http\Controllers\API\MtRiskKemungkinanAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_kriteria_dampak', App\Http\Controllers\API\MtRiskKriteriaDampakAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_kriteria_dampak_detail', App\Http\Controllers\API\MtRiskKriteriaDampakDetailAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_matrix', App\Http\Controllers\API\MtRiskMatrixAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_perlakuan', App\Http\Controllers\API\MtRiskPerlakuanAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_sikap_terhadap_risiko', App\Http\Controllers\API\MtRiskSikapTerhadapRisikoAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_taksonomi', App\Http\Controllers\API\MtRiskTaksonomiAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_taksonomi_area', App\Http\Controllers\API\MtRiskTaksonomiAreaAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_taksonomi_objective', App\Http\Controllers\API\MtRiskTaksonomiObjectiveAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_tingkat', App\Http\Controllers\API\MtRiskTingkatAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_tingkat_perlakuan', App\Http\Controllers\API\MtRiskTingkatPerlakuanAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_sdm_jabatan', App\Http\Controllers\API\MtSdmJabatanAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_sdm_pegawai', App\Http\Controllers\API\MtSdmPegawaiAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_metrik_strategi_risiko', App\Http\Controllers\API\RiskMetrikStrategiRisikoAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_register', App\Http\Controllers\API\RiskRegisterAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_tingkat_agregasi_risiko', App\Http\Controllers\API\MtRiskTingkatAgregasiRisikoAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_status_pengajuan', App\Http\Controllers\API\MtStatusPengajuanAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_risiko', App\Http\Controllers\API\RiskRisikoAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_penyebab', App\Http\Controllers\API\RiskPenyebabAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_dampak', App\Http\Controllers\API\RiskDampakAPIController::class)
    ->except(['create', 'edit']);


Route::resource('risk_metrik_strategi_risiko', App\Http\Controllers\API\RiskMetrikStrategiRisikoAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_sasaran', App\Http\Controllers\API\RiskSasaranAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_capacity_limit', App\Http\Controllers\API\RiskCapacityLimitAPIController::class)

Route::resource('mt_risk_taksonomi_area', App\Http\Controllers\API\MtRiskTaksonomiAreaAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_taksonomi_objective', App\Http\Controllers\API\MtRiskTaksonomiObjectiveAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_taksonomi', App\Http\Controllers\API\MtRiskTaksonomiAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_jenis_data', App\Http\Controllers\API\MtJenisDataAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_capacity_limit', App\Http\Controllers\API\RiskCapacityLimitAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_profile', App\Http\Controllers\API\RiskProfileAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_sasaran', App\Http\Controllers\API\RiskSasaranAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_metrik_strategi_risiko', App\Http\Controllers\API\RiskMetrikStrategiRisikoAPIController::class)->except(['create', 'edit']);