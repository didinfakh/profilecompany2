<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtRiskJenisProgramRkapAPIController
 */
class MtRiskJenisProgramRkapAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtRiskJenisProgramRkap;
    }
}
