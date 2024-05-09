<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class RiskProfileMitigasiJenisAPIController
 */
class RiskProfileMitigasiJenisAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskProfileMitigasiJenis;
    }
}
