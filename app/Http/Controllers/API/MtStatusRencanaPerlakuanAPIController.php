<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtStatusRencanaPerlakuanAPIController
 */
class MtStatusRencanaPerlakuanAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtStatusRencanaPerlakuan;
    }
}
