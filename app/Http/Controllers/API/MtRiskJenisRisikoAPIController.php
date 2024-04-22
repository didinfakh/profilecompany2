<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtRiskJenisRisikoAPIController
 */
class MtRiskJenisRisikoAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtRiskJenisRisiko;
    }
}
