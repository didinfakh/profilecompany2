<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskEfektifitasControl extends BaseModel
{
    public $table = 'mt_risk_efektifitas_control';

    protected $primaryKey = 'id_efektifitas_control';

    public $fillable = [
        'nama'
    ];

    protected $casts = [
        'nama' => 'string'
    ];

    public array $rules = [
        'nama' => 'required|string|max:500'
    ];

    public function mtRiskJenisControls(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\MtRiskJenisControl::class, 'risk_profile_control');
    }
}
