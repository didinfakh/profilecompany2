<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskProfileRealisasiResidual extends BaseModel
{
    public $table = 'risk_profile_realisasi_residual';

    public $primaryKey = 'id_realisasi_residual';

    public $fillable = [
        'id_risk_profile',
        'status',
        'periode',
        'penjelasan_dampak',
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
        'penjelasan_dampak' => 'string',
        'nilai_dampak' => 'decimal:0',
        'nilai_kemungkinan' => 'decimal:2',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'periode' => 'required|string|max:20',
        'penjelasan_dampak' => 'required|string|max:2000',
        'nilai_dampak' => 'required|numeric',
        'id_dampak' => 'required',
        'nilai_kemungkinan' => 'required|numeric',
        'id_kemungkinan' => 'required',
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
