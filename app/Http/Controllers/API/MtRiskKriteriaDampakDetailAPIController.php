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

        $updateData = $request->all();

        if (!$this->model->where([['id_kriteria_dampak','=', $id_kriteria],['id_dampak','=',$request->input('id_dampak')]])->get()) {
            return $this->respond($updateData,200,'not found');
        }

        // $data       = $request->getRawInput();		
        // $updateData = array_filter($data);
        $ret = $this->model->where([['id_kriteria_dampak','=', $id_kriteria],['id_dampak','=',$request->input('id_dampak')]])->update( $updateData);
        // if (!$ret) {
        //     return $this->fail($this->model->errors());
        // }
        return $this->respond($updateData, 200, 'data updated');
    }


}
