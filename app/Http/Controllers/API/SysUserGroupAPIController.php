<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class SysUserGroupAPIController
 */
class SysUserGroupAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\SysUserGroup;
    }
}
