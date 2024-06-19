<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\RiskProfileResourceController;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

/**
 * Class RiskProfileTargetResidualAPIController
 */
class RiskProfileTargetResidualAPIController extends RiskProfileResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskProfileTargetResidual;
    }

    /**
     * Return the properties of a resource object
     *
     * @return array	an array
     */

    protected function _beforeDetailRisiko($id_register = null, $id_risk_profile = null)
    {
        $this->_beforeDetail($id_register, $id_risk_profile);
        $rrm = new \App\Models\RiskProfile();
        $this->data['rowheader1'] = $rrm->where("id_register", $id_register)->find($id_risk_profile);
    }

    protected function _beforeDetail($id_register = null)
    {
        $rrm = new \App\Models\RiskRegister();
        $this->data['rowheader'] = $rrm->find($id_register);
    }

    public function show($id_register = null, $id_risk_profile = null): JsonResponse
    {
        $this->_beforeDetailRisiko($id_register, $id_risk_profile);
        $rows = $this->model->where("id_risk_profile", $id_risk_profile)->whereNotNull("periode")->get();
        if (!$rows) {
            return $this->failNotFound("item not found");
        }

        $record = [];
        foreach ($rows as $r) {
            $record["nilai_dampak"][$r->periode] = $r->nilai_dampak;
            $record["id_dampak"][$r->periode] = $r->id_dampak;
            $record["nilai_kemungkinan"][$r->periode] = $r->nilai_kemungkinan;
            $record["id_kemungkinan"][$r->periode] = $r->id_kemungkinan;
            $record["id_target_residual"][$r->periode] = $r->id_target_residual;
        }

        if (count($rows) == 0) {
            $qarr = ["q1", "q2", "q3", "q4"];
            $rowrisiko = $this->data['rowheader1'];
            foreach ($qarr as $p) {
                $periode = explode("-", $rowrisiko->tgl_risiko)[0] . $p;
                $record["nilai_dampak"][$periode] = $rowrisiko->nilai_dampak_inheren;
                $record["id_dampak"][$periode] = $rowrisiko->id_dampak_inheren;
                $record["nilai_kemungkinan"][$periode] = $rowrisiko->nilai_kemungkinan;
                $record["id_kemungkinan"][$periode] = $rowrisiko->id_kemungkinan_inheren;
            }
        }

        return $this->respond($record);
    }

    public function update($id_register = null, $id_risk_profile = null, Request $request): JsonResponse
    {
        // $request->validate($this->model->rules);

        $this->_beforeDetailRisiko($id_register, $id_risk_profile);

        if (!$this->data['rowheader'] || !$this->data['rowheader1']) {
            return $this->failNotFound('item with id %d not found');
        }
        if(!empty($request->get('page_name')) && $request->get('page_name') == 'risk_profile_analisa_risiko_residual'){
            $request->request->remove('page_name');
            $request->validate(['nilai_dampak' => 'required|array',
        'nilai_dampak.*' => 'required','id_dampak' => 'required|array','id_dampak.*' => 'required','id_kemungkinan' => 'required','id_kemungkinan.*' => 'required', 'nilai_kemungkinan' => 'required', 'nilai_kemungkinan.*' => 'required']);
        }
        $data = $request->all();
        $datat = [];
        $datat["nilai_dampak"] = $data["nilai_dampak"];
        $datat["id_dampak"] = $data["id_dampak"];
        $datat["nilai_kemungkinan"] = $data["nilai_kemungkinan"];
        $datat["id_kemungkinan"] = $data["id_kemungkinan"];

        $ret = $this->upsert($id_risk_profile, $datat);
        if ($ret)
            return $this->respond($datat, 200, 'data updated');
        else
            return $this->fail("update failed");
    }

    protected function upsert($id_risk_profile, &$data)
    {
        DB::beginTransaction();

        $ret = true;
        if ($ret) {
            $idperiodearr = [];
            foreach ($data as $k => $rws) {
                foreach ((array)$rws as $periode => $v) {
                    if (!$periode)
                        continue;

                    if (!isset($idperiodearr[$periode])) {
                        $rt = $this->model->where("id_risk_profile", $id_risk_profile)->where("periode", $periode)->get();

                        if (isset($rt[0]))
                            $id = $rt[0]->id_target_residual;
                        else
                            $id = null;
                        $idperiodearr[$periode] = $id;
                    } else {
                        $id = $idperiodearr[$periode];
                    }
                    $rec = [$k => $v, "periode" => $periode, "id_risk_profile" => $id_risk_profile];
                    if ($id) {
                        $ret = $this->model->update($id, $rec);
                        $data[$k] = (array)$data[$k];
                        $data["id_target_residual"][$periode] = $id;
                    } else {
                        $ret = $id = $this->model->insert($rec);
                        $idperiodearr[$periode] = $id;
                        $data[$k] = (array)$data[$k];
                        $data["id_target_residual"][$periode] = $id;
                    }
                }
            }
        }

        if ($ret)
            DB::commit();
        else
            DB::rollBack();

        return $ret;
    }
}
