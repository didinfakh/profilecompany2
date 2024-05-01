<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskJenisRisiko extends BaseModel
{
    public $table = 'mt_risk_jenis_risiko';

    public $primaryKey = 'id_jenis_risiko';

    public $fillable = [
        'id_kategori_risiko',
        'kode',
        'nama',
        'created_by',
        'updated_by',
        'deleted_by',
        'created_by_desc',
        'updated_by_desc',
        'deleted_by_desc'
    ];

    protected $casts = [
        'kode' => 'string',
        'nama' => 'string',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'id_kategori_risiko' => 'nullable',
        'kode' => 'nullable|string|max:20',
        'nama' => 'nullable|string|max:2000',
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

    public function idKategoriRisiko(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskKategoriRisiko::class, 'id_kategori_risiko');
    }

    public function riskMetrikStrategiRisikos(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskMetrikStrategiRisiko::class, 'id_jenis_risiko');
    }

    public function mtRiskTaksonomis(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\MtRiskTaksonomi::class, 'risk_risiko');
    }

    public function riskProfiles(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskProfile::class, 'id_jenis_risiko');
    }
}
