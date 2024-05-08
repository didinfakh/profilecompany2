<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskProfileMitigasiTimeline extends BaseModel
{
    public $table = 'risk_profile_mitigasi_timeline';

    protected $primaryKey = 'id_mitigasi_timeline';

    public $fillable = [
        'periode',
        'is_proses',
        'id_mitigasi'
    ];

    protected $casts = [
        'periode' => 'string'
    ];

    public array $rules = [
        'periode' => 'required|string|max:20',
        'is_proses' => 'required',
        'id_mitigasi' => 'nullable'
    ];

    public function idMitigasi(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskProfileMitigasi::class, 'id_mitigasi');
    }
}
