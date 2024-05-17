<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\RiskProfileResourceController;

/**
 * Class LostEventAPIController
 */
class LostEventAPIController extends RiskProfileResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\LostEvent;
    }
}
