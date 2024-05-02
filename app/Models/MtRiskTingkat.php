<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskTingkat extends BaseModel
{
    public $table = 'mt_risk_tingkat';

    public $primaryKey = 'id_tingkat';

    public $fillable = [
        'nama',
        'warna',
        'penanganan',
        'jenis',
        'created_by',
        'modified_by',
        'created_by_desc',
        'modified_by_desc'
    ];

    protected $casts = [
        'nama' => 'string',
        'warna' => 'string',
        'penanganan' => 'string',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string'
    ];

    public array $rules = [
        'nama' => 'nullable|string|max:20',
        'warna' => 'nullable|string|max:20',
        'penanganan' => 'nullable|string|max:4000',
        'jenis' => 'nullable',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'modified_by' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'modified_by_desc' => 'nullable|string|max:200',
        'deleted_at' => 'nullable'
    ];

    public function mtRiskMatrices(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\MtRiskMatrix::class, 'id_tingkat');
    }

    public function mtRiskTingkatPerlakuan(): \Illuminate\Database\Eloquent\Relations\HasOne
    {
        return $this->hasOne(\App\Models\MtRiskTingkatPerlakuan::class);
    }
}
