<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskProfileMitigasiRealisasi extends BaseModel
{
    public $table = 'risk_profile_mitigasi_realisasi';

    public $primaryKey = 'id_mitigasi_realisasi';

    public $fillable = [
        'id_mitigasi',
        'periode',
        'id_status_rencana_perlakuan',
        'penjelasan_status_rencana_perlakuan',
        'progress',
        'nama',
        'output_perlakuan',
        'biaya',
        'id_pic',
        'is_ada_progress',
        'created_by',
        'updated_by',
        'deleted_by',
        'created_by_desc',
        'updated_by_desc',
        'deleted_by_desc'
    ];

    protected $casts = [
        'periode' => 'string',
        'penjelasan_status_rencana_perlakuan' => 'string',
        'progress' => 'decimal:2',
        'nama' => 'string',
        'output_perlakuan' => 'string',
        'biaya' => 'decimal:2',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'id_mitigasi' => 'nullable',
        'periode' => 'nullable|string|max:20',
        'bulan' => 'required',
        'id_status_rencana_perlakuan' => 'nullable',
        'penjelasan_status_rencana_perlakuan' => 'nullable|string|max:3000',
        'progress' => 'nullable|numeric',
        'nama' => 'nullable|string|max:2000',
        'output_perlakuan' => 'nullable|string|max:2000',
        'biaya' => 'nullable|numeric',
        'id_pic' => 'nullable',
        'is_ada_progress' => 'nullable',
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

    public function idStatusRencanaPerlakuan(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtStatusRencanaPerlakuan::class, 'id_status_rencana_perlakuan');
    }

    public function idPic(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtSdmJabatan::class, 'id_pic');
    }
}
