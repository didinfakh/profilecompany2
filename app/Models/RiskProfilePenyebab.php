<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskProfilePenyebab extends BaseModel
{
    public $table = 'risk_profile_penyebab';

    public $primaryKey = 'id_profile_penyebab';

    public $fillable = [
        'id_risk_profile',
        'id_penyebab',
        'nama',
        'no'
    ];

    protected $casts = [
        'nama' => 'string',
        'no' => 'string'
    ];

    public array $rules = [
        'id_risk_profile' => 'required',
        'id_penyebab' => 'required',
        'nama' => 'required|string|max:1000',
        'no' => 'nullable|string|max:10'
    ];

    public function idRiskProfile(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskProfile::class, 'id_risk_profile');
    }

    public function idPenyebab(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskPenyebab::class, 'id_penyebab');
    }

    public function riskProfileMitigasis(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskProfileMitigasi::class, 'id_profile_penyebab');
    }
}
