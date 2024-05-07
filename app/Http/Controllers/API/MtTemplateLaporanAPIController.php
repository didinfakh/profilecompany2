<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

/**
 * Class MtTemplateLaporanAPIController
 */
class MtTemplateLaporanAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtTemplateLaporan;
    }
}
