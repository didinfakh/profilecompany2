<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtRiskPerlakuanAPIController
 */
class MtRiskPerlakuanAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtRiskPerlakuan;
    }
}
