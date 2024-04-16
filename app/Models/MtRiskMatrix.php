<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskMatrix extends BaseModel
{
    public $table = 'mt_risk_matrix';

    protected $primaryKey = 'id_dampak';

    public $fillable = [
        'id_kemungkinan',
        'id_tingkat',
        'css',
        'jenis',
        'created_by',
        'modified_by',
        'created_by_desc',
        'modified_by_desc'
    ];

    protected $casts = [
        'css' => 'string',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string'
    ];

    public array $rules = [
        'id_kemungkinan' => 'required',
        'id_tingkat' => 'nullable',
        'css' => 'nullable|string|max:200',
        'jenis' => 'nullable',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'modified_by' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'modified_by_desc' => 'nullable|string|max:200',
        'deleted_at' => 'nullable'
    ];

    public function idKemungkinan(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskKemungkinan::class, 'id_kemungkinan');
    }

    public function idDampak(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskDampak::class, 'id_dampak');
    }

    public function idTingkat(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskTingkat::class, 'id_tingkat');
    }
}
