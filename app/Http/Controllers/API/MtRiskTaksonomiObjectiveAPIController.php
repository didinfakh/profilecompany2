<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtRiskTaksonomiObjectiveAPIController
 */
class MtRiskTaksonomiObjectiveAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtRiskTaksonomiObjective;
    }
}
