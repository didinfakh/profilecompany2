<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtRiskTaksonomiAreaAPIController
 */
class MtRiskTaksonomiAreaAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtRiskTaksonomiArea;
    }
}
