<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtRiskKriteriaDampakDetailAPIController
 */
class MtRiskKriteriaDampakDetailAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtRiskKriteriaDampakDetail;
    }
}
