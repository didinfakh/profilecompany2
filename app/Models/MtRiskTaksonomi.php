<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskTaksonomi extends BaseModel
{
    public $table = 'mt_risk_taksonomi';

    protected $primaryKey = 'id_taksonomi';

    public $fillable = [
        'kode',
        'nama',
        'id_taksonomi_area',
        'is_regulasi',
        'penjelasan',
        'created_by',
        'modified_by',
        'created_by_desc',
        'modified_by_desc',
        'deleted_by',
        'deleted_by_desc'
    ];

    protected $casts = [
        'kode' => 'string',
        'nama' => 'string',
        'penjelasan' => 'string',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'kode' => 'required|string|max:20',
        'nama' => 'required|string|max:200',
        'id_taksonomi_area' => 'nullable',
        'is_regulasi' => 'nullable',
        'penjelasan' => 'nullable|string|max:1000',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'modified_by' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'modified_by_desc' => 'nullable|string|max:200',
        'deleted_at' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_by_desc' => 'nullable|string|max:200'
    ];

    public function idTaksonomiArea(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskTaksonomiArea::class, 'id_taksonomi_area');
    }

    public function mtRiskTaksonomiArea1s(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\MtRiskTaksonomiArea::class, 'risk_risiko');
    }

    public function riskProfiles(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskProfile::class, 'id_taksonomi');
    }

    public function riskMetrikStrategiRisikos(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskMetrikStrategiRisiko::class, 'id_taksonomi');
    }
}
