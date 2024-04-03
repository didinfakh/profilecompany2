<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtRiskKriteriaDampakAPIController
 */
class MtRiskKriteriaDampakAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtRiskKriteriaDampak;
    }
}
