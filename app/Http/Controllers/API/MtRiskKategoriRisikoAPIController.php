<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtRiskKategoriRisikoAPIController
 */
class MtRiskKategoriRisikoAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtRiskKategoriRisiko;
    }
}
