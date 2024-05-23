<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class RiskProfile extends BaseModel
{
    public $table = 'risk_profile';

    public $primaryKey = 'id_risk_profile';

    public $fillable = [
        'sasaran',
        'id_sasaran',
        'id_jenis_risiko',
        'id_taksonomi',
        'id_risiko',
        'nama',
        'jenis',
        'deskripsi',
        'id_register',
        'is_kuantitatif',
        'penjelasan_dampak',
        'nilai_dampak_inheren',
        'id_dampak_inheren',
        'nilai_kemungkinan',
        'id_kemungkinan_inheren',
        'created_by',
        'updated_by',
        'deleted_by',
        'created_by_desc',
        'updated_by_desc',
        'deleted_by_desc'
    ];

    protected $casts = [
        'sasaran' => 'string',
        'nama' => 'string',
        'deskripsi' => 'string',
        'penjelasan_dampak' => 'string',
        'nilai_dampak_inheren' => 'decimal:2',
        'nilai_kemungkinan' => 'decimal:2',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'sasaran' => 'nullable|string|max:1000',
        'id_sasaran' => 'nullable',
        'nama' => 'required',
        'jenis' => 'nullable',
        'penyebab' => 'required',
        'penyebab.*.nama' => 'required',
        'dampak' => 'required',
        'dampak.*.nama' => 'required',
        'id_jenis_risiko' => 'nullable',
        'id_taksonomi' => 'nullable',
        'id_risiko' => 'nullable',
        'deskripsi' => 'nullable|string',
        'id_register' => 'nullable',
        'is_kuantitatif' => 'nullable',
        'penjelasan_dampak' => 'nullable|string|max:2000',
        'nilai_dampak_inheren' => 'nullable|numeric',
        'id_dampak_inheren' => 'nullable',
        'nilai_kemungkinan' => 'nullable|numeric',
        'id_kemungkinan_inheren' => 'nullable',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'updated_by' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_at' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'updated_by_desc' => 'nullable|string|max:200',
        'deleted_by_desc' => 'nullable|string|max:200'
    ];

    public function idSasaran(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskSasaran::class, 'id_sasaran');
    }

    public function idJenisRisiko(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskJenisRisiko::class, 'id_jenis_risiko');
    }

    public function idTaksonomi(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskTaksonomi::class, 'id_taksonomi');
    }

    public function idRegister(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskRegister::class, 'id_register');
    }

    public function idRisiko(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskRisiko::class, 'id_risiko');
    }

    public function riskProfileKris(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskProfileKri::class, 'id_risk_profile');
    }

    public function riskDampaks(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\RiskDampak::class, 'risk_profile_dampak');
    }

    public function riskPenyebabs(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\RiskPenyebab::class, 'risk_profile_penyebab');
    }

    public function riskProfileMitigasis(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskProfileMitigasi::class, 'id_risk_profile');
    }

    public function laporan($params = [])
    {
        $params['header'] = explode(",", $params['header']);
        $paramarr = [];
        $where = "";
        if ($params["id_register"] && $params["id_register"] != 'null') {
            $where .= " and rp.id_register = ?";
            $paramarr[] = $params['id_register'];
        }
        if ($params["tahun"]) {
            $where .= " and to_char(rp.tgl_risiko,'YYYY') = ?";
            $paramarr[] = $params['tahun'];
        }

        $sql = "select rp.*, 
        mts.nama sasaran_nama,
        mrjr.nama jenis_risiko_nama,
        mrt.nama taksonomi_nama,
        mrd.nama skala_dampak,
        mrk.nama skala_probabilitas,
        coalesce(rp.nilai_dampak_inheren,0)*coalesce(rp.nilai_kemungkinan,0)/100 as eksposur_risiko,
        mrm.skala as skala_risiko,
        mrtk.nama as level_risiko
        from risk_profile rp 
        left join mt_risk_sasaran mts on rp.id_sasaran = mts.id_sasaran
        left join mt_risk_jenis_risiko mrjr on rp.id_jenis_risiko = mrjr.id_jenis_risiko
        left join mt_risk_taksonomi mrt on rp.id_taksonomi = mrt.id_taksonomi
        left join mt_risk_dampak mrd on rp.id_dampak_inheren = mrd.id_dampak
        left join mt_risk_kemungkinan mrk on rp.id_kemungkinan_inheren = mrk.id_kemungkinan
        left join mt_risk_matrix mrm on rp.id_dampak_inheren = mrm.id_dampak and rp.id_kemungkinan_inheren = mrm.id_kemungkinan 
        left join mt_risk_tingkat mrtk on mrm.id_tingkat = mrtk.id_tingkat
        where rp.deleted_at is null 
        $where";

        $rows = DB::select($sql, $paramarr);

        $no = 0;
        foreach ($rows as &$r) {
            $no++;
            $r->no_risiko = $no;
            if (in_array("penyebab_nama", $params['header']) || in_array("mitigasi_nama", $params['header'])) {
                $r->penyebab = DB::select(
                    'select 
                    id_profile_penyebab,
                    no as no_penyebab,
                    nama as penyebab_nama
                    from risk_profile_penyebab 
                    where deleted_at is null 
                    and id_risk_profile = ?',
                    [$r->id_risk_profile]
                );
                $no_penyebab = 0;
                foreach ($r->penyebab as &$r2) {
                    $no_penyebab++;
                    $r2->no_penyebab = $no_penyebab;
                    if (in_array("mitigasi_nama", $params['header']) || in_array("realisasi_mitigasi_nama", $params['header'])) {
                        $r2->mitigasi = DB::select(
                            "select rpm.*, 
                            rpm.nama as mitigasi_nama,
                            rpm.output_perlakuan as mitigasi_output_perlakuan,
                            rpm.biaya as mitigasi_biaya,
                            mrp.nama as mitigasi_opsi,
                            rpm.output_perlakuan as mitigasi_output_perlakuan,
                            mrjpr.nama as mitigasi_jenis_program_rkap,
                            msj.nama as mitigasi_pic
                            from risk_profile_mitigasi rpm 
                            left join mt_risk_perlakuan mrp on rpm.id_perlakuan = mrp.id_perlakuan
                            left join mt_risk_jenis_program_rkap mrjpr on rpm.id_jenis_program_rkap = mrjpr.id_jenis_program_rkap
                            left join mt_sdm_jabatan msj on rpm.id_pic = msj.id_jabatan
                            where rpm.deleted_at is null 
                            and rpm.id_risk_profile = ? and rpm.id_profile_penyebab = ?",
                            [$r->id_risk_profile, $r2->id_profile_penyebab]
                        );
                        foreach ($r2->mitigasi as &$r3) {
                            $rows1 = DB::select("select mrjp.nama
                            from risk_profile_mitigasi_jenis rpmj 
                            left join mt_risk_jenis_perlakuan mrjp on rpmj.id_jenis_perlakuan = mrjp.id_jenis_perlakuan
                            where rpmj.id_mitigasi = ?", [$r3->id_mitigasi]);
                            $arr = [];
                            foreach ($rows1 as $r4) {
                                $arr[] = $r4->nama;
                            }
                            $r3->mitigasi_jenis = implode(", ", $arr);

                            if (
                                in_array("mitigasi_timeline1", $params['header']) ||
                                in_array("mitigasi_timeline4", $params['header']) ||
                                in_array("mitigasi_timeline7", $params['header']) ||
                                in_array("mitigasi_timeline10", $params['header'])
                            ) {
                                $rows1 = DB::select("select periode, is_proses
                                from risk_profile_mitigasi_timeline rpmt 
                                where rpmt.id_mitigasi = ?", [$r3->id_mitigasi]);
                                foreach ($rows1 as $r4) {
                                    $periode = (int)str_replace(date("Y", strtotime($r->tgl_risiko)), "", $r4->periode);
                                    $r3->{"mitigasi_timeline" . $periode} = $r4->is_proses;
                                }
                            }

                            if (
                                in_array("realisasi_timeline1", $params['header']) ||
                                in_array("realisasi_timeline4", $params['header']) ||
                                in_array("realisasi_timeline7", $params['header']) ||
                                in_array("realisasi_timeline10", $params['header'])
                            ) {
                                $rows1 = DB::select("select periode, is_proses
                                from risk_profile_mitigasi_timeline_realisasi rpmt 
                                where rpmt.id_mitigasi = ?", [$r3->id_mitigasi]);
                                foreach ($rows1 as $r4) {
                                    $periode = (int)str_replace(date("Y", strtotime($r->tgl_risiko)), "", $r4->periode);
                                    $r3->{"realisasi_timeline" . $periode} = $r4->is_proses;
                                }
                            }

                            if (
                                in_array("progress_perlakuan1", $params['header']) ||
                                in_array("progress_perlakuan2", $params['header']) ||
                                in_array("progress_perlakuan3", $params['header']) ||
                                in_array("progress_perlakuan4", $params['header'])
                            ) {
                                $rows1 = DB::select("select 
                                periode,
                                nama realisasi_mitigasi_nama, 
                                output_perlakuan realisasi_mitigasi_output_perlakuan, 
                                biaya realisasi_mitigasi_biaya, 
                                biaya/{$r3->biaya}*100 realisasi_mitigasi_serapan_biaya, 
                                msj.nama realisasi_mitigasi_pic,
                                msrp.nama realisasi_mitigasi_status_rencana_perlakuan, 
                                penjelasan_status_rencana_perlakuan realisasi_penjelasan_status_rencana_perlakuan
                                from risk_profile_mitigasi_realisasi rpmr 
                                left join mt_sdm_jabatan msj on rpmr.id_pic = msj.id_jabatan 
                                left join mt_status_rencana_perlakuan msrp on rpmr.id_status_rencana_perlakuan = msrp.id_status_rencana_perlakuan
                                where rpmr.id_mitigasi = ?", [$r3->id_mitigasi]);
                                foreach ($rows1 as $r4) {
                                    $r3->realisasi_mitigasi_nama = $r4->realisasi_mitigasi_nama;
                                    $r3->realisasi_mitigasi_output_perlakuan = $r4->realisasi_mitigasi_output_perlakuan;
                                    $r3->realisasi_mitigasi_biaya = $r4->realisasi_mitigasi_biaya;
                                    $r3->realisasi_mitigasi_serapan_biaya = $r4->realisasi_mitigasi_serapan_biaya;
                                    $r3->realisasi_mitigasi_pic = $r4->realisasi_mitigasi_pic;
                                    $r3->realisasi_mitigasi_status_rencana_perlakuan = $r4->realisasi_mitigasi_status_rencana_perlakuan;
                                    $r3->realisasi_penjelasan_status_rencana_perlakuan = $r4->realisasi_penjelasan_status_rencana_perlakuan;
                                    $periode = (int)str_replace(date("Y", strtotime($r->tgl_risiko)) . "q", "", $r4->periode);
                                    $r3->{"progress_perlakuan" . $periode} = $r4->is_proses;
                                }
                            }
                        }
                    }
                }
            }
            if (in_array("kri_nama", $params['header']) || in_array("kri_nama1", $params['header'])) {
                $r->kri = DB::select(
                    'select 
                    nama as kri_nama,
                    nama as kri_nama1,
                    satuan as kri_satuan,
                    aman as kri_aman,
                    bahaya as kri_bahaya,
                    hati_hati as kri_hati_hati
                    from risk_profile_kri 
                    where deleted_at is null 
                    and id_risk_profile = ?',
                    [$r->id_risk_profile]
                );
            }
            if (in_array("control_nama", $params['header'])) {
                $r->control = DB::select(
                    'select 
                    rpc.nama as control_nama, 
                    mrjc.nama as control_jenis,
                    mrec.nama as control_efektivitas
                    from risk_profile_control rpc 
                    left join mt_risk_jenis_control mrjc on rpc.id_jenis_control = mrjc.id_jenis_control
                    left join mt_risk_efektifitas_control mrec on rpc.id_efektifitas_control = mrec.id_efektifitas_control
                    where rpc.deleted_at is null 
                    and id_risk_profile = ?',
                    [$r->id_risk_profile]
                );
            }
            if (in_array("dampak_nama", $params['header'])) {
                $r->dampak = DB::select(
                    'select rpd.nama as dampak_nama,
                rpd.perkiraan_terpapar as dampak_perkiraan_terpapar
                from risk_profile_dampak  rpd
                where deleted_at is null 
                and id_risk_profile = ?',
                    [$r->id_risk_profile]
                );
            }

            if (
                in_array("res_nilai_dampakq1", $params['header']) ||
                in_array("res_nilai_dampakq2", $params['header']) ||
                in_array("res_nilai_dampakq3", $params['header']) ||
                in_array("res_nilai_dampakq4", $params['header'])
            ) {
                $rows1 = DB::select("select rptr.*, 
                mrd.nama as skala_dampak,
                mrk.nama as skala_probabilitas,
                coalesce(rptr.nilai_dampak,0)*coalesce(rptr.nilai_kemungkinan,0)/100 as eksposur_risiko,
                mrm.skala as skala_risiko,
                mrtk.nama as level_risiko
                from risk_profile_target_residual rptr 
                left join mt_risk_dampak mrd on rptr.id_dampak = mrd.id_dampak
                left join mt_risk_kemungkinan mrk on rptr.id_kemungkinan = mrk.id_kemungkinan
                left join mt_risk_matrix mrm on rptr.id_dampak = mrm.id_dampak and rptr.id_kemungkinan = mrm.id_kemungkinan 
                left join mt_risk_tingkat mrtk on mrm.id_tingkat = mrtk.id_tingkat
                where rptr.deleted_at is null 
                and rptr.id_risk_profile = ?", [$r->id_risk_profile]);
                foreach ($rows1 as $r1) {
                    $periode = str_replace(date("Y", strtotime($r->tgl_risiko)), "", $r1->periode);
                    $r->{"res_nilai_dampak" . $periode} = $r1->nilai_dampak;
                    $r->{"res_skala_dampak" . $periode} = $r1->skala_dampak;
                    $r->{"res_nilai_probabilitas" . $periode} = $r1->nilai_kemungkinan;
                    $r->{"res_skala_probabilitas" . $periode} = $r1->skala_probabilitas;
                    $r->{"res_eksposur_risiko" . $periode} = $r1->eksposur_risiko;
                    $r->{"res_skala_risiko" . $periode} = $r1->skala_risiko;
                    $r->{"res_level_risiko" . $periode} = $r1->level_risiko;
                }
            }



            if (
                in_array("real_nilai_dampakq1", $params['header']) ||
                in_array("real_nilai_dampakq2", $params['header']) ||
                in_array("real_nilai_dampakq3", $params['header']) ||
                in_array("real_nilai_dampakq4", $params['header'])
            ) {
                $rows1 = DB::select("select rrtr.*, 
                mrd.nama as skala_dampak,
                mrk.nama as skala_probabilitas,
                coalesce(rrtr.nilai_dampak,0)*coalesce(rrtr.nilai_kemungkinan,0)/100 as eksposur_risiko,
                mrm.skala as skala_risiko,
                mrtk.nama as level_risiko
                from risk_profile_realisasi_residual rrtr 
                left join mt_risk_dampak mrd on rrtr.id_dampak = mrd.id_dampak
                left join mt_risk_kemungkinan mrk on rrtr.id_kemungkinan = mrk.id_kemungkinan
                left join mt_risk_matrix mrm on rrtr.id_dampak = mrm.id_dampak and rrtr.id_kemungkinan = mrm.id_kemungkinan 
                left join mt_risk_tingkat mrtk on mrm.id_tingkat = mrtk.id_tingkat
                where rrtr.deleted_at is null 
                and rrtr.id_risk_profile = ?", [$r->id_risk_profile]);
                foreach ($rows1 as $r1) {
                    $periode = str_replace(date("Y", strtotime($r->tgl_risiko)), "", $r1->periode);
                    $r->{"real_nilai_dampak" . $periode} = $r1->nilai_dampak;
                    $r->{"real_skala_dampak" . $periode} = $r1->skala_dampak;
                    $r->{"real_nilai_probabilitas" . $periode} = $r1->nilai_kemungkinan;
                    $r->{"real_skala_probabilitas" . $periode} = $r1->skala_probabilitas;
                    $r->{"real_eksposur_risiko" . $periode} = $r1->eksposur_risiko;
                    $r->{"real_skala_risiko" . $periode} = $r1->skala_risiko;
                    $r->{"real_level_risiko" . $periode} = $r1->level_risiko;
                }
            }

            $r->dampak_kategori = ["0" => "Dampak Kualitatif", "1" => "Dampak Kuantitatif"][$r->is_kuantitatif];
        }

        return $rows;
    }

    public function matriks($params = [])
    {

        $params['header'] = explode(",", $params['header']);
        $paramarr = [];
        $where = "";
        if ($params['tahun'] && $params['tahun'] != 'null')
            $paramarr[] = $params['tahun'];
    }
}
