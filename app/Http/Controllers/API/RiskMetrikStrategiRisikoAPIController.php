<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class RiskMetrikStrategiRisikoAPIController
 */
class RiskMetrikStrategiRisikoAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskMetrikStrategiRisiko;
    }
}
