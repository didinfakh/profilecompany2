<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtLostEventKategoriAPIController
 */
class MtLostEventKategoriAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtLostEventKategori;
    }
}
