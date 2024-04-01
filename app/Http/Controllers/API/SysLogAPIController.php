<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class SysLogAPIController
 */
class SysLogAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\SysLog;
    }
}
