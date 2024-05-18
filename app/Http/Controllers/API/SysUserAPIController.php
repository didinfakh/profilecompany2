<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class SysUserAPIController
 */
class SysUserAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\SysUser;
    }
}
