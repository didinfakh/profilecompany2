<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class RiskProfileAPIController
 */
class RiskProfileAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskProfile;
    }
}
