<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtStatusPengajuanAPIController
 */
class MtStatusPengajuanAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtStatusPengajuan;
    }
}
