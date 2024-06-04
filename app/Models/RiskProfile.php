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
        'tgl_risiko',
        'tgl_close',
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
        // $titleHeader = DB::table('mt_template_laporan')->get();

        // echo '<pre>';
        // var_dump($params);


        if (isset($params['id_assessment_type']) && $params["id_assessment_type"] != 'null') {
            $where .= " and rr.id_assessment_type = ?";
            $paramarr[] = $params['id_assessment_type'];
        }
        if (isset($params['id_kelompok_bisnis']) && $params["id_kelompok_bisnis"] != 'null') {
            $where .= " and rr.id_kelompok_bisnis = ?";
            $paramarr[] = $params['id_kelompok_bisnis'];
        }
        if (isset($params['id_unit']) && $params["id_unit"] != 'null') {
            $where .= " and rr.id_unit = ?";
            $paramarr[] = $params['id_unit'];
        }
        if ($params["id_register"] && $params["id_register"] != 'null') {
            $where .= " and rp.id_register = ?";
            $paramarr[] = $params['id_register'];
        }
        if ($params["tahun"]) {
            $where .= " and to_char(rp.tgl_risiko,'YYYY') = ?";
            $paramarr[] = $params['tahun'];
        }


        // DB::enableQueryLog();
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
        left join risk_register rr on rp.id_register = rr.id_register
        left join mt_risk_sasaran mts on rp.id_sasaran = mts.id_sasaran
        left join mt_risk_jenis_risiko mrjr on rp.id_jenis_risiko = mrjr.id_jenis_risiko
        left join mt_risk_taksonomi mrt on rp.id_taksonomi = mrt.id_taksonomi
        left join mt_risk_dampak mrd on rp.id_dampak_inheren = mrd.id_dampak
        left join mt_risk_kemungkinan mrk on rp.id_kemungkinan_inheren = mrk.id_kemungkinan
        left join mt_risk_matrix mrm on rp.id_dampak_inheren = mrm.id_dampak 
        and rp.id_kemungkinan_inheren = mrm.id_kemungkinan and mrm.jenis = rp.jenis
        left join mt_risk_tingkat mrtk on mrm.id_tingkat = mrtk.id_tingkat
        where rp.deleted_at is null 
        $where";

        $rows = DB::select($sql, $paramarr);

        // var_dump( DB::getQueryLog());

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
                and mrm.jenis = ?
                left join mt_risk_tingkat mrtk on mrm.id_tingkat = mrtk.id_tingkat
                where rptr.deleted_at is null 
                and rptr.id_risk_profile = ?", [$r->jenis, $r->id_risk_profile]);
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
                and mrm.jenis = ?
                left join mt_risk_tingkat mrtk on mrm.id_tingkat = mrtk.id_tingkat
                where rrtr.deleted_at is null 
                and rrtr.id_risk_profile = ?", [$r->jenis, $r->id_risk_profile]);
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

    public function top_risk($filter = [])
    {
        $where = '';
        $params = [];
        if (isset($filter['bulan']) && $filter['bulan'] != 'null' && isset($filter['tahun']) && $filter['tahun'] != 'null') {
            $periode_realisasi = $filter['tahun'] . $filter['bulan'];
            if ($filter['bulan'] <= 3) {
                $periode = 'q1';
            } elseif ($filter['bulan'] <= 6) {
                $periode = 'q2';
            } elseif ($filter['bulan'] <= 9) {
                $periode = 'q3';
            } elseif ($filter['bulan'] <= 12) {
                $periode = 'q4';
            }
            $periode_target = (string)$filter['tahun'] . $periode;
        }

        if (isset($filter['jenis']) && $filter['jenis'] != 'null') {
            $where .= ' and rp.jenis = ?';
            $params[] = $filter['jenis'];
        }

        if (isset($filter['id_register']) && $filter['id_register'] != 'null') {
            $where .= ' and rp.id_register = ?';
            $params[] = $filter['id_register'];
        }

        if (isset($filter['id_unit']) && $filter['id_unit'] != 'null') {
            $where .= ' and rr.id_unit = ?';
            $params[] = $filter['id_unit'];
        }


        if (isset($filter['id_assessment_type']) && $filter['id_assessment_type'] != 'null') {
            $where .= ' and rr.id_assessment_type = ?';
            $params[] = $filter['id_assessment_type'];
        }

        if (isset($filter['id_kelompok_bisnis']) && $filter['id_kelompok_bisnis'] != 'null') {
            $where .= ' and rr.id_kelompok_bisnis = ?';
            $params[] = $filter['id_kelompok_bisnis'];
        }

        if (isset($filter['id_jenis_risiko']) && $filter['id_jenis_risiko'] != 'null') {
            $where .= ' and rp.id_jenis_risiko = ? ';
            $params[] = $filter['id_jenis_risiko'];
        }

        if (isset($filter['is_kuantitatif']) && $filter['is_kuantitatif'] != 'null') {
            if ($filter['is_kuantitatif'] == '1') {
                $where .= ' and rp.is_kuantitatif = ? ';
                $params[] = $filter['is_kuantitatif'];
            } else {
                $where .= ' and (rp.is_kuantitatif is null or rp.is_kuantitatif = 0) ';
            }
        }

        if (isset($filter['urutan']) && $filter['urutan'] != 'null') {
            $order = $filter['urutan'];
        } else {
            $order = 'skala_inheren';
        }
        $params[] = $order;

        $id_tingkat_agregasi_risiko = null;
        if (isset($filter['id_tingkat_agregasi_risiko']) && $filter['id_tingkat_agregasi_risiko'] != 'null') {
            $id_tingkat_agregasi_risiko = $filter['id_tingkat_agregasi_risiko'];
        }

        if (isset($filter['top']) && $filter['top'] != 'null') {
            $limit = $filter['top'];
        } else {
            $limit = 10;
        }
        $params[] = $limit;


        $response = [];
        $sql = "
        select rp.nama,
        rp.jenis,
        msj.nama as risk_owner,
        mrm.skala as skala_inheren,
        mrm1.skala as skala_target,
        mrm2.skala as skala_realisasi,
        mrm.id_dampak as id_dampak_inheren,
        mrm.id_kemungkinan as id_kemungkinan_inheren,
        mrm1.id_dampak as id_dampak_target,
        mrm1.id_kemungkinan as id_kemungkinan_target,
        mrm2.id_dampak as id_dampak_realisasi,
        mrm2.id_kemungkinan as id_kemungkinan_realisasi,
        mrm.id_tingkat as id_tingkat_inheren,
        mrm1.id_tingkat as id_tingkat_target,
        mrm2.id_tingkat as id_tingkat_realisasi
        from risk_profile rp
        left join risk_register rr on rp.id_register = rr.id_register and rr.deleted_at is null
        left join mt_sdm_jabatan msj on rr.id_owner = msj.id_jabatan and msj.deleted_at is null
        left join risk_profile_target_residual rpts on rp.id_risk_profile = rpts.id_risk_profile
        and rpts.periode = " . DB::escape($periode_target) . "  and rpts.deleted_at is null
        left join risk_profile_realisasi_residual rprr on rp.id_risk_profile = rprr.id_risk_profile
        and rprr.periode = " . DB::escape($periode_realisasi) . " and rprr.deleted_at is null


        left join mt_risk_matrix mrm 
        on (case when is_kuantitatif = 1 then 
            level_dampak(rp.nilai_dampak_inheren,
                coalesce(rp.nilai_sasaran,
                    risk_limit(
                        rr.id_tingkat_agregasi_risiko,
                        coalesce(" . DB::escape($id_tingkat_agregasi_risiko) . ",rr.id_tingkat_agregasi_risiko), 
                        rr.id_unit, 
                        to_char(rp.tgl_risiko,'YYYY')::int,
                        rr.id_register
                    )
                )
            )
        else rp.id_dampak_inheren end) = mrm.id_dampak
        and rp.id_kemungkinan_inheren = mrm.id_kemungkinan 
        and rp.jenis = mrm.jenis 
        and mrm.deleted_at is null


        left join mt_risk_matrix mrm1 
        on (case when is_kuantitatif = 1 then 
            level_dampak(rpts.nilai_dampak, 
                coalesce(rp.nilai_sasaran,
			        risk_limit(
                        rr.id_tingkat_agregasi_risiko,
                        coalesce(" . DB::escape($id_tingkat_agregasi_risiko) . ",rr.id_tingkat_agregasi_risiko),
				        rr.id_unit,
				        to_char(rp.tgl_risiko,'YYYY')::int,
				        rr.id_register
                    )
                )
            ) else rpts.id_dampak end) = mrm1.id_dampak
        and rpts.id_kemungkinan = mrm1.id_kemungkinan 
        and rp.jenis = mrm1.jenis
        and mrm1.deleted_at is null


        left join mt_risk_matrix mrm2 
        on (case when is_kuantitatif = 1 then 
            level_dampak(rprr.nilai_dampak,
                coalesce(rp.nilai_sasaran,
                    risk_limit(rr.id_tingkat_agregasi_risiko,
                    coalesce(" . DB::escape($id_tingkat_agregasi_risiko) . ",rr.id_tingkat_agregasi_risiko),
                    rr.id_unit,
                    to_char(rp.tgl_risiko,'YYYY')::int,
                    rr.id_register
                )
            )
        ) else rprr.id_dampak end) = mrm2.id_dampak
        and rprr.id_kemungkinan = mrm2.id_kemungkinan 
        and rp.jenis = mrm2.jenis
        and mrm2.deleted_at is null

        where rp.deleted_at is null" . $where . " order by ? desc limit ?";

        $response = DB::select($sql, $params);


        return $response;
    }

    public function top_risk_agregasi($filter = [])
    {
        $where = '';
        $params = [];
        if (isset($filter['bulan']) && $filter['bulan'] != 'null' && isset($filter['tahun']) && $filter['tahun'] != 'null') {
            $periode_realisasi = $filter['tahun'] . $filter['bulan'];
            if ($filter['bulan'] <= 3) {
                $periode = 'q1';
            } elseif ($filter['bulan'] <= 6) {
                $periode = 'q2';
            } elseif ($filter['bulan'] <= 9) {
                $periode = 'q3';
            } elseif ($filter['bulan'] <= 12) {
                $periode = 'q4';
            }
            $periode_target = (string)$filter['tahun'] . $periode;
        }

        if (isset($filter['jenis']) && $filter['jenis'] != 'null') {
            $where .= ' and rp.jenis = ?';
            $params[] = $filter['jenis'];
        }

        if (isset($filter['id_register']) && $filter['id_register'] != 'null') {
            $where .= ' and rp.id_register = ?';
            $params[] = $filter['id_register'];
        }

        if (isset($filter['id_unit']) && $filter['id_unit'] != 'null') {
            $where .= ' and rr.id_unit = ?';
            $params[] = $filter['id_unit'];
        }

        if (isset($filter['id_kelompok_bisnis']) && $filter['id_kelompok_bisnis'] != 'null') {
            $where .= ' and rr.id_kelompok_bisnis = ?';
            $params[] = $filter['id_kelompok_bisnis'];
        }

        if (isset($filter['id_assessment_type']) && $filter['id_assessment_type'] != 'null') {
            $where .= ' and rr.id_assessment_type = ?';
            $params[] = $filter['id_assessment_type'];
        }

        if (isset($filter['id_jenis_risiko']) && $filter['id_jenis_risiko'] != 'null') {
            $where .= ' and rp.id_jenis_risiko = ? ';
            $params[] = $filter['id_jenis_risiko'];
        }

        if (isset($filter['is_kuantitatif']) && $filter['is_kuantitatif'] != 'null') {
            if ($filter['is_kuantitatif'] == '1') {
                $where .= ' and rp.is_kuantitatif = ? ';
                $params[] = $filter['is_kuantitatif'];
            } else {
                $where .= ' and (rp.is_kuantitatif is null or rp.is_kuantitatif = 1) ';
            }
        }

        if (isset($filter['urutan']) && $filter['urutan'] != 'null') {
            $order = $filter['urutan'];
        } else {
            $order = 'skala_inheren';
        }
        $params[] = $order;

        if (isset($filter['top']) && $filter['top'] != 'null') {
            $limit = $filter['top'];
        } else {
            $limit = 10;
        }
        $params[] = $limit;


        $response = [];
        $sql = "select
            a.*,
            mrm.id_tingkat as id_tingkat_inheren,
            mrm.skala as skala_inheren,
            mrmt.id_tingkat as id_tingkat_target,
            mrmt.skala as skala_target,
            mrmr.id_tingkat as id_tingkat_real,
            mrmr.skala as skala_real
        from
            (
                select
                id_kriteria_dampak,
                id_risk_agregasi_risiko,
                    a.jenis,
                    a.nama,
                    is_kuantitatif,
                    case
                        when is_kuantitatif = 0
                        or is_kuantitatif is null then a.id_dampak_kualitatif_inheren
                        else mrd.id_dampak
                    end as id_dampak_inheren,
                    case
                        when is_kuantitatif = 0
                        or is_kuantitatif is null then null
                        else a.nilai_dampak_inheren
                    end as nilai_dampak_inheren,
                    a.nilai_kemungkinan_inheren,
                    mrk.id_kemungkinan as id_kemungkinan_inheren,
                    case
                        when is_kuantitatif = 0
                        or is_kuantitatif is null then null
                        else a.nilai_eksposur_inheren
                    end as nilai_eksposur_inheren,
                    case
                        when is_kuantitatif = 0
                        or is_kuantitatif is null then a.id_dampak_kualitatif_target
                        else mrdt.id_dampak
                    end as id_dampak_target,
                    case
                        when is_kuantitatif = 0
                        or is_kuantitatif is null then null
                        else a.nilai_dampak_target
                    end as nilai_dampak_target,
                    a.nilai_kemungkinan_target,
                    mrkt.id_kemungkinan as id_kemungkinan_target,
                    case
                        when is_kuantitatif = 0
                        or is_kuantitatif is null then null
                        else a.nilai_eksposur_target
                    end as nilai_eksposur_target,
                    case
                        when is_kuantitatif = 0
                        or is_kuantitatif is null then a.id_dampak_kualitatif_real
                        else mrdr.id_dampak
                    end as id_dampak_real,
                    case
                        when is_kuantitatif = 0
                        or is_kuantitatif is null then null
                        else a.nilai_dampak_real
                    end as nilai_dampak_real,
                    a.nilai_kemungkinan_real,
                    mrkr.id_kemungkinan as id_kemungkinan_real,
                    case
                        when is_kuantitatif = 0
                        or is_kuantitatif is null then null
                        else a.nilai_eksposur_real
                    end as nilai_eksposur_real
                from
                    (
                        select
                            mra.nama,
                            rp.*,
                            mras.nilai_sasaran,
                            rp.nilai_dampak_inheren / mras.nilai_sasaran * 100 as persen_dampak_inheren,
                            rp.nilai_dampak_target / mras.nilai_sasaran * 100 as persen_dampak_target,
                            rp.nilai_dampak_real / mras.nilai_sasaran * 100 as persen_dampak_real
                        from
                            (
                                select
                                    rp.jenis,
                                    to_char(rp.tgl_risiko, 'YYYY')::int tahun,
                                    is_kuantitatif,
                                    rp.id_risk_agregasi_risiko,
                                rp.id_kriteria_dampak,
                                    sum(rp.nilai_dampak_inheren) as nilai_dampak_inheren,
                                    case
                                        when is_kuantitatif = 0
                                        or is_kuantitatif is null then avg(rp.nilai_kemungkinan)
                                        else round(
                                            sum(
                                                rp.nilai_dampak_inheren * rp.nilai_kemungkinan / 100
                                            ) / sum(rp.nilai_dampak_inheren) * 100
                                        )
                                    end as nilai_kemungkinan_inheren,
                                    sum(
                                        rp.nilai_dampak_inheren * rp.nilai_kemungkinan / 100
                                    ) as nilai_eksposur_inheren,
                                    floor(avg(rp.id_dampak_inheren)) as id_dampak_kualitatif_inheren,
                                    sum(rpts.nilai_dampak) as nilai_dampak_target,
                                    case
                                        when is_kuantitatif = 0
                                        or is_kuantitatif is null then avg(rpts.nilai_kemungkinan)
                                        else round(
                                            sum(rpts.nilai_dampak * rpts.nilai_kemungkinan / 100) / sum(rpts.nilai_dampak) * 100
                                        )
                                    end as nilai_kemungkinan_target,
                                    sum(rpts.nilai_dampak * rpts.nilai_kemungkinan / 100) as nilai_eksposur_target,
                                    floor(avg(rpts.id_dampak)) as id_dampak_kualitatif_target,
                                    sum(rprr.nilai_dampak) as nilai_dampak_real,
                                    case
                                        when is_kuantitatif = 0
                                        or is_kuantitatif is null then avg(rprr.nilai_kemungkinan)
                                        else round(
                                            sum(rprr.nilai_dampak * rprr.nilai_kemungkinan / 100) / sum(rpts.nilai_dampak) * 100
                                        )
                                    end as nilai_kemungkinan_real,
                                    sum(rprr.nilai_dampak * rprr.nilai_kemungkinan / 100) as nilai_eksposur_real,
                                    floor(avg(rprr.id_dampak)) as id_dampak_kualitatif_real
                                from
                                    risk_profile rp
                                    join risk_register rr on rp.id_risk_tegister = rr.id_risk_tegister and rr.deleted_at is null
                                    left join risk_profile_target_residual rpts on rp.id_risk_profile = rpts.id_risk_profile
                                    and rpts.periode = " . DB::escape($periode_target) . " and rpts.deleted_at is null
                                    left join risk_profile_realisasi_residual rprr on rp.id_risk_profile = rprr.id_risk_profile
                                    and rprr.periode = " . DB::escape($periode_realisasi) . " and rprr.deleted_at is null
                                    where 1=1 " . $where . "
                                group by
                                    jenis,
                                rp.id_kriteria_dampak,
                                    id_risk_agregasi_risiko,
                                    is_kuantitatif,
                                    to_char(rp.tgl_risiko, 'YYYY')
                            ) rp
                            join mt_risk_agregasi_risiko mra on rp.id_risk_agregasi_risiko = mra.id_risk_agregasi_risiko
                            left join mt_risk_agregasi_risiko_sasaran mras on mra.id_risk_agregasi_risiko = mras.id_risk_agregasi_risiko
                            and mras.tahun = rp.tahun
                    ) a
                    join mt_risk_dampak mrd on (
                        persen_dampak_inheren >= mrd.mulai
                        or mrd.id_dampak = 1
                    )
                    and (
                        persen_dampak_inheren < mrd.sampai
                        or mrd.id_dampak = 5
                    )
                    join mt_risk_kemungkinan mrk on (
                        nilai_kemungkinan_inheren >= mrk.persentase_mulai
                        or mrk.id_kemungkinan = 1
                    )
                    and (
                        nilai_kemungkinan_inheren < mrk.persentase_sampai
                        or mrk.id_kemungkinan = 5
                    )
                    join mt_risk_dampak mrdt on (
                        persen_dampak_target >= mrdt.mulai
                        or mrdt.id_dampak = 1
                    )
                    and (
                        persen_dampak_target < mrdt.sampai
                        or mrdt.id_dampak = 5
                    )
                    join mt_risk_kemungkinan mrkt on (
                        nilai_kemungkinan_target >= mrkt.persentase_mulai
                        or mrkt.id_kemungkinan = 1
                    )
                    and (
                        nilai_kemungkinan_target < mrkt.persentase_sampai
                        or mrkt.id_kemungkinan = 5
                    )
                    join mt_risk_dampak mrdr on (
                        persen_dampak_real >= mrdr.mulai
                        or mrdr.id_dampak = 1
                    )
                    and (
                        persen_dampak_real < mrdr.sampai
                        or mrdr.id_dampak = 5
                    )
                    join mt_risk_kemungkinan mrkr on (
                        nilai_kemungkinan_real >= mrkr.persentase_mulai
                        or mrkr.id_kemungkinan = 1
                    )
                    and (
                        nilai_kemungkinan_real < mrkr.persentase_sampai
                        or mrkr.id_kemungkinan = 5
                    )
            ) a
            join mt_risk_matrix mrm on a.id_dampak_inheren = mrm.id_dampak
            and a.id_kemungkinan_inheren = mrm.id_kemungkinan
            and a.jenis = mrm.jenis
            join mt_risk_matrix mrmt on a.id_dampak_target = mrmt.id_dampak
            and a.id_kemungkinan_target = mrmt.id_kemungkinan
            and a.jenis = mrmt.jenis
            join mt_risk_matrix mrmr on a.id_dampak_real = mrmr.id_dampak
            and a.id_kemungkinan_real = mrmr.id_kemungkinan
            and a.jenis = mrmr.jenis
        order by ? desc limit ?";

        $response = DB::select($sql, $params);

        return $response;
    }

    public function sebaran_risiko($filter = [])
    {

        $where = '';
        $periode1 = '';
        $periode2 = '';
        $params = [];
        if (isset($filter['bulan']) && $filter['bulan'] != 'null' && isset($filter['tahun']) && $filter['tahun'] != 'null') {
            if ($filter['bulan'] <= 3) {
                $periode = 'q1';
            } elseif ($filter['bulan'] <= 6) {
                $periode = 'q2';
            } elseif ($filter['bulan'] <= 9) {
                $periode = 'q3';
            } elseif ($filter['bulan'] <= 12) {
                $periode = 'q4';
            }
            $periode1 = (string)$filter['tahun'] . $periode;
            $periode2 = $filter['tahun'] . $filter['bulan'];

            $blnthn = $blnthn1 = $filter['tahun'] . $filter['bulan'];

            $where .= " and to_char(coalesce(rp.tgl_risiko,to_date(?,'YYYYMM')),'YYYYMM') <= ? and to_char(coalesce(rp.tgl_close,to_date(?,'YYYYMM')),'YYYYMM') >= ?";

            $params[] = $blnthn;
            $params[] = $blnthn;
            $params[] = $blnthn1;
            $params[] = $blnthn1;

            $where .= " and to_char(coalesce(rr.periode_mulai,to_date(?,'YYYYMM')),'YYYYMM') <= ? and to_char(coalesce(rr.periode_selesai,to_date(?,'YYYYMM')),'YYYYMM') >= ?";

            $params[] = $blnthn;
            $params[] = $blnthn;
            $params[] = $blnthn1;
            $params[] = $blnthn1;
        }

        if (isset($filter['jenis']) && $filter['jenis'] != 'null') {
            $where .= ' and rp.jenis = ?';
            $params[] = $filter['jenis'];
        }

        if (isset($filter['id_register']) && $filter['id_register'] != 'null') {
            $where .= ' and rp.id_register = ?';
            $params[] = $filter['id_register'];
        }

        if (isset($filter['id_unit']) && $filter['id_unit'] != 'null') {
            $where .= " and rr.id_unit = ?";
            $params[] = $filter['id_unit'];
        }

        $select = "mskb.nama as nama_kelompok_bisnis,";
        $group = "mskb.id_kelompok_bisnis,";
        if (isset($filter['id_kelompok_bisnis']) && $filter['id_kelompok_bisnis'] != 'null') {
            $where .= " and rr.id_kelompok_bisnis = ?";
            $params[] = $filter['id_kelompok_bisnis'];


            $select = "mrt.nama as nama_taksonomi,";
            $group = "mrt.id_taksonomi,";
        }

        if (isset($filter['id_assessment_type']) && $filter['id_assessment_type'] != 'null') {
            $where .= " and rr.id_assessment_type = ?";
            $params[] = $filter['id_assessment_type'];
        }

        $sql = "select 
        $select
        mrmi.id_tingkat id_tingkat_inheren, 
        mrmt.id_tingkat id_tingkat_target, 
        mrmr.id_tingkat id_tingkat_real, 
        count(mrmi.id_tingkat) tot_tingkat_inheren, 
        count(mrmt.id_tingkat) tot_tingkat_target, 
        count(mrmr.id_tingkat) tot_tingkat_real
        from
        risk_profile rp 
        join risk_register rr on rp.id_register = rr.id_register and rr.deleted_at is null
        left join risk_profile_target_residual rpts on rp.id_risk_profile = rpts.id_risk_profile
        and rpts.periode = " . DB::escape($periode1) . " and rpts.deleted_at is null
        left join risk_profile_realisasi_residual rprr on rp.id_risk_profile = rprr.id_risk_profile
        and rprr.periode = " . DB::escape($periode2) . " and rprr.deleted_at is null
        left join mt_risk_matrix mrmi on rp.id_dampak_inheren = mrmi.id_dampak 
        and rp.id_kemungkinan_inheren = mrmi.id_kemungkinan 
        and mrmi.deleted_at is null 
        and mrmi.jenis = rp.jenis
        left join mt_risk_matrix mrmt on rpts.id_dampak = mrmt.id_dampak 
        and rpts.id_kemungkinan = mrmt.id_kemungkinan
        and mrmt.deleted_at is null
        and mrmt.jenis = rp.jenis
        left join mt_risk_matrix mrmr on rprr.id_dampak = mrmr.id_dampak 
        and rpts.id_kemungkinan = mrmr.id_kemungkinan 
        and mrmr.deleted_at is null 
        and mrmr.jenis = rp.jenis
        left join mt_sdm_kelompok_bisnis mskb on rr.id_kelompok_bisnis = mskb.id_kelompok_bisnis and mskb.deleted_at is null
        left join mt_risk_taksonomi mrt on rp.id_taksonomi = mrt.id_taksonomi and mrt.deleted_at is null
        where 1=1 $where
        group by $group 
        mrmi.id_tingkat, 
        mrmt.id_tingkat, 
        mrmr.id_tingkat";
        // echo ($sql);
        // print_r($params);
        $rows = DB::select($sql, $params);

        return $rows;
    }

    public function progress_efektifitas($filter = [])
    {
        $where = '';
        $params = [];
        if (isset($filter['bulan']) && $filter['bulan'] != 'null' && isset($filter['tahun']) && $filter['tahun'] != 'null') {

            $blnthn = $blnthn1 = $filter['tahun'] . $filter['bulan'];

            $where .= " and rpma.periode <= ?";
            $params[] = $blnthn;

            $where .= " and to_char(coalesce(rp.tgl_risiko,to_date(?,'YYYYMM')),'YYYYMM') <= ? 
			and to_char(coalesce(rp.tgl_close,to_date(?,'YYYYMM')),'YYYYMM') >= ?";
            $params[] = $blnthn;
            $params[] = $blnthn;
            $params[] = $blnthn1;
            $params[] = $blnthn1;

            $where .= " and to_char(coalesce(rr.periode_mulai,to_date(?,'YYYYMM')),'YYYYMM') <= ? 
			and to_char(coalesce(rr.periode_selesai,to_date(?,'YYYYMM')),'YYYYMM') >= ?";
            $params[] = $blnthn;
            $params[] = $blnthn;
            $params[] = $blnthn1;
            $params[] = $blnthn1;
            // $params[] = $filter['tahun'] . $filter['bulan'];
        }

        if (isset($filter['jenis']) && $filter['jenis'] != 'null') {
            $where .= ' and rp.jenis = ?';
            $params[] = $filter['jenis'];
        }

        if (isset($filter['id_register']) && $filter['id_register'] != 'null') {
            $where .= ' and rp.id_register = ?';
            $params[] = $filter['id_register'];
        }

        if (isset($filter['id_unit']) && $filter['id_unit'] != 'null') {
            $where .= " and rr.id_unit = ?";
            $params[] = $filter['id_unit'];
        }

        if (isset($filter['id_kelompok_bisnis']) && $filter['id_kelompok_bisnis'] != 'null') {
            $where .= ' and rr.id_kelompok_bisnis = ?';
            $params[] = $filter['id_kelompok_bisnis'];
        }

        if (isset($filter['id_assessment_type']) && $filter['id_assessment_type'] != 'null') {
            $where .= ' and rr.id_assessment_type = ?';
            $params[] = $filter['id_assessment_type'];
        }

        $progress = DB::select("select avg(progress) as progress
        from (select 
        max(progress) as progress
        from risk_profile_mitigasi_realisasi rpma
        join risk_profile_mitigasi rpm on rpma.id_mitigasi = rpm.id_mitigasi and rpm.deleted_at is null
        join risk_profile rp on rpm.id_risk_profile = rp.id_risk_profile and rp.deleted_at is null
        join risk_register rr on rr.id_register = rp.id_register and rr.deleted_at is null
        where 1=1 
        $where 
        and rpma.deleted_at is null
        group by rpm.id_mitigasi)", $params)[0]->progress;


        $efektifitas = DB::select("select   
        count(case when efektifitas='Efektif' then 1 else null end) as efektif, 
        count(case when efektifitas='Efektif' then null else 1 end) as tidak_efektif 
        from (select 
        case when mrm.skala <= mrm1.skala then 'Efektif' else 'Tidak Efektif' end as efektifitas
        from risk_profile_target_residual rptr
        join risk_profile_realisasi_residual rprr on rptr.id_risk_profile = rprr.id_risk_profile 
        and substring(rptr.periode from 0 for 4)||((replace(rptr.periode,substring(rptr.periode from 0 for 4)||'q','')::int)*3)::text >= rprr.periode
        join risk_profile rp on rprr.id_risk_profile = rp.id_risk_profile and rp.deleted_at is null
        join risk_register rr on rr.id_register = rp.id_register and rr.deleted_at is null
        join mt_risk_matrix mrm on rptr.id_kemungkinan = mrm.id_kemungkinan 
        and rptr.id_dampak = mrm.id_dampak and mrm.deleted_at is null
        and mrm.jenis = rp.jenis
        join mt_risk_matrix mrm1 on rprr.id_kemungkinan = mrm1.id_kemungkinan 
        and rprr.id_dampak = mrm1.id_dampak and mrm1.deleted_at is null
        and mrm1.jenis = rp.jenis
        where 1=1 " . str_replace("rpma.", "rprr.", $where) . " 
        and rptr.deleted_at is null ) a", $params)[0];

        return ["progress" => $progress, "efektifitas" => $efektifitas];
    }


    public function kri($filter = [])
    {

        $where = '';
        $periode1 = '';
        $periode2 = '';
        $params = [];
        if (isset($filter['tahun']) && $filter['tahun'] != 'null') {
            if ($filter['tahun'] == date('Y')) {
                $filter['bulan'] = date("m");
            } else {
                $filter['bulan'] = 12;
            }
        }

        if (isset($filter['bulan']) && $filter['bulan'] != 'null' && isset($filter['tahun']) && $filter['tahun'] != 'null') {
            if ($filter['bulan'] <= 3) {
                $periode = 'q1';
            } elseif ($filter['bulan'] <= 6) {
                $periode = 'q2';
            } elseif ($filter['bulan'] <= 9) {
                $periode = 'q3';
            } elseif ($filter['bulan'] <= 12) {
                $periode = 'q4';
            }
            $periode1 = (string)$filter['tahun'] . $periode;
            $periode2 = $filter['tahun'] . $filter['bulan'];

            $blnthn = $blnthn1 = $filter['tahun'] . $filter['bulan'];

            $where .= " and to_char(coalesce(rp.tgl_risiko,to_date(?,'YYYYMM')),'YYYYMM') <= ? and to_char(coalesce(rp.tgl_close,to_date(?,'YYYYMM')),'YYYYMM') >= ?";

            $params[] = $blnthn;
            $params[] = $blnthn;
            $params[] = $blnthn1;
            $params[] = $blnthn1;

            $where .= " and to_char(coalesce(rr.periode_mulai,to_date(?,'YYYYMM')),'YYYYMM') <= ? and to_char(coalesce(rr.periode_selesai,to_date(?,'YYYYMM')),'YYYYMM') >= ?";

            $params[] = $blnthn;
            $params[] = $blnthn;
            $params[] = $blnthn1;
            $params[] = $blnthn1;
        }

        if (isset($filter['jenis']) && $filter['jenis'] != 'null') {
            $where .= ' and rp.jenis = ?';
            $params[] = $filter['jenis'];
        }

        if (isset($filter['id_register']) && $filter['id_register'] != 'null') {
            $where .= ' and rp.id_register = ?';
            $params[] = $filter['id_register'];
        }

        if (isset($filter['id_unit']) && $filter['id_unit'] != 'null') {
            $where .= " and rr.id_unit = ?";
            $params[] = $filter['id_unit'];
        }

        if (isset($filter['id_kelompok_bisnis']) && $filter['id_kelompok_bisnis'] != 'null') {
            $where .= " and rr.id_kelompok_bisnis = ?";
            $params[] = $filter['id_kelompok_bisnis'];
        }

        if (isset($filter['id_assessment_type']) && $filter['id_assessment_type'] != 'null') {
            $where .= " and rr.id_assessment_type = ?";
            $params[] = $filter['id_assessment_type'];
        }

        $sql = "select 
        rp.*,
        rpk.id_kri,
        rpk.nama as nama_kri,
        rpk.satuan,
        rpk.target_mulai,
        rpk.target_sampai,
        rpk.keterangan,
        rpk.polaritas,
        rpk.batas_bawah,
        rpk.batas_atas,
        rpk.is_kuantitatif,
        rpk.aman,
        rpk.hati_hati,
        rpk.bahaya,
        mrmi.id_tingkat id_tingkat_inheren, 
        mrmt.id_tingkat id_tingkat_target, 
        mrmr.id_tingkat id_tingkat_real
        from
        risk_profile rp 
        join risk_register rr on rp.id_register = rr.id_register and rr.deleted_at is null
        left join risk_profile_target_residual rpts on rp.id_risk_profile = rpts.id_risk_profile
        and rpts.periode = " . DB::escape($periode1) . " and rpts.deleted_at is null
        left join risk_profile_realisasi_residual rprr on rp.id_risk_profile = rprr.id_risk_profile
        and rprr.periode = " . DB::escape($periode2) . " and rprr.deleted_at is null
        left join mt_risk_matrix mrmi on rp.id_dampak_inheren = mrmi.id_dampak 
        and rp.id_kemungkinan_inheren = mrmi.id_kemungkinan 
        and mrmi.deleted_at is null 
        and mrmi.jenis = rp.jenis
        left join mt_risk_matrix mrmt on rpts.id_dampak = mrmt.id_dampak 
        and rpts.id_kemungkinan = mrmt.id_kemungkinan
        and mrmt.deleted_at is null
        and mrmt.jenis = rp.jenis
        left join mt_risk_matrix mrmr on rprr.id_dampak = mrmr.id_dampak 
        and rpts.id_kemungkinan = mrmr.id_kemungkinan 
        and mrmr.deleted_at is null 
        and mrmr.jenis = rp.jenis
        left join mt_sdm_kelompok_bisnis mskb on rr.id_kelompok_bisnis = mskb.id_kelompok_bisnis and mskb.deleted_at is null
        left join mt_risk_taksonomi mrt on rp.id_taksonomi = mrt.id_taksonomi and mrt.deleted_at is null 
        left join risk_profile_kri rpk on rp.id_risk_profile = rpk.id_risk_profile and rpk.deleted_at is null
        where 1=1 $where";

        $rows = DB::select($sql, $params);

        foreach ($rows as &$r) {
            $r->realisasi_kri = DB::select("select * from risk_profile_kri_hasil where deleted_at is null and id_kri = ?", [$r->id_kri]);
        }
        return $rows;
    }
}
