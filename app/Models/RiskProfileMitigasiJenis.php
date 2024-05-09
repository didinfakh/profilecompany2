<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskProfileMitigasiJenis extends BaseModel
{
    public $table = 'risk_profile_mitigasi_jenis';

    protected $primaryKey = 'id_mitigasi_jenis';

    public $fillable = [
        'id_mitigasi',
        'id_jenis_perlakuan',
        'created_by',
        'updated_by',
        'deleted_by',
        'created_by_desc',
        'updated_by_desc',
        'deleted_by_desc'
    ];

    protected $casts = [
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'id_mitigasi' => 'nullable',
        'id_jenis_perlakuan' => 'nullable',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'updated_by' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_at' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'updated_by_desc' => 'nullable|string|max:200',
        'deleted_by_desc' => 'nullable|string|max:200'
    ];

    public function idMitigasi(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskProfileMitigasi::class, 'id_mitigasi');
    }

    public function idJenisPerlakuan(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskJenisPerlakuan::class, 'id_jenis_perlakuan');
    }
}
