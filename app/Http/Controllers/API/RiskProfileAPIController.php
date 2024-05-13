<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\RiskProfileResourceController;
use Illuminate\Support\Facades\DB;

/**
 * Class RiskProfileAPIController
 */
class RiskProfileAPIController extends RiskProfileResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskProfile;
    }

    protected function _beforeDetail($id_register = null)
    {
        $rrm = new \App\Models\RiskRegister();
        $this->data['rowheader'] = $rrm->find($id_register);
    }

    public function store($id_register = null, Request $request): JsonResponse
    {
        $request->validate($this->model->rules);

        $this->_beforeDetail($id_register);

        $data = $request->all();
        $ret = $this->upsert(null, $data);
        if ($ret)
            return $this->respondCreated($data, 'data created');
        else
            return $this->fail("insert failed");
    }

    public function update($id_register = null, $id = null, Request $request): JsonResponse
    {
        $request->validate($this->model->rules);

        $this->_beforeDetail($id_register);

        if (!$this->model->where("id_register", $id_register)->find($id)) {
            return $this->failNotFound(sprintf(
                'item with id %d not found',
                $id
            ));
        }

        // $data       = $request->getRawInput();
        // $updateData = array_filter($data);
        $data = $request->all();
        $ret = $this->upsert($id, $data);
        if ($ret)
            return $this->respond($data, 200, 'data updated');
        else
            return $this->fail("update failed");
    }

    protected function upsert($id, &$data)
    {
        $data["id_register"] = $this->data['rowheader']['id_register'];

        $penyebabm = new \App\Models\RiskProfilePenyebab();
        $pm = new \App\Models\RiskPenyebab();
        $risikom = new \App\Models\RiskRisiko();
        $krim = new \App\Models\RiskProfileKri();
        $controlm = new \App\Models\RiskProfileControl();
        $dampakm = new \App\Models\RiskProfileDampak();
        $dm = new \App\Models\RiskDampak();

        DB::beginTransaction();

        $penyebab = $data['penyebab'];
        unset($data['penyebab']);
        $kri_kualitatif = $data['kri_kualitatif'];
        unset($data['kri_kualitatif']);
        $kri_kuantitatif = $data['kri_kuantitatif'];
        unset($data['kri_kuantitatif']);
        $control = $data['control'];
        unset($data['control']);
        $dampak = $data['dampak'];
        unset($data['dampak']);

        $ret = true;
        if (!$data['id_risiko']) {
            $r = [];
            $r["id_taksonomi"] = $data['id_taksonomi'];
            $r["id_jenis_risiko"] = $data['id_jenis_risiko'];
            $r["nama"] = $data['nama'];
            $r["status"] = 'Draft';
            $r["id_unit"] = $this->data['rowheader']['id_unit'];
            $data['id_risiko'] = $risikom->insert($r);
        }

        if ($ret) {
            if ($id) {
                $ret = $this->model->update($id, $data);
                $data[$this->model->primaryKey] = $id;
            } else {
                $ret = $id = $this->model->insert($data);
                $data[$this->model->primaryKey] = $id;
            }
        }

        $id_profile_penyebabarr = [];
        if ($penyebab)
            foreach ($penyebab as $p) {
                if (!$ret)
                    break;

                if (empty($p['id_penyebab'])) {
                    $rt = [];
                    $rt['id_risiko'] = $data['id_risiko'];
                    $rt['nama'] = $p['nama'];
                    $rt['id_unit'] = $this->data['rowheader']['id_unit'];
                    $rt['status'] = 'Draft';
                    $ret = $p['id_penyebab'] = $pm->insert($rt);
                }

                if ($ret) {
                    if (!empty($p['id_profile_penyebab']))
                        $ret = $penyebabm->update($p['id_profile_penyebab'], $p);
                    else {
                        $p["id_risk_profile"] = $id;
                        $p['id_profile_penyebab'] = $ret = $penyebabm->insert($p);
                    }

                    $id_profile_penyebabarr[] = $p['id_profile_penyebab'];
                }
            }


        if ($ret)
            $ret = $penyebabm->where("id_risk_profile", $id)->whereNotIn(
                "id_profile_penyebab",
                $id_profile_penyebabarr
            )->delete() !== false;

        $id_kriarr = [];
        if ($kri_kualitatif)
            foreach ($kri_kualitatif as $k) {
                if (!$ret)
                    break;

                $k['is_kuantitatif'] = 0;
                if (!empty($k['id_kri']))
                    $ret = $krim->update($k['id_kri'], $k);
                else {
                    $k["id_risk_profile"] = $id;
                    $k['id_kri'] = $ret = $krim->insert($k);
                }
                $id_kriarr[] = $k['id_kri'];
            }
        if ($kri_kuantitatif)
            foreach ($kri_kuantitatif as $k) {
                if (!$ret)
                    break;

                $k['is_kuantitatif'] = 1;
                if (!empty($k['id_kri']))
                    $ret = $krim->update($k['id_kri'], $k);
                else {
                    $k["id_risk_profile"] = $id;
                    $k['id_kri'] = $ret = $krim->insert($k);
                }
                $id_kriarr[] = $k['id_kri'];
            }

        if ($ret)
            $ret = $krim->where("id_risk_profile", $id)->whereNotIn(
                "id_kri",
                $id_kriarr
            )->delete() !== false;

        $id_controlarr = [];
        foreach ($control as $c) {
            if (!$ret)
                break;

            $c["id_risk_profile"] = $id;
            if (!empty($c['id_control']))
                $ret = $controlm->update($c['id_control'], $c);
            else {
                $c['id_control'] = $ret = $controlm->insert($c);
            }
            $id_controlarr[] = $c['id_control'];
        }

        if ($ret)
            $ret = $controlm->where("id_risk_profile", $id)->whereNotIn(
                "id_control",
                $id_controlarr
            )->delete() !== false;

        $id_profile_dampakarr = [];
        foreach ($dampak as $d) {
            if (!$ret)
                break;


            if (empty($d['id_dampak'])) {
                $rt = [];
                $rt['id_risiko'] = $data['id_risiko'];
                $rt['nama'] = $d['nama'];
                $rt['id_unit'] = $this->data['rowheader']['id_unit'];
                $rt['status'] = 'Draft';
                $ret = $d['id_dampak'] = $dm->insert($rt);
            }
            if ($ret) {
                $d["id_risk_profile"] = $id;
                if (!empty($d['id_profile_dampak']))
                    $ret = $dampakm->update($d['id_profile_dampak'], $d);
                else {
                    $d['id_profile_dampak'] = $ret = $dampakm->insert($d);
                }
                $id_profile_dampakarr[] = $d['id_profile_dampak'];
            }
        }

        if ($ret)
            $ret = $dampakm->where("id_risk_profile", $id)->whereNotIn(
                "id_profile_dampak",
                $id_profile_dampakarr
            )->delete() !== false;

        if ($ret)
            DB::commit();
        else
            DB::rollBack();

        return $ret;
    }

    public function show($id_register = null, $id = null): JsonResponse
    {
        $record = $this->model->where("id_register", $id_register)->find($id);
        if (!$record) {
            return $this->failNotFound(sprintf(
                'item with id %d not found',
                $id
            ));
        }

        $penyebabm = new \App\Models\RiskProfilePenyebab();
        $record['penyebab'] = $penyebabm->where('id_risk_profile', $id)->get();
        $krim = new \App\Models\RiskProfileKri();
        $record['kri_kuantitatif'] = $krim->where('id_risk_profile', $id)->where('is_kuantitatif', 1)->get();
        $record['kri_kualitatif'] = $krim->where('id_risk_profile', $id)->where('is_kuantitatif', 0)->get();
        $controlm = new \App\Models\RiskProfileControl();
        $record['control'] = $controlm->where('id_risk_profile', $id)->get();
        $dampakm = new \App\Models\RiskProfileDampak();
        $record['dampak'] = $dampakm->where('id_risk_profile', $id)->get();

        return $this->respond($record);
    }

    public function levelrisiko($id_register = null, $tahun = null, Request $request)
    {
        $risklimit = new \App\Models\RiskCapacityLimit();
        $riskmatrix = new \App\Models\MtRiskMatrix();
        $riskkemungkinan = new \App\Models\MtRiskKemungkinan();
        $riskdampak = new \App\Models\MtRiskDampak();

        $register = $risklimit->where("id_register", $id_register)->where("tahun", $tahun - 1)->get();
        $ret = [];
        $risk_limit = 0;
        if (isset($register[0])) {
            $register = $register[0];
            $risk_limit = $register->risk_limit;
        }
        
        $dampak = $riskdampak->get();
        foreach ($dampak as &$r) {
            $r->nilai_mulai = $r->mulai * $risk_limit;
            $r->nilai_sampai = $r->sampai * $risk_limit;
        }
        $ret["dampak"] = $dampak;

        $ret["kemungkinan"] = $riskkemungkinan->get();;
        $matrix = $riskmatrix->get();
        $rmatriks = [];
        foreach ($matrix as &$r1) {
            $rmatriks[$r1->id_kemungkinan][$r1->id_dampak] = $r1;
        }
        $ret["matrix"] = $rmatriks;

        return $ret;
    }

    public function matriks(Request $request)
    {
        // $data = $request->all();
        // $data = $this->model->matriks($data);
        $data = [];
        $data[] = [
            "id_register" => 1,
            "id_risk_profile" => 1,
            "nama" => "Pembengkakan HPP (Harga Pokok Penjualan)",
            "risk_owner" => "Divisi Sipil dan Umum",
            "inheren" => "<span style='color:red'>Ekstrem [5x5]</span>",
            "target_residual" => "<span style='color:yellow'>Moderat [5x1]</span>",
            "residual" => "<span style='color:yellow'>Moderat [5x1]</span>",
        ];
        $data[] = [
            "id_register" => 2,
            "id_risk_profile" => 2,
            "nama" => "Keterbatasan Pendanaan JTTS",
            "risk_owner" => "Divisi Corporate Planing",
            "inheren" => "<span style='color:red'>Ekstrem [5x4]</span>",
            "target_residual" => "<span style='color:orange'>Tinggi [5x3]</span>",
            "residual" => "<span style='color:orange'>Tinggi [5x3]</span>",
        ];
        return $this->respond($data);
    }
}
