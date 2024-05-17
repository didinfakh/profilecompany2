<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtLostEventSumberPenyebabKejadianAPIController
 */
class MtLostEventSumberPenyebabKejadianAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtLostEventSumberPenyebabKejadian;
    }
}
