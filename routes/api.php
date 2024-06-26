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

Route::resource('mt_sdm_jabatan', App\Http\Controllers\API\MtSdmUnitAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_sdm_pegawai', App\Http\Controllers\API\MtSdmUnitAPIController::class)
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

Route::resource('mt_sdm_jabatan', App\Http\Controllers\API\MtSdmJabatanAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_sdm_pegawai', App\Http\Controllers\API\MtSdmPegawaiAPIController::class)
    ->except(['create', 'edit']);


Route::get('risk_register/tree', [App\Http\Controllers\API\RiskRegisterAPIController::class, 'tree']);
Route::get('risk_register/without_tree', [App\Http\Controllers\API\RiskRegisterAPIController::class, 'show_without_tree']);

Route::get('risk_register/getdetail/{id}', [App\Http\Controllers\API\RiskRegisterAPIController::class, 'getdetail']);
Route::post('risk_register/ajukan/{jenis}', [App\Http\Controllers\API\RiskRegisterAPIController::class, 'ajukan']);
Route::post('readnotif/{id}', [App\Http\Controllers\API\RiskRegisterAPIController::class, 'readmsg']);
Route::get('notifikasi', [App\Http\Controllers\API\RiskRegisterAPIController::class, 'notif']);

Route::get('search', [App\Http\Controllers\API\RiskProfileAPIController::class, 'search']);

Route::resource('risk_register', App\Http\Controllers\API\RiskRegisterAPIController::class)
    ->except(['create', 'edit']);


Route::resource('mt_risk_tingkat_agregasi_risiko', App\Http\Controllers\API\MtRiskTingkatAgregasiRisikoAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_status_pengajuan', App\Http\Controllers\API\MtStatusPengajuanAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_penyebab', App\Http\Controllers\API\RiskPenyebabAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_dampak', App\Http\Controllers\API\RiskDampakAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_taksonomi_area', App\Http\Controllers\API\MtRiskTaksonomiAreaAPIController::class)->except(['create', 'edit']);

Route::resource('mt_risk_taksonomi_objective', App\Http\Controllers\API\MtRiskTaksonomiObjectiveAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_taksonomi', App\Http\Controllers\API\MtRiskTaksonomiAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_jenis_data', App\Http\Controllers\API\MtJenisDataAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_taksonomi', App\Http\Controllers\API\MtRiskTaksonomiAPIController::class)
    ->except(['create', 'edit']);


Route::resource('mt_risk_kategori_risiko', App\Http\Controllers\API\MtRiskKategoriRisikoAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_jenis_risiko', App\Http\Controllers\API\MtRiskJenisRisikoAPIController::class)->except(['create', 'edit']);
Route::resource('mt_risk_kemungkinan', App\Http\Controllers\API\MtRiskKemungkinanAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_sikap_terhadap_risiko', App\Http\Controllers\API\MtRiskSikapTerhadapRisikoAPIController::class)
    ->except(['create', 'edit']);


// Route::resource('risk_metrik_strategi_risiko/{id?}', App\Http\Controllers\API\RiskMetrikStrategiRisikoAPIController::class)
//     ->except(['create', 'edit']);

function routeRiskRegister($name, $controller)
{
    Route::get($name . '/{id_register}', [$controller, 'index']);
    Route::get($name . '/{id_register}/{id}', [$controller, 'show']);
    Route::post($name . '/{id_register}', [$controller, 'store']);
    Route::put($name . '/{id_register}/{id}', [$controller, 'update']);
    Route::delete($name . '/{id_register}/{id}', [$controller, 'destroy']);
}

Route::get('risk_profile/matriks', [App\Http\Controllers\API\RiskProfileAPIController::class, 'matriks']);
Route::get('risk_profile/top_risk', [App\Http\Controllers\API\RiskProfileAPIController::class, 'top_risk']);
Route::get('risk_profile/top_risk_agregasi', [App\Http\Controllers\API\RiskProfileAPIController::class, 'top_risk_agregasi']);
Route::get('risk_profile/sebaran_risiko', [App\Http\Controllers\API\RiskProfileAPIController::class, 'sebaran_risiko']);
Route::get('risk_profile/progress_efektifitas', [App\Http\Controllers\API\RiskProfileAPIController::class, 'progress_efektifitas']);
Route::get('risk_profile/laporan_unit_kerja', [App\Http\Controllers\API\RiskProfileAPIController::class, 'laporan_unit_kerja']);
Route::get('risk_profile/kri', [App\Http\Controllers\API\RiskProfileAPIController::class, 'kri']);
routeRiskRegister('risk_metrik_strategi_risiko', App\Http\Controllers\API\RiskMetrikStrategiRisikoAPIController::class);
routeRiskRegister('risk_profile', App\Http\Controllers\API\RiskProfileAPIController::class);
routeRiskRegister('risk_sasaran', App\Http\Controllers\API\RiskSasaranAPIController::class);
routeRiskRegister('risk_capacity_limit', App\Http\Controllers\API\RiskCapacityLimitAPIController::class);
routeRiskRegister('lost_event', App\Http\Controllers\API\LostEventAPIController::class);
routeRiskRegister('internal_control_testing', App\Http\Controllers\API\InternalControlTestingAPIController::class);


// Route::resource('internal_control_testing', App\Http\Controllers\API\InternalControlTestingAPIController::class)
// ->except(['create', 'edit']);

// Route::resource('lost_event', App\Http\Controllers\API\LostEventAPIController::class)
//     ->except(['create', 'edit']);


function routeRisiko($name, $controller)
{
    Route::get($name . '/{id_register}', [$controller, 'index']);
    Route::get($name . '/{id_risk_profile}/{id}', [$controller, 'show']);
    Route::post($name . '/{id_risk_profile}', [$controller, 'store']);
    Route::put($name . '/{id_risk_profile}/{id}', [$controller, 'update']);
    Route::delete($name . '/{id_risk_profile}/{id}', [$controller, 'destroy']);
}
routeRisiko('risk_profile_mitigasi', App\Http\Controllers\API\RiskProfileMitigasiAPIController::class);


Route::get('risk_profile_target_residual/{id_register}/{id_risk_profile}', [App\Http\Controllers\API\RiskProfileTargetResidualAPIController::class, 'show']);
Route::put('risk_profile_target_residual/{id_register}/{id_risk_profile}', [App\Http\Controllers\API\RiskProfileTargetResidualAPIController::class, 'update']);


Route::put('risk_sasaran/approve/{id_register}/{id}/{jenis}', [App\Http\Controllers\API\RiskSasaranAPIController::class, 'approve']);
Route::get('risk_capacity_limit/eksposur/{id_register}/{tahun}', [App\Http\Controllers\API\RiskCapacityLimitAPIController::class, 'eksposur']);
Route::put('risk_risiko/approve/{id}', [App\Http\Controllers\API\RiskRisikoAPIController::class, 'approve']);
Route::put('risk_penyebab/approve/{id}', [App\Http\Controllers\API\RiskPenyebabAPIController::class, 'approve']);
Route::put('risk_dampak/approve/{id}', [App\Http\Controllers\API\RiskDampakAPIController::class, 'approve']);

Route::resource('mt_risk_jenis_control', App\Http\Controllers\API\MtRiskJenisControlAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_efektifitas_control', App\Http\Controllers\API\MtRiskEfektifitasControlAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_sasaran', App\Http\Controllers\API\MtRiskSasaranAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_penyebab', App\Http\Controllers\API\RiskPenyebabAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_dampak', App\Http\Controllers\API\RiskDampakAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_risiko', App\Http\Controllers\API\RiskRisikoAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_penyebab', App\Http\Controllers\API\RiskPenyebabAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_dampak', App\Http\Controllers\API\RiskDampakAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_matrix', App\Http\Controllers\API\MtRiskMatrixAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_dampak', App\Http\Controllers\API\MtRiskDampakAPIController::class)
    ->except(['create', 'edit']);


Route::resource('mt_lost_event_kategori', App\Http\Controllers\API\MtLostEventKategoriAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_kriteria_dampak', App\Http\Controllers\API\MtRiskKriteriaDampakAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_profile_penyebab', App\Http\Controllers\API\RiskProfilePenyebabAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_profile_kri', App\Http\Controllers\API\RiskProfileKriAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_profile_control', App\Http\Controllers\API\RiskProfileControlAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_profile_dampak', App\Http\Controllers\API\RiskProfileDampakAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_sasaran_strategi', App\Http\Controllers\API\RiskSasaranStrategiAPIController::class)
    ->except(['create', 'edit']);


Route::resource('risk_sasaran_strategi', App\Http\Controllers\API\RiskSasaranStrategiAPIController::class)
    ->except(['create', 'edit']);


Route::resource('mt_risk_kriteria_dampak_detail', App\Http\Controllers\API\MtRiskKriteriaDampakDetailAPIController::class)
    ->except(['create', 'edit']);


Route::get('laporan_bk_risiko/print', [App\Http\Controllers\API\LaporanBkRisikoAPIController::class, 'print']);
Route::get('loss_event/print', [App\Http\Controllers\API\LaporanBkRisikoAPIController::class, 'printlossevent']);
Route::get('laporan_matrik_strategi_risiko/print', [App\Http\Controllers\API\LaporanBkRisikoAPIController::class, 'printmatrik']);
Route::get('laporan_sasaran_strategi_bisnis/print', [App\Http\Controllers\API\LaporanBkRisikoAPIController::class, 'printsasaran']);
Route::get('laporan_internal_control_testing/print', [App\Http\Controllers\API\LaporanBkRisikoAPIController::class, 'printinternal_control_testing']);

Route::resource('laporan_bk_risiko', App\Http\Controllers\API\LaporanBkRisikoAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_tamplate_laporan', App\Http\Controllers\API\MtTamplateLaporanAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_template_laporan', App\Http\Controllers\API\MtTemplateLaporanAPIController::class)
    ->except(['create', 'edit']);
Route::resource('mt_risk_kriteria_dampak_detail', App\Http\Controllers\API\MtRiskKriteriaDampakDetailAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_matrix', App\Http\Controllers\API\MtRiskMatrixAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_sdm_jabatan', App\Http\Controllers\API\MtSdmJabatanAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_tingkat_agregasi_risiko', App\Http\Controllers\API\MtRiskTingkatAgregasiRisikoAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_status_pengajuan', App\Http\Controllers\API\MtStatusPengajuanAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_sdm_kelompok_bisnis', App\Http\Controllers\API\MtSdmKelompokBisnisAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_sdm_unit', App\Http\Controllers\API\MtSdmUnitAPIController::class)
    ->except(['create', 'edit']);


Route::resource('mt_risk_jenis_program_rkap', App\Http\Controllers\API\MtRiskJenisProgramRkapAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_jenis_perlakuan', App\Http\Controllers\API\MtRiskJenisPerlakuanAPIController::class)
    ->except(['create', 'edit']);


Route::resource('risk_profile_mitigasi_timeline', App\Http\Controllers\API\RiskProfileMitigasiTimelineAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_profile_mitigasi_jenis', App\Http\Controllers\API\RiskProfileMitigasiJenisAPIController::class)
    ->except(['create', 'edit']);


Route::get('risk_profile_realisasi_residual/{id_risk_profile}/{periode}', [App\Http\Controllers\API\RiskProfileRealisasiResidualAPIController::class, 'show']);
Route::post('risk_profile_realisasi_residual/{id_risk_profile}/{periode}', [App\Http\Controllers\API\RiskProfileRealisasiResidualAPIController::class, 'update']);
Route::post('update_profile', [App\Http\Controllers\API\SysUserAPIController::class, 'update_profile']);

// Route::resource('risk_profile_realisasi_residual', App\Http\Controllers\API\RiskProfileRealisasiResidualAPIController::class)
//     ->except(['create', 'edit']);


Route::resource('mt_status_rencana_perlakuan', App\Http\Controllers\API\MtStatusRencanaPerlakuanAPIController::class)
    ->except(['create', 'edit']);

// Route::resource('risk_profile_mitigasi_realisasi', App\Http\Controllers\API\RiskProfileMitigasiRealisasiAPIController::class)
//     ->except(['create', 'edit']);

Route::get('risk_profile_mitigasi_realisasi/{id_risk_profile}/{periode}', [App\Http\Controllers\API\RiskProfileMitigasiRealisasiAPIController::class, 'show']);
Route::post('risk_profile_mitigasi_realisasi/{id_risk_profile}/{periode}', [App\Http\Controllers\API\RiskProfileMitigasiRealisasiAPIController::class, 'update']);
Route::post('risk_profile_mitigasi_realisasi/{id_risk_profile}/{periode}', [App\Http\Controllers\API\RiskProfileMitigasiRealisasiAPIController::class, 'update']);
Route::get('risk_profile_kri/check_status/{id_kri}/{nilai}', [App\Http\Controllers\API\RiskProfileKriAPIController::class, 'checkstatus']);
Route::get('level_risiko/{id_register}/{tahun}/{jenis}', [App\Http\Controllers\API\RiskProfileAPIController::class, 'levelrisiko']);


Route::resource('risk_profile_kri_hasil', App\Http\Controllers\API\RiskProfileKriHasilAPIController::class)
    ->except(['create', 'edit']);


Route::resource('mt_lost_event_status_asuransi', App\Http\Controllers\API\MtLostEventStatusAsuransiAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_lost_event_frakuensi_kejadian', App\Http\Controllers\API\MtLostEventFrakuensiKejadianAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_lost_event_sumber', App\Http\Controllers\API\MtLostEventSumberPenyebabKejadianAPIController::class)
    ->except(['create', 'edit']);


Route::resource('mt_risk_agregasi_risiko', App\Http\Controllers\API\MtRiskAgregasiRisikoAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_assessment_type', App\Http\Controllers\API\MtAssessmentTypeAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_kategori_dokumen', App\Http\Controllers\API\MtKategoriDokumenAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_sdm_pegawai', App\Http\Controllers\API\MtSdmPegawaiAPIController::class)
    ->except(['create', 'edit']);

Route::resource('sys_user', App\Http\Controllers\API\SysUserAPIController::class)
    ->except(['create', 'edit']);

Route::resource('sys_user_group', App\Http\Controllers\API\SysUserGroupAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_msg', App\Http\Controllers\API\RiskMsgAPIController::class)
    ->except(['create', 'edit']);

Route::get('risk_task', [App\Http\Controllers\API\RiskMsgAPIController::class, 'index_task']);

Route::resource('risk_msg_penerima', App\Http\Controllers\API\RiskMsgPenerimaAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_msg_penerima', App\Http\Controllers\API\RiskMsgPenerimaAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_status_pengajuan_page_disable', App\Http\Controllers\API\MtStatusPengajuanPageDisableAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_status_pengajuan_penerima', App\Http\Controllers\API\MtStatusPengajuanPenerimaAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_msg', App\Http\Controllers\API\RiskMsgAPIController::class)
    ->except(['create', 'edit']);

Route::resource('risk_msg_penerima', App\Http\Controllers\API\RiskMsgPenerimaAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_agregasi_kelompok_bisnis', App\Http\Controllers\API\MtRiskAgregasiKelompokBisnisAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_status_rencana_perlakuan', App\Http\Controllers\API\MtStatusRencanaPerlakuanAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_assessment_type', App\Http\Controllers\API\MtAssessmentTypeAPIController::class)
    ->except(['create', 'edit']);

Route::resource('mt_risk_agregasi_risiko_sasaran', App\Http\Controllers\API\MtRiskAgregasiRisikoSasaranAPIController::class)
    ->except(['create', 'edit']);


Route::resource('mt_kategori_dokumen', App\Http\Controllers\API\MtKategoriDokumenAPIController::class)
    ->except(['create', 'edit']);

Route::resource('dokumen', App\Http\Controllers\API\DokumenAPIController::class)
    ->except(['create', 'edit']);

Route::get('getfile/{file_name}/{client_name}', [App\Http\Controllers\API\DokumenAPIController::class, 'getfile']);

Route::resource('risk_msg', App\Http\Controllers\API\RiskMsgAPIController::class)
    ->except(['create', 'edit']);

Route::resource('sys_log', App\Http\Controllers\API\SysLogAPIController::class)
    ->except(['create', 'edit']);

Route::resource('sys_setting', App\Http\Controllers\API\SysSettingAPIController::class)
    ->except(['create', 'edit']);


Route::resource('risk_jadwal_pelaporan', App\Http\Controllers\API\RiskJadwalPelaporanAPIController::class)
    ->except(['create', 'edit']);