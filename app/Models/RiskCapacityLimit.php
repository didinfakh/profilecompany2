<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskCapacityLimit extends BaseModel
{
    public $table = 'risk_capacity_limit';

    protected $primaryKey = 'id_capacity_limit';

    public $fillable = [
        'tahun',
        'id_unit',
        'kapasitas_risiko',
        'persentase_toleran',
        'ebitda',
        'risk_limit',
        'created_by',
        'modified_by',
        'created_by_desc',
        'modified_by_desc',
        'total_realisasi_eksposur_risiko_residual',
        'id_register',
        'deleted_by',
        'deleted_by_desc'
    ];

    protected $casts = [
        'id_unit' => 'string',
        'kapasitas_risiko' => 'decimal:2',
        'persentase_toleran' => 'decimal:2',
        'ebitda' => 'decimal:2',
        'risk_limit' => 'decimal:2',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string',
        'total_realisasi_eksposur_risiko_residual' => 'decimal:2',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'tahun' => 'required',
        'id_unit' => 'required|string|max:18',
        'kapasitas_risiko' => 'required|numeric',
        'persentase_toleran' => 'required|numeric',
        'ebitda' => 'required|numeric',
        'risk_limit' => 'required|numeric',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'modified_by' => 'nullable',
        'deleted_at' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'modified_by_desc' => 'nullable|string|max:200',
        'total_realisasi_eksposur_risiko_residual' => 'nullable|numeric',
        'id_register' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_by_desc' => 'nullable|string|max:200'
    ];

    public function idUnit(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtSdmUnit::class, 'id_unit');
    }

    public function idRegister(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskRegister::class, 'id_register');
    }
}
