<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtSdmKelompokBisnisAPIController
 */
class MtSdmKelompokBisnisAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtSdmKelompokBisnis;
    }
}
