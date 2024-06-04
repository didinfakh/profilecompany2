<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

/**
 * Class SysUserAPIController
 */
class SysUserAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\SysUserModel;
    }

    public function store(Request $request): JsonResponse
    {
        $request->validate($this->model->rules);

        $data = $request->all();
        $data['password'] = Hash::make($request->password);
        $id = $this->model->insert($data);
        // if (!$id) {
        //     return $this->fail($this->model->errors());
        // }
        $data['id_user'] = $id;

        return $this->respondCreated($data, 'data created');
    }
    public function show($id = null): JsonResponse
    {
        $record = $this->model->find($id);
        $record['password'] = '';
        if (!$record) {
            return $this->failNotFound(sprintf(
                'item with id %d not found',
                $id
            ));
        }

        return $this->respond($record);
    }

    public function update($id = null, Request $request): JsonResponse
    {

        $this->model->rules['password'] = 'string|max:255';
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
        if($request->password){
        $updateData['password'] = Hash::make($request->password);}

        $ret = $this->model->update($id, $updateData, $data_before);
        // if (!$ret) {
        //     return $this->fail($this->model->errors());
        // }
        $updateData['id_user'] = $id;
        return $this->respond($updateData, 200, 'data updated');
    }
}
