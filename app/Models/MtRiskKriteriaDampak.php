<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskKriteriaDampak1 extends BaseModel
{
    public $table = 'mt_risk_kriteria_dampak';

    protected $primaryKey = 'id_kriteria_dampak';
kdj
    public $fillable = [
        'nama',
        'id_induk',
        'kode',
        'jenis',
        'created_by',
        'modified_by',
        'created_by_desc',
        'modified_by_desc'
    ];

    protected $casts = [
        'nama' => 'string',
        'kode' => 'string',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string'
    ];

    public array $rules = [
        'nama' => 'nullable|string|max:200',
        'id_induk' => 'nullable',
        'kode' => 'nullable|string|max:20',
        'jenis' => 'nullable',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'modified_by' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'modified_by_desc' => 'nullable|string|max:200',
        'deleted_at' => 'nullable'
    ];

    public function mtRiskKriteriaDampakDetail(): \Illuminate\Database\Eloquent\Relations\HasOne
    {
        return $this->hasOne(\App\Models\MtRiskKriteriaDampakDetail::class);
    }
}
