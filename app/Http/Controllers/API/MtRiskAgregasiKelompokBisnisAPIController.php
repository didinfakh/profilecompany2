<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtRiskAgregasiKelompokBisnisAPIController
 */
class MtRiskAgregasiKelompokBisnisAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtRiskAgregasiKelompokBisnis;
    }
}
