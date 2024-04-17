<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskRegister extends BaseModel
{
    public $table = 'risk_register';

    protected $primaryKey = 'id_register';

    public $fillable = [
        'nama',
        'scope',
        'created_by_desc',
        'updated_by_desc',
        'created_by',
        'updated_by',
        'id_kajian_risiko',
        'id_unit',
        'id_parent_register',
        'navigasi',
        'id_tingkat_agregasi_risiko',
        'is_kegiatan',
        'kode',
        'id_status_pengajuan',
        'id_owner',
        'nama_owner',
        'deleted_by',
        'deleted_by_desc'
    ];

    protected $casts = [
        'nama' => 'string',
        'scope' => 'string',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'id_unit' => 'string',
        'navigasi' => 'string',
        'is_kegiatan' => 'string',
        'kode' => 'string',
        'nama_owner' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'nama' => 'required|string|max:300',
        'scope' => 'nullable|string|max:4000',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'deleted_at' => 'nullable',
        'created_by_desc' => 'required|string|max:50',
        'updated_by_desc' => 'required|string|max:50',
        'created_by' => 'nullable',
        'updated_by' => 'nullable',
        'id_kajian_risiko' => 'nullable',
        'id_unit' => 'nullable|string|max:18',
        'id_parent_register' => 'nullable',
        'navigasi' => 'nullable|string|max:1',
        'id_tingkat_agregasi_risiko' => 'nullable',
        'is_kegiatan' => 'nullable|string|max:1',
        'kode' => 'nullable|string|max:20',
        'id_status_pengajuan' => 'nullable',
        'id_owner' => 'nullable',
        'nama_owner' => 'nullable|string|max:100',
        'deleted_by' => 'nullable',
        'deleted_by_desc' => 'nullable|string|max:50'
    ];

    public function idStatusPengajuan(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtStatusPengajuan::class, 'id_status_pengajuan');
    }

    public function idOwner(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtSdmJabatan::class, 'id_owner');
    }

    public function idUnit(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtSdmUnit::class, 'id_unit');
    }

    public function idTingkatAgregasiRisiko(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskTingkatAgregasiRisiko::class, 'id_tingkat_agregasi_risiko');
    }

    public function mtSdmUnit1s(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\MtSdmUnit::class, 'risk_capacity_limit');
    }

    public function riskProfiles(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskProfile::class, 'id_register');
    }

    public function riskMetrikStrategiRisikos(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskMetrikStrategiRisiko::class, 'id_register');
    }

    public function mtSdmUnit2s(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\MtSdmUnit::class, 'risk_sasaran');
    }
}
