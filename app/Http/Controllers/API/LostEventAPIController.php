<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class LostEventAPIController
 */
class LostEventAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\LostEvent;
    }
}
