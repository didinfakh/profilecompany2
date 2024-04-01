<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\CreateSysGroupAPIRequest;
use App\Http\Requests\API\UpdateSysGroupAPIRequest;
use App\Models\SysGroup;
use App\Repositories\SysGroupRepository;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\BaseResourceController;

/**
 * Class SysGroupAPIController
 */
class SysGroupAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\SysGroup;
    }
}
