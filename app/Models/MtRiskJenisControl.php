<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskJenisControl extends BaseModel
{
    public $table = 'mt_risk_jenis_control';

    protected $primaryKey = 'id_jenis_control';

    public $fillable = [
        'nama'
    ];

    protected $casts = [
        'nama' => 'string'
    ];

    public array $rules = [
        'nama' => 'nullable|string|max:200'
    ];

    public function mtRiskEfektifitasControls(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\MtRiskEfektifitasControl::class, 'risk_profile_control');
    }
}
