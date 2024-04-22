<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskProfile extends BaseModel
{
    public $table = 'risk_profile';

    protected $primaryKey = 'id_risk_profile';

    public $fillable = [
        'sasaran',
        'id_sasaran',
        'id_taksonomi_area',
        'id_taksonomi',
        'id_risiko',
        'nama',
        'deskripsi',
        'id_register',
        'is_kuantitatif',
        'penjelasan_dampak',
        'nilai_dampak_inheren',
        'id_dampak_inheren',
        'nilai_kemungkinan',
        'id_kemungkinan_inheren'
    ];

    protected $casts = [
        'sasaran' => 'string',
        'nama' => 'string',
        'deskripsi' => 'string',
        'penjelasan_dampak' => 'string',
        'nilai_dampak_inheren' => 'decimal:2',
        'nilai_kemungkinan' => 'decimal:2'
    ];

    public array $rules = [
        'sasaran' => 'nullable|string|max:1000',
        'id_sasaran' => 'nullable',
        'id_taksonomi_area' => 'nullable',
        'id_taksonomi' => 'nullable',
        'id_risiko' => 'nullable',
        'nama' => 'nullable|string|max:1000',
        'deskripsi' => 'nullable|string',
        'id_register' => 'nullable',
        'is_kuantitatif' => 'nullable',
        'penjelasan_dampak' => 'nullable|string|max:2000',
        'nilai_dampak_inheren' => 'nullable|numeric',
        'id_dampak_inheren' => 'nullable',
        'nilai_kemungkinan' => 'nullable|numeric',
        'id_kemungkinan_inheren' => 'nullable'
    ];

    public function idSasaran(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskSasaran::class, 'id_sasaran');
    }

    public function idTaksonomiArea(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskTaksonomiArea::class, 'id_taksonomi_area');
    }

    public function idTaksonomi(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskTaksonomi::class, 'id_taksonomi');
    }

    public function idRegister(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskRegister::class, 'id_register');
    }

    public function riskPenyebabs(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\RiskPenyebab::class, 'risk_profile_penyebab');
    }

    public function riskProfileKris(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskProfileKri::class, 'id_risk_profile');
    }

    public function riskDampaks(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\RiskDampak::class, 'risk_profile_dampak');
    }

    public function riskProfileMitigasis(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskProfileMitigasi::class, 'id_risk_profile');
    }
}
