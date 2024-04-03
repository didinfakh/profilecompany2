<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtSdmJabatanAPIController
 */
class MtSdmJabatanAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtSdmJabatan;
    }
}
