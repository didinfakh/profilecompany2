<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class InternalControlTestingAPIController
 */
class InternalControlTestingAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\InternalControlTesting;
    }
}
