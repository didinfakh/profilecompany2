<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskKategoriRisiko extends BaseModel
{
    public $table = 'mt_risk_kategori_risiko';

    public $primaryKey = 'id_kategori_risiko';

    public $fillable = [
        'kode',
        'nama',
        'created_by',
        'updated_by',
        'deleted_by',
        'created_by_desc',
        'updated_by_desc',
        'deleted_by_desc'
    ];

    protected $casts = [
        'kode' => 'string',
        'nama' => 'string',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'kode' => 'required|string|max:20',
        'nama' => 'required|string|max:200',
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

    public function mtRiskJenisRisikos(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\MtRiskJenisRisiko::class, 'id_kategori_risiko');
    }
}
