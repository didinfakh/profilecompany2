<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskKemungkinan extends BaseModel
{
    public $table = 'mt_risk_kemungkinan';

    protected $primaryKey = 'id_kemungkinan';

    public $fillable = [
        'nama',
        'kemungkinan_terjadi',
        'created_by',
        'modified_by',
        'frekuensi_kejadian',
        'kode',
        'rating',
        'persentase',
        'kemungkinan_terjadi_tahunan',
        'frekuensi_kejadian_transaksi',
        'persentase_mulai',
        'persentase_sampai',
        'created_by_desc',
        'modified_by_desc'
    ];

    protected $casts = [
        'nama' => 'string',
        'kemungkinan_terjadi' => 'string',
        'frekuensi_kejadian' => 'string',
        'kode' => 'string',
        'rating' => 'float',
        'persentase' => 'string',
        'kemungkinan_terjadi_tahunan' => 'decimal:2',
        'frekuensi_kejadian_transaksi' => 'decimal:2',
        'persentase_mulai' => 'decimal:2',
        'persentase_sampai' => 'decimal:2',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string'
    ];

    public array $rules = [
        'nama' => 'required|string|max:300',
        'kemungkinan_terjadi' => 'nullable|string|max:4000',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'modified_by' => 'nullable',
        'frekuensi_kejadian' => 'nullable|string|max:4000',
        'kode' => 'required|string|max:20',
        'rating' => 'nullable|numeric',
        'persentase' => 'nullable|string|max:4000',
        'kemungkinan_terjadi_tahunan' => 'nullable|numeric',
        'frekuensi_kejadian_transaksi' => 'nullable|numeric',
        'persentase_mulai' => 'nullable|numeric',
        'persentase_sampai' => 'nullable|numeric',
        'created_by_desc' => 'nullable|string|max:200',
        'modified_by_desc' => 'nullable|string|max:200',
        'deleted_at' => 'nullable'
    ];

    public function mtRiskMatrices(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\MtRiskMatrix::class, 'id_kemungkinan');
    }
}
