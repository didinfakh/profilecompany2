<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class RiskSasaranAPIController
 */
class RiskSasaranAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskSasaran;
    }
}
