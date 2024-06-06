<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
/**
 * Class SysLogAPIController
 */
class SysLogAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\SysLog;
    }

    public function store(Request $request): JsonResponse
    {
        $request->validate($this->model->rules);

        $data = $request->all();
        $data['ip'] = $_SERVER["REMOTE_ADDR"];
        $data['activity_time'] = date("Y-m-d H:i:s");
        $user_desc = (auth()->user() ? auth()->user()->name : null);
        $data['user_desc'] = $user_desc;

        $id = $this->model->insert($data);
        // if (!$id) {
        //     return $this->fail($this->model->errors());
        // }
        $data[$this->model->primaryKey] = $id;

        return $this->respondCreated($data, 'data created');
    }
}
