<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskProfileKri extends BaseModel
{
    public $table = 'risk_profile_kri';

    public $primaryKey = 'id_kri';

    public $fillable = [
        'nama',
        'id_risk_profile',
        'satuan',
        'target_mulai',
        'target_sampai',
        'keterangan',
        'polaritas',
        'batas_bawah',
        'batas_atas',
        'is_kuantitatif',
        'aman',
        'hati_hati',
        'bahaya'
    ];

    protected $casts = [
        'nama' => 'string',
        'satuan' => 'string',
        'target_mulai' => 'float',
        'target_sampai' => 'float',
        'keterangan' => 'string',
        'polaritas' => 'string',
        'batas_bawah' => 'float',
        'batas_atas' => 'float',
        'aman' => 'string',
        'hati_hati' => 'string',
        'bahaya' => 'string'
    ];

    public array $rules = [
        'nama' => 'required|string|max:500',
        'id_risk_profile' => 'required',
        'satuan' => 'nullable|string|max:50',
        'target_mulai' => 'nullable|numeric',
        'target_sampai' => 'nullable|numeric',
        'keterangan' => 'nullable|string|max:4000',
        'polaritas' => 'nullable|string|max:1',
        'batas_bawah' => 'nullable|numeric',
        'batas_atas' => 'nullable|numeric',
        'is_kuantitatif' => 'nullable',
        'aman' => 'nullable|string|max:1000',
        'hati_hati' => 'nullable|string|max:1000',
        'bahaya' => 'nullable|string|max:1000'
    ];

    public function idRiskProfile(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskProfile::class, 'id_risk_profile');
    }

    public function riskProfileKriHasils(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskProfileKriHasil::class, 'id_kri');
    }
}
