<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskProfileTargetResidual extends BaseModel
{
    public $table = 'risk_profile_target_residual';

    public $primaryKey = 'id_target_residual';

    public $fillable = [
        'id_risk_profile',
        'periode',
        'nilai_dampak',
        'id_dampak',
        'nilai_kemungkinan',
        'id_kemungkinan',
        'created_by',
        'updated_by',
        'deleted_by',
        'created_by_desc',
        'updated_by_desc',
        'deleted_by_desc'
    ];

    protected $casts = [
        'periode' => 'string',
        'nilai_dampak' => 'decimal:0',
        'nilai_kemungkinan' => 'decimal:2',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'id_risk_profile' => 'required',
        'periode' => 'nullable|string|max:20',
        'nilai_dampak' => 'nullable|numeric',
        'id_dampak' => 'nullable',
        'nilai_kemungkinan' => 'nullable|numeric',
        'id_kemungkinan' => 'nullable',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'updated_by' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_at' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'updated_by_desc' => 'nullable|string|max:200',
        'deleted_by_desc' => 'nullable|string|max:200'
    ];

    
}
