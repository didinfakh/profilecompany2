<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtSdmKelompokBisnis extends BaseModel
{
    public $table = 'mt_sdm_kelompok_bisnis';

    protected $primaryKey = 'id_kelompok_bisnis';

    public $fillable = [
        'nama',
        'created_by',
        'updated_by',
        'deleted_by',
        'created_by_desc',
        'updated_by_desc',
        'deleted_by_desc'
    ];

    protected $casts = [
        'nama' => 'string',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'nama' => 'nullable|string|max:200',
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

    public function mtRiskKriteriaDampaks(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\MtRiskKriteriaDampak::class, 'mt_risk_agregasi_risiko');
    }

    public function mtSdmUnits(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\MtSdmUnit::class, 'id_kelompok_bisnis');
    }

    public function riskRegisters(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskRegister::class, 'id_kelompok_bisnis');
    }
}
