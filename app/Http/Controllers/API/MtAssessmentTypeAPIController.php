<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\BaseResourceController;

/**
 * Class MtAssessmentTypeAPIController
 */
class MtAssessmentTypeAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtAssessmentType;
    }
}
