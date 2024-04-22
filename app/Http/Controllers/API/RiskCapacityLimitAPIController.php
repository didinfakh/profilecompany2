<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class RiskCapacityLimitAPIController
 */
class RiskCapacityLimitAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskCapacityLimit;
    }
}
