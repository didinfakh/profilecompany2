<?php

namespace App\Http\Controllers\API;

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
