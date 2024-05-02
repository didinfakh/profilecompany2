<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtRiskTingkatPerlakuan extends BaseModel
{
    public $table = 'mt_risk_tingkat_perlakuan';

    public $primaryKey = 'id_tingkat';

    public $fillable = [
        'id_perlakuan'
    ];

    protected $casts = [
        
    ];

    public array $rules = [
        'id_perlakuan' => 'required'
    ];

    public function idTingkat(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskTingkat::class, 'id_tingkat');
    }

    public function idPerlakuan(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskPerlakuan::class, 'id_perlakuan');
    }
}
