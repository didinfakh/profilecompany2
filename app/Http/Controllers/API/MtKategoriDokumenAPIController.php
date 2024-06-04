<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtKategoriDokumenAPIController
 */
class MtKategoriDokumenAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtKategoriDokumen;
    }
}
