<?php

namespace App\Http\Controllers\API;


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
