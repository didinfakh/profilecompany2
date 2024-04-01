<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\CreateSysMenuAPIRequest;
use App\Http\Requests\API\UpdateSysMenuAPIRequest;
use App\Models\SysMenu;
use App\Repositories\SysMenuRepository;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\BaseResourceController;

/**
 * Class SysMenuAPIController
 */
class SysMenuAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\SysMenu;
    }
}
