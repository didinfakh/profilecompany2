<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskJenisProgramRkap extends BaseModel
{
    public $table = 'mt_risk_jenis_program_rkap';

    public $primaryKey = 'id_jenis_program_rkap';

    public $fillable = [
        'nama'
    ];

    protected $casts = [
        'nama' => 'string'
    ];

    public array $rules = [
        'nama' => 'nullable|string|max:200'
    ];

    public function riskProfileMitigasis(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskProfileMitigasi::class, 'id_jenis_program_rkap');
    }
}
