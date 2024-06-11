<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\RiskProfileResourceController;

/**
 * Class InternalControlTestingAPIController
 */
class InternalControlTestingAPIController extends RiskProfileResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\InternalControlTesting;
    }
}
