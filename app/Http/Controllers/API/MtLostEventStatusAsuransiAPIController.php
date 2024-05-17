<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtLostEventStatusAsuransiAPIController
 */
class MtLostEventStatusAsuransiAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtLostEventStatusAsuransi;
    }
}
