<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtRiskAgregasiRisikoAPIController
 */
class MtRiskAgregasiRisikoAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtRiskAgregasiRisiko;
    }
}
