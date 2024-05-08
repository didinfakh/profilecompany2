<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class RiskProfileMitigasiTimelineAPIController
 */
class RiskProfileMitigasiTimelineAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskProfileMitigasiTimeline;
    }
}
