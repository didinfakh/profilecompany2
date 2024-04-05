<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskTaksonomi extends Model
{
    public $table = 'mt_risk_taksonomi';

    protected $primaryKey = 'id_taksonomi';

    public $fillable = [
        'kode',
        'nama',
        'id_taksonomi_area',
        'is_regulasi',
        'penjelasan',
        'jenis',
        'created_by',
        'modified_by',
        'created_by_desc',
        'modified_by_desc'
    ];

    protected $casts = [
        'kode' => 'string',
        'nama' => 'string',
        'penjelasan' => 'string',
        'jenis' => 'string',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string'
    ];

    public array $rules = [
        'kode' => 'required|string|max:20',
        'nama' => 'required|string|max:200',
        'id_taksonomi_area' => 'nullable',
        'is_regulasi' => 'nullable',
        'penjelasan' => 'nullable|string|max:1000',
        'jenis' => 'nullable|string|max:50',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'modified_by' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'modified_by_desc' => 'nullable|string|max:200',
        'deleted_at' => 'nullable'
    ];

    public function idTaksonomiArea(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskTaksonomiArea::class, 'id_taksonomi_area');
    }
}
