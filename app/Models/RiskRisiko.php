<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskRisiko extends BaseModel
{
    public $table = 'risk_risiko';

    public $primaryKey = 'id_risiko';

    public $fillable = [
        'id_taksonomi',
        'id_jenis_risiko',
        'nama',
        'created_by',
        'updated_by',
        'deleted_by',
        'created_by_desc',
        'updated_by_desc',
        'deleted_by_desc',
        'catatan',
        'status',
        'id_unit'
    ];

    protected $casts = [
        'nama' => 'string',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string',
        'catatan' => 'string',
        'status' => 'string',
        'id_unit' => 'string'
    ];

    public array $rules = [
        'id_taksonomi' => 'nullable',
        'id_jenis_risiko' => 'nullable',
        'nama' => 'nullable|string|max:1000',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'updated_by' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_at' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'updated_by_desc' => 'nullable|string|max:200',
        'deleted_by_desc' => 'nullable|string|max:200',
        'catatan' => 'nullable|string',
        'status' => 'nullable|string|max:50',
        'id_unit' => 'nullable|string|max:18'
    ];

    public function idTaksonomi(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskTaksonomi::class, 'id_taksonomi');
    }

    public function idJenisRisiko(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskJenisRisiko::class, 'id_jenis_risiko');
    }

    public function idUnit(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtSdmUnit::class, 'id_unit');
    }

    public function riskPenyebabs(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskPenyebab::class, 'id_risiko');
    }

    public function riskProfiles(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskProfile::class, 'id_risiko');
    }

    public function riskDampaks(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskDampak::class, 'id_risiko');
    }
}
