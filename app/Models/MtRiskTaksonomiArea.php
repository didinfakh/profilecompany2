<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskTaksonomiArea extends BaseModel
{
    public $table = 'mt_risk_taksonomi_area';

    protected $primaryKey = 'id_taksonomi_area';

    public $fillable = [
        'kode',
        'nama',
        'id_taksonomi_objective',
        'keterangan',
        'jenis',
        'created_by',
        'modified_by',
        'created_by_desc',
        'modified_by_desc'
    ];

    protected $casts = [
        'kode' => 'string',
        'nama' => 'string',
        'keterangan' => 'string',
        'jenis' => 'string',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string'
    ];

    public array $rules = [
        'kode' => 'required|string|max:5',
        'nama' => 'required|string|max:200',
        'id_taksonomi_objective' => 'nullable',
        'keterangan' => 'nullable|string',
        'jenis' => 'nullable|string|max:50',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'modified_by' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'modified_by_desc' => 'nullable|string|max:200',
        'deleted_at' => 'nullable'
    ];

    public function idTaksonomiObjective(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskTaksonomiObjective::class, 'id_taksonomi_objective');
    }

    public function mtRiskTaksonomis(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\MtRiskTaksonomi::class, 'id_taksonomi_area');
    }
}