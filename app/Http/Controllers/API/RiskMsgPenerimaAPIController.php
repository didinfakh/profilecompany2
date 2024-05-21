<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class RiskMsgPenerimaAPIController
 */
class RiskMsgPenerimaAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskMsgPenerima;
    }
}
