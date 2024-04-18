<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskTaksonomiObjective extends BaseModel
{
    public $table = 'mt_risk_taksonomi_objective';

    protected $primaryKey = 'id_taksonomi_objective';

    public $fillable = [
        'kode',
        'nama',
        'jenis',
        'created_by',
        'modified_by',
        'created_by_desc',
        'modified_by_desc',
        'deleted_by',
        'deleted_by_desc'
    ];

    protected $casts = [
        'kode' => 'string',
        'nama' => 'string',
        'jenis' => 'string',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'kode' => 'required|string|max:5',
        'nama' => 'required|string|max:200',
        'jenis' => 'nullable|string|max:50',
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

    public function jenis(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtJenisDatum::class, 'jenis');
    }

    public function mtJenisDatum1s(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\MtJenisDatum::class, 'mt_risk_taksonomi_area');
    }
}
