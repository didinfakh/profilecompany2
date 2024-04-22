<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\RiskProfileResourceController;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

/**
 * Class RiskProfileAPIController
 */
class RiskProfileAPIController extends RiskProfileResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskProfile;
    }
}
