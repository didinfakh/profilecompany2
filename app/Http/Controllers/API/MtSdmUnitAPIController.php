<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtSdmUnitAPIController
 */
class MtSdmUnitAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtSdmUnit;
    }
}
