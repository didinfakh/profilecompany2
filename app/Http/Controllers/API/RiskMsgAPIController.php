<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class RiskMsgAPIController
 */
class RiskMsgAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskMsg;
    }
}
