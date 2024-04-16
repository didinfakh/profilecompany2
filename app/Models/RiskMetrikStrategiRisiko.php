<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskMetrikStrategiRisiko extends BaseModel
{
    public $table = 'risk_metrik_strategi_risiko';

    protected $primaryKey = 'id_metrik_strategi_risiko';

    public $fillable = [
        'id_taksonomi_area',
        'id_taksonomi',
        'risk_appetite_statement',
        'id_sikap_terhadap_risiko',
        'paramater',
        'satuan_ukuran',
        'nilai_batasan',
        'created_by',
        'modified_by',
        'created_by_desc',
        'modified_by_desc'
    ];

    protected $casts = [
        'risk_appetite_statement' => 'string',
        'paramater' => 'string',
        'satuan_ukuran' => 'string',
        'nilai_batasan' => 'decimal:2',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string'
    ];

    public array $rules = [
        'id_taksonomi_area' => 'required',
        'id_taksonomi' => 'required',
        'risk_appetite_statement' => 'required|string|max:1000',
        'id_sikap_terhadap_risiko' => 'required',
        'paramater' => 'required|string|max:1000',
        'satuan_ukuran' => 'required|string|max:100',
        'nilai_batasan' => 'required|numeric',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'modified_by' => 'nullable',
        'deleted_at' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'modified_by_desc' => 'nullable|string|max:200'
    ];

    
}
