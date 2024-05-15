<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;


/**
 * Class MtRiskMatrixAPIController
 */
class MtRiskMatrixAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtRiskMatrix;
    }

    public function update($id = null, Request $request): JsonResponse
    {

        $request->validate($this->model->rules);
        $updateData = $request->all();
        


        if (!$this->model->where([['id_dampak','=', $id],['id_kemungkinan','=',$request->input('id_kemungkinan')], ['jenis', '=', $request->input('jenis')]])->get()) {
            return $this->failNotFound(sprintf(
                'item with id %d not found',
                $id
            ));
        }

        // $data       = $request->getRawInput();		
        // $updateData = array_filter($data);
        // if(!$ret){
            $ret = $this->model->where([['id_dampak','=', $id],['id_kemungkinan','=',$request->input('id_kemungkinan')],['jenis', '=', $request->input('jenis')]])->update($updateData);
        // }
        // if (!$ret) {
        //     return $this->fail($this->model->errors());
        // }
        return $this->respond($updateData, 200, 'data updated');
    }
}
