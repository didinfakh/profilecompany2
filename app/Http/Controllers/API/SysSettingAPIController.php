<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\CreateSysSettingAPIRequest;
use App\Http\Requests\API\UpdateSysSettingAPIRequest;
use App\Models\SysSetting;
use App\Repositories\SysSettingRepository;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\BaseResourceController;

/**
 * Class SysSettingAPIController
 */
class SysSettingAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\SysSetting;
    }
}
