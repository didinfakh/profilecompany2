<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtRiskAgregasiRisikoSasaranAPIController
 */
class MtRiskAgregasiRisikoSasaranAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtRiskAgregasiRisikoSasaran;
    }
}
