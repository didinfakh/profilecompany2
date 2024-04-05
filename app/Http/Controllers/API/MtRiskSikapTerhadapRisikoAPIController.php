<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtRiskSikapTerhadapRisikoAPIController
 */
class MtRiskSikapTerhadapRisikoAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtRiskSikapTerhadapRisiko;
    }
}
