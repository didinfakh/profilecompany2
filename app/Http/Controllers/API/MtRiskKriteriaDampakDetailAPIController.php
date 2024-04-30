<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

/**
 * Class MtRiskKriteriaDampakDetailAPIController
 */
class MtRiskKriteriaDampakDetailAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtRiskKriteriaDampakDetail;
    }

    public function update($id_kriteria = null, Request $request): JsonResponse
    {
        $request->validate($this->model->rules);

        if (!$this->model->find($id_kriteria)) {
            return $this->failNotFound(sprintf(
                'item with id %d not found',
                $id_kriteria
            ));
        }

        // $data       = $request->getRawInput();		
        // $updateData = array_filter($data);
        $updateData = $request->all();
        $ret = $this->model->where([['id_kriteria_dampak','=', $id_kriteria],['id_dampak','=',$request->input('id_dampak')]])->update( $updateData);
        // if (!$ret) {
        //     return $this->fail($this->model->errors());
        // }
        return $this->respond($updateData, 200, 'data updated');
    }
}
