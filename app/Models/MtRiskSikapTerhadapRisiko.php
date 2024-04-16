<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskSikapTerhadapRisiko extends BaseModel
{
    public $table = 'mt_risk_sikap_terhadap_risiko';

    protected $primaryKey = 'id_sikap_terhadap_risiko';

    public $fillable = [
        'nama',
        'created_by',
        'modified_by',
        'created_by_desc',
        'modified_by_desc'
    ];

    protected $casts = [
        'nama' => 'string',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string'
    ];

    public array $rules = [
        'nama' => 'nullable|string|max:50',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'modified_by' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'modified_by_desc' => 'nullable|string|max:200',
        'deleted_at' => 'nullable'
    ];

    
}