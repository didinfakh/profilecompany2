<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtJenisDataAPIController
 */
class MtJenisDataAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtJenisData;
    }
}
