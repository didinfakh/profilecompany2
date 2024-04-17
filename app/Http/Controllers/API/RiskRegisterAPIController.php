<?php

namespace App\Http\Controllers\API;
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
}
