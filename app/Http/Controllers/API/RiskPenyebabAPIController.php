<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class RiskPenyebabAPIController
 */
class RiskPenyebabAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskPenyebab;
    }
}
