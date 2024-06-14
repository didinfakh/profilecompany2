<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

/**
 * Class SysUserGroupAPIController
 */
class SysUserGroupAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\SysUserGroup;
    }

    public function update($id = null, Request $request): JsonResponse
    {
        $request->validate($this->model->rules);

        if (!$data_before = $this->model->find($id)) {
            return $this->failNotFound(sprintf(
                'item with id %d not found',
                $id
            ));
        }

        // $data       = $request->getRawInput();		
        // $updateData = array_filter($data);
        $updateData = $request->all();
        $ret = $this->model->update($id, $updateData, $data_before);
        // if (!$ret) {
        //     return $this->fail($this->model->errors());
        // }
        return $this->respond($updateData, 200, 'data updated');
    }


    public function destroy($id = null): JsonResponse
    {
        if (!$data = $model = $this->model->find($id)) {
            return $this->failNotFound(sprintf(
                'item with id %d not found',
                $id
            ));
        }

        $ret = $model->delete();
        if (!$ret) {
            return $this->failNotFound(sprintf(
                'item with id %d not found or already deleted',
                $id
            ));
        }

        $this->model->logging(
            array(
                "action" => "delete",
                "table_name" => $this->model->table,
                "activity" => "Menghapus data",
                "data" => $data->get()->toArray()[0]
            )
        );

        return $id;
    }

    
}
