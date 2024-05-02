<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class RiskSasaranStrategiAPIController
 */
class RiskSasaranStrategiAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskSasaranStrategi;
    }
}
