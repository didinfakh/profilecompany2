<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskMetrikStrategiRisiko extends BaseModel
{
    public $table = 'risk_metrik_strategi_risiko';

    protected $primaryKey = 'id_metrik_strategi_risiko';

    public $fillable = [
        'id_jenis_risiko',
        'id_taksonomi',
        'risk_appetite_statement',
        'id_sikap_terhadap_risiko',
        'paramater',
        'satuan_ukuran',
        'nilai_batasan',
        'created_by',
        'modified_by',
        'created_by_desc',
        'modified_by_desc',
        'id_register',
        'deleted_by',
        'deleted_by_desc'
    ];

    protected $casts = [
        'risk_appetite_statement' => 'string',
        'paramater' => 'string',
        'satuan_ukuran' => 'string',
        'nilai_batasan' => 'decimal:2',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'id_jenis_risiko' => 'required',
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
        'modified_by_desc' => 'nullable|string|max:200',
        'id_register' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_by_desc' => 'nullable|string|max:200'
    ];

    public function idTaksonomi(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskTaksonomi::class, 'id_taksonomi');
    }

    public function idRegister(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskRegister::class, 'id_register');
    }

    public function idJenisRisiko(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskJenisRisiko::class, 'id_jenis_risiko');
    }

    public function idSikapTerhadapRisiko(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskSikapTerhadapRisiko::class, 'id_sikap_terhadap_risiko');
    }
}
