<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskPerlakuan extends BaseModel
{
    public $table = 'mt_risk_perlakuan';

    public $primaryKey = 'id_perlakuan';

    public $fillable = [
        'nama',
        'keterangan',
        'jenis',
        'created_by',
        'modified_by',
        'created_by_desc',
        'modified_by_desc',
        'deleted_by',
        'deleted_by_desc'
    ];

    protected $casts = [
        'nama' => 'string',
        'keterangan' => 'string',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'nama' => 'nullable|string|max:200',
        'keterangan' => 'nullable|string|max:4000',
        'jenis' => 'nullable',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'modified_by' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'modified_by_desc' => 'nullable|string|max:200',
        'deleted_at' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_by_desc' => 'nullable|string|max:200'
    ];

    public function mtRiskTingkatPerlakuans(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\MtRiskTingkatPerlakuan::class, 'id_perlakuan');
    }

    public function riskProfileMitigasis(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskProfileMitigasi::class, 'id_perlakuan');
    }
}
