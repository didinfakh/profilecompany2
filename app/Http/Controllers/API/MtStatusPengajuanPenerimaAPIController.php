<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtStatusPengajuanPenerimaAPIController
 */
class MtStatusPengajuanPenerimaAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtStatusPengajuanPenerima;
    }
}
