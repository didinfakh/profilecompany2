<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskDampak extends BaseModel
{
    public $table = 'mt_risk_dampak';

    protected $primaryKey = 'id_dampak';

    public $fillable = [
        'nama',
        'keterangan',
        'created_date',
        'modified_date',
        'kode',
        'rating',
        'mulai',
        'sampai',
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
        'created_date' => 'datetime',
        'modified_date' => 'datetime',
        'kode' => 'string',
        'rating' => 'float',
        'mulai' => 'float',
        'sampai' => 'float',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'nama' => 'required|string|max:300',
        'keterangan' => 'nullable|string|max:4000',
        'created_date' => 'nullable',
        'modified_date' => 'nullable',
        'kode' => 'required|string|max:20',
        'rating' => 'nullable|numeric',
        'mulai' => 'nullable|numeric',
        'sampai' => 'nullable|numeric',
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

    public function mtRiskKriteriaDampakDetails(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\MtRiskKriteriaDampakDetail::class, 'id_dampak');
    }

    public function mtRiskMatrix(): \Illuminate\Database\Eloquent\Relations\HasOne
    {
        return $this->hasOne(\App\Models\MtRiskMatrix::class);
    }
}
