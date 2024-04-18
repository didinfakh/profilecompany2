<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskRisiko extends BaseModel
{
    public $table = 'risk_risiko';

    protected $primaryKey = 'id_risiko';

    public $fillable = [
        'id_taksonomi',
        'id_taksonomi_area',
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
        'id_taksonomi' => 'nullable',
        'id_taksonomi_area' => 'nullable',
        'nama' => 'nullable|string|max:1000',
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

    public function idTaksonomi(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskTaksonomi::class, 'id_taksonomi');
    }

    public function idTaksonomiArea(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskTaksonomiArea::class, 'id_taksonomi_area');
    }

    public function riskDampaks(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskDampak::class, 'id_risiko');
    }

    public function riskPenyebabs(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskPenyebab::class, 'id_risiko');
    }
}
