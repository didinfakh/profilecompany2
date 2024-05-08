<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtRiskJenisPerlakuanAPIController
 */
class MtRiskJenisPerlakuanAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtRiskJenisPerlakuan;
    }
}
