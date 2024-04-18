<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtRiskTingkatAgregasiRisikoAPIController
 */
class MtRiskTingkatAgregasiRisikoAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtRiskTingkatAgregasiRisiko;
    }
}
