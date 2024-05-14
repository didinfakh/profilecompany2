<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskProfileKriHasil extends BaseModel
{
    public $table = 'risk_profile_kri_hasil';

    public $primaryKey = 'id_kri_hasil';

    public $fillable = [
        'periode',
        'nilai',
        'id_kri',
        'target_mulai',
        'target_sampai',
        'batas_atas',
        'batas_bawah',
        'aman',
        'hati_hati',
        'bahaya',
        'status',
        'created_by',
        'updated_by',
        'deleted_by',
        'created_by_desc',
        'updated_by_desc',
        'deleted_by_desc',
        'nilai_kualitatif'
    ];

    protected $casts = [
        'periode' => 'string',
        'nilai' => 'float',
        'target_mulai' => 'float',
        'target_sampai' => 'float',
        'batas_atas' => 'float',
        'batas_bawah' => 'float',
        'aman' => 'string',
        'hati_hati' => 'string',
        'bahaya' => 'string',
        'status' => 'string',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string',
        'nilai_kualitatif' => 'string'
    ];

    public array $rules = [
        'periode' => 'nullable|string|max:20',
        'nilai' => 'nullable|numeric',
        'id_kri' => 'nullable',
        'target_mulai' => 'nullable|numeric',
        'target_sampai' => 'nullable|numeric',
        'batas_atas' => 'nullable|numeric',
        'batas_bawah' => 'nullable|numeric',
        'aman' => 'nullable|string|max:1000',
        'hati_hati' => 'nullable|string|max:1000',
        'bahaya' => 'nullable|string|max:1000',
        'status' => 'nullable|string|max:100',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'updated_by' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_at' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'updated_by_desc' => 'nullable|string|max:200',
        'deleted_by_desc' => 'nullable|string|max:200',
        'nilai_kualitatif' => 'nullable|string|max:200'
    ];

    public function idKri(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskProfileKri::class, 'id_kri');
    }
}
