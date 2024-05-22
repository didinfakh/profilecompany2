<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskAgregasiKelompokBisnis extends BaseModel
{
    public $table = 'mt_risk_agregasi_kelompok_bisnis';

    protected $primaryKey = 'id_agregasi_kelompok_bisnis';

    public $fillable = [
        'id_risk_agregasi_risiko',
        'id_kelompok_bisnis'
    ];

    protected $casts = [
        
    ];

    public array $rules = [
        'id_risk_agregasi_risiko' => 'nullable',
        'id_kelompok_bisnis' => 'nullable'
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
