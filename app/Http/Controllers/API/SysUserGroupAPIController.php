<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

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
