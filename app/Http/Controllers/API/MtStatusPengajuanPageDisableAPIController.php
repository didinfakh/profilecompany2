<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtStatusPengajuanPageDisableAPIController
 */
class MtStatusPengajuanPageDisableAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtStatusPengajuanPageDisable;
    }
}
