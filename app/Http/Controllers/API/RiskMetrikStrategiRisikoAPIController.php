<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\RiskProfileResourceController;

/**
 * Class RiskMetrikStrategiRisikoAPIController
 */
class RiskMetrikStrategiRisikoAPIController extends RiskProfileResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskMetrikStrategiRisiko;
    }
}
