<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\RiskProfileResourceController;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

/**
 * Class RiskProfileRealisasiResidualAPIController
 */
class RiskProfileRealisasiResidualAPIController extends RiskProfileResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskProfileRealisasiResidual;
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
        $record = $this->model->where("id_risk_profile", $id_risk_profile)->where("periode", $periode)->get();
        if (!$record) {
            return $this->failNotFound("item not found");
        }

        return $this->respond($record);
    }

    public function update($id_risk_profile = null, $periode = null, Request $request): JsonResponse
    {
        $request->validate($this->model->rules);

        $this->_beforeDetailRisiko($id_risk_profile);

        $row = $this->model->where("id_risk_profile", $id_risk_profile)->where("periode", $periode)->get();
        if (!isset($row[0]))
            $id = null;
        else
            $id = $row[0]['id_realisasi_residual'];

        $data = $request->all();
        $ret = $this->upsert($id, $data);
        if ($ret)
            return $this->respond($data, 200, 'data updated');
        else
            return $this->fail("update failed");
    }

    protected function upsert($id, &$data)
    {
        $data['id_risk_profile'] = $this->data['rowheader1']['id_risk_profile'];

        DB::beginTransaction();

        $ret = true;

        $data["status"] = "Draft";
        if ($ret) {
            if ($id) {
                $ret = $this->model->update($id, $data);
                $data[$this->model->primaryKey] = $id;
            } else {
                $ret = $id = $this->model->insert($data);
                $data[$this->model->primaryKey] = $id;
            }
        }

        if ($ret)
            $ret =  $this->_setStatus($this->data['rowheader1']['id_register']);

        if ($ret)
            DB::commit();
        else
            DB::rollBack();

        return $ret;
    }
}
