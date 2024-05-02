<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskTingkatAgregasiRisiko extends BaseModel
{
    public $table = 'mt_risk_tingkat_agregasi_risiko';

    protected $primaryKey = 'id_tingkat_agregasi_risiko';

    public $fillable = [
        'nama',
        'created_by_desc',
        'updated_by_desc',
        'deleted_by_desc',
        'created_by',
        'updated_by',
        'deleted_by',
        'id_tingkat_agregasi_risiko_parent'
    ];

    protected $casts = [
        'nama' => 'string',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'nama' => 'required|string|max:100',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'deleted_at' => 'nullable',
        'created_by_desc' => 'nullable|string|max:50',
        'updated_by_desc' => 'nullable|string|max:50',
        'deleted_by_desc' => 'nullable|string|max:50',
        'created_by' => 'nullable',
        'updated_by' => 'nullable',
        'deleted_by' => 'nullable',
        'id_tingkat_agregasi_risiko_parent' => 'nullable'
    ];

    public function riskRegisters(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskRegister::class, 'id_tingkat_agregasi_risiko');
    }
}
