<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class RiskDampakAPIController
 */
class RiskDampakAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskDampak;
    }
}
