<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskProfileControl extends BaseModel
{
    public $table = 'risk_profile_control';

    public $primaryKey = 'id_control';

    public $fillable = [
        'id_risk_profile',
        'id_jenis_control',
        'nama',
        'id_efektifitas_control'
    ];

    protected $casts = [
        'nama' => 'string'
    ];

    public array $rules = [
        'id_risk_profile' => 'nullable',
        'id_jenis_control' => 'nullable',
        'nama' => 'nullable|string|max:2000',
        'id_efektifitas_control' => 'nullable'
    ];

    public function idEfektifitasControl(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskEfektifitasControl::class, 'id_efektifitas_control');
    }

    public function idJenisControl(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskJenisControl::class, 'id_jenis_control');
    }
}
