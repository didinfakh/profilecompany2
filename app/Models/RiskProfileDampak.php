<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskProfileDampak extends BaseModel
{
    public $table = 'risk_profile_dampak';

    public $primaryKey = 'id_profile_dampak';

    public $fillable = [
        'id_risk_profile',
        'id_dampak',
        'nama',
        'no',
        'perkiraan_terpapar'
    ];

    protected $casts = [
        'nama' => 'string',
        'no' => 'string',
        'perkiraan_terpapar' => 'string'
    ];

    public array $rules = [
        'id_risk_profile' => 'required',
        'id_dampak' => 'required',
        'nama' => 'required|string|max:1000',
        'no' => 'nullable|string|max:10',
        'perkiraan_terpapar' => 'nullable|string|max:200'
    ];

    public function idRiskProfile(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskProfile::class, 'id_risk_profile');
    }

    public function idDampak(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskDampak::class, 'id_dampak');
    }
}
