<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskKriteriaDampakDetail extends BaseModel
{
    public $table = 'mt_risk_kriteria_dampak_detail';

    protected $primaryKey = 'id_kriteria_dampak';

    public $fillable = [
        'id_kriteria_dampak',
        'id_dampak',
        'keterangan',
        'created_by',
        'modified_by',
        'created_by_desc',
        'modified_by_desc',
        'deleted_by',
        'deleted_by_desc'
    ];

    protected $casts = [
        'keterangan' => 'string',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'id_dampak' => 'required',
        'keterangan' => 'nullable|string|max:400',
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

    public function idKriteriaDampak(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskKriteriaDampak::class, 'id_kriteria_dampak');
    }

    public function idDampak(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskDampak::class, 'id_dampak');
    }
}
