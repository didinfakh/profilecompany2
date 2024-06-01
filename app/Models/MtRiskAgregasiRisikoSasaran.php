<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskAgregasiRisikoSasaran extends BaseModel
{
    public $table = 'mt_risk_agregasi_risiko_sasaran';

    protected $primaryKey = 'id_risk_agregasi_risiko_sasaran';

    public $fillable = [
        'id_risk_agregasi_risiko',
        'id_kelompok_bisnis',
        'tahun',
        'nilai_sasaran',
        'created_by',
        'updated_by',
        'deleted_by',
        'created_by_desc',
        'updated_by_desc',
        'deleted_by_desc'
    ];

    protected $casts = [
        'nilai_sasaran' => 'decimal:2',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'id_risk_agregasi_risiko' => 'required',
        'id_kelompok_bisnis' => 'required',
        'tahun' => 'required',
        'nilai_sasaran' => 'required|numeric',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'updated_by' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_at' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'updated_by_desc' => 'nullable|string|max:200',
        'deleted_by_desc' => 'nullable|string|max:200'
    ];

    public function idRiskAgregasiRisiko(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskAgregasiRisiko::class, 'id_risk_agregasi_risiko');
    }

    public function idKelompokBisnis(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtSdmKelompokBisni::class, 'id_kelompok_bisnis');
    }
}
