<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskPenyebab extends BaseModel
{
    public $table = 'risk_penyebab';

    public $primaryKey = 'id_penyebab';

    public $fillable = [
        'id_risiko',
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
        'id_risiko' => 'nullable',
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

    public function idRisiko(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskRisiko::class, 'id_risiko');
    }

    public function idUnit(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtSdmUnit::class, 'id_unit');
    }

    public function riskProfiles(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\RiskProfile::class, 'risk_profile_penyebab');
    }
}
