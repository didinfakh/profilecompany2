<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\RiskProfileResourceController;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

/**
 * Class LostEventAPIController
 */
class LostEventAPIController extends RiskProfileResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\LostEvent;
    }

    public function store($id_register = null, Request $request): JsonResponse
    {
        $request->validate($this->model->rules);

        $this->_beforeDetail($id_register);

        $data = $request->all();
        $data['status'] = 'Draft';
        $ret = $this->upsert(null, $data);
        if ($ret)
            return $this->respondCreated($data, 'data created');
        else
            return $this->fail("insert failed");
    }
}
