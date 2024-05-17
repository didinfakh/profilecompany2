<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtLostEventFrakuensiKejadianAPIController
 */
class MtLostEventFrakuensiKejadianAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtLostEventFrakuensiKejadian;
    }
}
