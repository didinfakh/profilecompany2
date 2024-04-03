<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtSdmPegawaiAPIController
 */
class MtSdmPegawaiAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtSdmPegawai;
    }
}
