<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

use App\Http\Controllers\BaseResourceController;

/**
 * Class RiskRegisterAPIController
 */
class RiskRegisterAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskRegister;
    }

    public function tree(): JsonResponse
    {
        $rows = $this->model->get();
        $data = $this->GenerateTreeEasyUi(
            $rows,
            "id_parent_register",
            "id_register",
            "nama"
        );
        return $this->respond($data);
    }
}
