<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtRiskEfektifitasControlAPIController
 */
class MtRiskEfektifitasControlAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtRiskEfektifitasControl;
    }
}
