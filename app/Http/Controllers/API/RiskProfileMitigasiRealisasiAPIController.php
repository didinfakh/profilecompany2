<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\RiskProfileResourceController;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

/**
 * Class RiskProfileMitigasiRealisasiAPIController
 */
class RiskProfileMitigasiRealisasiAPIController extends RiskProfileResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskProfileMitigasiRealisasi;
    }

    protected function _beforeDetailRisiko($id_risk_profile = null)
    {
        $rrm = new \App\Models\RiskProfile();
        $this->data['rowheader1'] = $rrm->find($id_risk_profile);
        $this->_beforeDetail($this->data['rowheader1']['id_register'], $id_risk_profile);
    }

    protected function _beforeDetail($id_register = null)
    {
        $rrm = new \App\Models\RiskRegister();
        $this->data['rowheader'] = $rrm->find($id_register);
    }

    public function show($id_risk_profile = null, $periode = null): JsonResponse
    {
        $record = [];

        $record["kri_kuantitatif"] = DB::select("select rpk.nama, 
        rpkh.periode, 
        rpkh.nilai, 
        rpkh.nilai_kualitatif, 
        rpk.id_kri,
        rpk.polaritas,
        rpkh.id_kri_hasil,
        rpkh.status,
        coalesce(rpkh.target_mulai, rpk.target_mulai) as target_mulai, 
        coalesce(rpkh.target_sampai, rpk.target_sampai) as target_sampai, 
        coalesce(rpkh.batas_atas, rpk.batas_atas) as batas_atas, 
        coalesce(rpkh.batas_bawah, rpk.batas_bawah) as batas_bawah, 
        coalesce(rpkh.aman, rpk.aman) as aman, 
        coalesce(rpkh.hati_hati, rpk.hati_hati) as hati_hati, 
        coalesce(rpkh.bahaya, rpk.bahaya) as bahaya
        from risk_profile_kri rpk
        left join risk_profile_kri_hasil rpkh on rpkh.id_kri = rpk.id_kri and rpkh.periode = ?
        where rpk.id_risk_profile = ? 
        and rpk.is_kuantitatif = 1
        and rpk.deleted_at is null", [$periode, $id_risk_profile]);

        $record["kri_kualitatif"] = DB::select("select rpk.nama, 
        rpkh.periode, 
        rpkh.nilai, 
        rpkh.nilai_kualitatif, 
        rpk.id_kri,
        rpk.polaritas,
        rpkh.id_kri_hasil,
        rpkh.status,
        coalesce(rpkh.target_mulai, rpk.target_mulai) as target_mulai, 
        coalesce(rpkh.target_sampai, rpk.target_sampai) as target_sampai, 
        coalesce(rpkh.batas_atas, rpk.batas_atas) as batas_atas, 
        coalesce(rpkh.batas_bawah, rpk.batas_bawah) as batas_bawah, 
        coalesce(rpkh.aman, rpk.aman) as aman, 
        coalesce(rpkh.hati_hati, rpk.hati_hati) as hati_hati, 
        coalesce(rpkh.bahaya, rpk.bahaya) as bahaya
        from risk_profile_kri rpk
        left join risk_profile_kri_hasil rpkh on rpkh.id_kri = rpk.id_kri and rpkh.periode = ?
        where rpk.id_risk_profile = ? 
        and rpk.is_kuantitatif = 0
        and rpk.deleted_at is null", [$periode, $id_risk_profile]);

        $record["mitigasi"] = DB::select("select coalesce(rpkh.nama, rpk.nama) as nama, 
        rpk.id_mitigasi,
        rpkh.periode, 
        rpkh.progress, 
        rpkh.biaya, 
        rpkh.id_mitigasi_realisasi,
        rpkh.is_ada_progress, 
        rpkh.id_status_rencana_perlakuan,
        rpkh.penjelasan_status_rencana_perlakuan,
        coalesce(rpkh.output_perlakuan, rpk.output_perlakuan) as output_perlakuan, 
        coalesce(rpkh.id_pic, rpk.id_pic) as id_pic,
        rpp.nama as penyebab
        from risk_profile_mitigasi rpk
        left join risk_profile_mitigasi_realisasi rpkh on rpkh.id_mitigasi = rpk.id_mitigasi and rpkh.periode = ?
        left join risk_profile_penyebab rpp on rpk.id_profile_penyebab = rpp.id_profile_penyebab
        where rpk.id_risk_profile = ? 
        and rpk.deleted_at is null", [$periode, $id_risk_profile]);

        return $this->respond($record);
    }

    public function update($id_risk_profile = null, $periode = null, Request $request): JsonResponse
    {
        $request->validate($this->model->rules);

        $this->_beforeDetailRisiko($id_risk_profile);

        $data = $request->all();
        $ret = $this->upsert($periode, $data);
        if ($ret)
            return $this->respond($data, 200, 'data updated');
        else
            return $this->fail("update failed");
    }

    protected function upsert($periode, &$data)
    {
        $data['id_risk_profile'] = $id_risk_profile = $this->data['rowheader1']['id_risk_profile'];

        $rskri = DB::select("select 
        rpk.id_kri,
        rpkh.id_kri_hasil
        from risk_profile_kri rpk
        left join risk_profile_kri_hasil rpkh on rpkh.id_kri = rpk.id_kri and rpkh.periode = ?
        where rpk.id_risk_profile = ? 
        and rpk.deleted_at is null", [$periode, $id_risk_profile]);

        $id_kriarr = [];
        foreach ($rskri as $r) {
            $id_kriarr[$r->id_kri] = $r->id_kri_hasil;
        }


        $rsmitigasi = DB::select("select 
        rpk.id_mitigasi,
        rpkh.id_mitigasi_realisasi
        from risk_profile_mitigasi rpk
        left join risk_profile_mitigasi_realisasi rpkh on rpkh.id_mitigasi = rpk.id_mitigasi and rpkh.periode = ?
        where rpk.id_risk_profile = ? 
        and rpk.deleted_at is null", [$periode, $id_risk_profile]);

        $id_mitigasiarr = [];
        foreach ($rsmitigasi as $r) {
            $id_mitigasiarr[$r->id_mitigasi] = $r->id_mitigasi_realisasi;
        }

        DB::beginTransaction();

        $ret = true;
        $krim = new \App\Models\RiskProfileKriHasil();
        $mitigasim = new \App\Models\RiskProfileMitigasiRealisasi();

        if ($ret) {
            foreach ($data["kri_kuantitatif"] as $j => $r) {

                if (!in_array($r["id_kri"],array_keys($id_kriarr)))
                    $ret = false;
                
                if (!$ret)
                    break;


                $id_kri_hasil = $id_kriarr[$r["id_kri"]];
                unset($r["nama"]);
                unset($r["polaritas"]);
                unset($r["id_kri_hasil"]);
                $rec = $r;
                $rec['periode'] = $periode;
                if ($id_kri_hasil)
                    $ret = $krim->update($id_kri_hasil, $rec);
                else
                    $ret = $id_kri_hasil = $krim->insert($rec);

                $rec["id_kri_hasil"] = $id_kri_hasil;
                $data["kri_kuantitatif"][$j] = $rec;
            }

            foreach ($data["kri_kualitatif"] as $j => $r) {

                if (!in_array($r["id_kri"],array_keys($id_kriarr)))
                    $ret = false;

                if (!$ret)
                    break;


                $id_kri_hasil = $id_kriarr[$r["id_kri"]];
                unset($r["nama"]);
                unset($r["polaritas"]);
                unset($r["id_kri_hasil"]);
                $rec = $r;
                $rec['periode'] = $periode;
                if ($id_kri_hasil)
                    $ret = $krim->update($id_kri_hasil, $rec);
                else
                    $ret = $id_kri_hasil = $krim->insert($rec);

                $rec["id_kri_hasil"] = $id_kri_hasil;
                $data["kri_kualitatif"][$j] = $rec;
            }


            foreach ($data["mitigasi"] as $j => $r) {

                if (!in_array($r["id_mitigasi"],array_keys($id_mitigasiarr)))
                    $ret = false;

                if (!$ret)
                    break;


                $id_mitigasi_realisasi = $id_mitigasiarr[$r["id_mitigasi"]];
                unset($r["nama"]);
                unset($r["penyebab"]);
                unset($r["id_mitigasi_realisasi"]);
                $rec = $r;
                $rec['periode'] = $periode;
                if ($id_mitigasi_realisasi)
                    $ret = $mitigasim->update($id_mitigasi_realisasi, $rec);
                else
                    $ret = $id_mitigasi_realisasi = $mitigasim->insert($rec);

                $rec["id_mitigasi_realisasi"] = $id_mitigasi_realisasi;
                $data["mitigasi"][$j] = $rec;
            }
        }

        if ($ret)
            DB::commit();
        else
            DB::rollBack();

        return $ret;
    }

}
