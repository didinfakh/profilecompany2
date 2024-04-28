<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\BaseResourceController;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

/**
 * Class RiskDampakAPIController
 */
class RiskDampakAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskDampak;
    }

    public function approve($id = null, Request $request): JsonResponse
    {
        if (!$this->model->find($id)) {
            return $this->failNotFound(sprintf(
                'item with id %d not found',
                $id
            ));
        }

        $updateData = [];
        $updateData['status'] = 'Aktif';
        $ret = $this->model->update($id, $updateData);

        return $this->respond($updateData, 200, 'data updated');
    }


    /**
     * Create a new resource object, from "posted" parameters
     *
     * @return array	an array
     */
    public function store(Request $request): JsonResponse
    {
        $request->validate($this->model->rules);

        $data = $request->all();
        $data['status'] = 'Draft';
        $id = $this->model->insert($data);
        // if (!$id) {
        //     return $this->fail($this->model->errors());
        // }
        $data[$this->model->primaryKey] = $id;

        return $this->respondCreated($data, 'data created');
    }
}
