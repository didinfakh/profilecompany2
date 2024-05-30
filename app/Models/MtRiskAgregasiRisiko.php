<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskAgregasiRisiko extends BaseModel
{
    public $table = 'mt_risk_agregasi_risiko';

    protected $primaryKey = 'id_risk_agregasi_risiko';

    public $fillable = [
        'nama',
        'id_kelompok_bisnis',
        'id_kriteria_dampak',
        'keterangan',
        'jenis',
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
        'nama' => 'required|string|max:2000',
        'id_kelompok_bisnis' => 'required',
        'id_kriteria_dampak' => 'required',
        'jenis' => 'required',
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

    public function idKelompokBisnis(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtSdmKelompokBisni::class, 'id_kelompok_bisnis');
    }

    public function idKriteriaDampak(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskKriteriaDampak::class, 'id_kriteria_dampak');
    }

    public function riskProfiles(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskProfile::class, 'id_risk_agregasi_risiko');
    }
}
