<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskProfileMitigasi extends BaseModel
{
    public $table = 'risk_profile_mitigasi';

    public $primaryKey = 'id_mitigasi';

    public $fillable = [
        'id_risk_profile',
        'id_profile_penyebab',
        'id_perlakuan',
        'nama',
        'output_perlakuan',
        'biaya',
        'id_jenis_program_rkap',
        'id_pic',
        'created_by',
        'updated_by',
        'deleted_by',
        'created_by_desc',
        'updated_by_desc',
        'deleted_by_desc'
    ];

    protected $casts = [
        'nama' => 'string',
        'output_perlakuan' => 'string',
        'biaya' => 'decimal:2',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'id_risk_profile' => 'nullable',
        'id_profile_penyebab' => 'nullable',
        'id_perlakuan' => 'nullable',
        'nama' => 'nullable|string|max:2000',
        'output_perlakuan' => 'nullable|string|max:2000',
        'biaya' => 'nullable|numeric',
        'id_jenis_program_rkap' => 'nullable',
        'id_pic' => 'nullable',
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

    public function idRiskProfile(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskProfile::class, 'id_risk_profile');
    }

    public function idProfilePenyebab(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskProfilePenyebab::class, 'id_profile_penyebab');
    }

    public function idperlakuan(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskPerlakuan::class, 'id_perlakuan');
    }

    public function idJenisProgramRkap(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskJenisProgramRkap::class, 'id_jenis_program_rkap');
    }

    public function idPic(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtSdmJabatan::class, 'id_pic');
    }

    public function mtRiskJenisPerlakuans(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\MtRiskJenisPerlakuan::class, 'risk_profile_mitigasi_jenis');
    }

    public function riskProfileMitigasiTimelineRealisasis(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskProfileMitigasiTimelineRealisasi::class, 'id_mitigasi');
    }

    public function riskProfileMitigasiTimelines(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskProfileMitigasiTimeline::class, 'id_mitigasi');
    }
}
