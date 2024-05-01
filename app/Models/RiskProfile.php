<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskProfile extends BaseModel
{
    public $table = 'risk_profile';

    public $primaryKey = 'id_risk_profile';

    public $fillable = [
        'sasaran',
        'id_sasaran',
        'id_jenis_risiko',
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
        'id_kemungkinan_inheren',
        'created_by',
        'updated_by',
        'deleted_by',
        'created_by_desc',
        'updated_by_desc',
        'deleted_by_desc'
    ];

    protected $casts = [
        'sasaran' => 'string',
        'nama' => 'string',
        'deskripsi' => 'string',
        'penjelasan_dampak' => 'string',
        'nilai_dampak_inheren' => 'decimal:2',
        'nilai_kemungkinan' => 'decimal:2',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'sasaran' => 'nullable|string|max:1000',
        'id_sasaran' => 'nullable',
        'nama' => 'required',
        'penyebab' => 'required',
        'penyebab.*.nama' => 'required',
        'dampak' => 'required',
        'dampak.*.nama' => 'required',
        'id_jenis_risiko' => 'nullable',
        'id_taksonomi' => 'nullable',
        'id_risiko' => 'nullable',
        'deskripsi' => 'nullable|string',
        'id_register' => 'nullable',
        'is_kuantitatif' => 'nullable',
        'penjelasan_dampak' => 'nullable|string|max:2000',
        'nilai_dampak_inheren' => 'nullable|numeric',
        'id_dampak_inheren' => 'nullable',
        'nilai_kemungkinan' => 'nullable|numeric',
        'id_kemungkinan_inheren' => 'nullable',
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

    public function idSasaran(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskSasaran::class, 'id_sasaran');
    }

    public function idJenisRisiko(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskJenisRisiko::class, 'id_jenis_risiko');
    }

    public function idTaksonomi(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskTaksonomi::class, 'id_taksonomi');
    }

    public function idRegister(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskRegister::class, 'id_register');
    }

    public function idRisiko(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskRisiko::class, 'id_risiko');
    }

    public function riskProfileKris(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskProfileKri::class, 'id_risk_profile');
    }

    public function riskDampaks(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\RiskDampak::class, 'risk_profile_dampak');
    }

    public function riskPenyebabs(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\RiskPenyebab::class, 'risk_profile_penyebab');
    }

    public function riskProfileMitigasis(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskProfileMitigasi::class, 'id_risk_profile');
    }
}
