<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskJenisPerlakuan extends BaseModel
{
    public $table = 'mt_risk_jenis_perlakuan';

    public $primaryKey = 'id_jenis_perlakuan';

    public $fillable = [
        'nama'
    ];

    protected $casts = [
        'nama' => 'string'
    ];

    public array $rules = [
        'nama' => 'required|string'
    ];

    public function riskProfileMitigasis(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\RiskProfileMitigasi::class, 'risk_profile_mitigasi_jenis');
    }
}
