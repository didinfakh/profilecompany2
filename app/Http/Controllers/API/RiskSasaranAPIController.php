<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\RiskProfileResourceController;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

/**
 * Class RiskSasaranAPIController
 */
class RiskSasaranAPIController extends RiskProfileResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskSasaran;
    }

    protected function upsert($id, &$data)
    {
        $data["id_register"] = $this->data['rowheader']['id_register'];

        $strategim = new \App\Models\RiskSasaranStrategi();

        DB::beginTransaction();

        $strategi = $data['strategi'];
        unset($data['strategi']);
        $ret = true;

        if ($ret) {
            if ($id) {
                $ret = $this->model->update($id, $data);
                $data[$this->model->primaryKey] = $id;
            } else {
                $data['is_accept'] = null;
                $ret = $id = $this->model->insert($data);
                $data[$this->model->primaryKey] = $id;
            }
        }

        $id_sasaran_strategiarr = [];
        if ($strategi) {
            foreach ($strategi as $p) {
                if (!$ret)
                    break;

                $p['id_sasaran'] = $data['id_sasaran'];

                if (!empty($p['id_sasaran_strategi']))
                    $ret = $strategim->update($p['id_sasaran_strategi'], $p);
                else {
                    $p['id_sasaran_strategi'] = $ret = $strategim->insert($p);
                }
                $id_sasaran_strategiarr[] = $p['id_sasaran_strategi'];
            }
        }
        if ($id_sasaran_strategiarr)
            $ret = $strategim->where("id_sasaran", $data['id_sasaran'])->whereNotIn("id_sasaran_strategi", $id_sasaran_strategiarr)->delete() !== false;

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

        $sasaranm = new \App\Models\RiskSasaranStrategi();
        $record['strategi'] = $sasaranm->where('id_sasaran', $id)->get();

        return $this->respond($record);
    }


    public function approve($id_register = null, $id = null, $jenis, Request $request): JsonResponse
    {

        $this->_beforeDetail($id_register);

        if (!$this->model->where("id_register", $id_register)->find($id)) {
            return $this->failNotFound(sprintf(
                'item with id %d not found',
                $id
            ));
        }

        $updateData = [];
        $updateData['is_accept'] = $jenis;
        $ret = $this->model->update($id, $updateData);

        if ($ret)
            return $this->respond($updateData, 200, 'data updated');
        else
            return $this->fail("update failed");
    }
}
