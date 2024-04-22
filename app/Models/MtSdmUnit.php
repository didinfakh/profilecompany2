<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtSdmUnit extends BaseModel
{
    public $table = 'mt_sdm_unit';

    protected $primaryKey = 'id_unit';

    public $fillable = [
        'id_unit',
        'nama',
        'is_aktif',
        'kode_distrik',
        'id_mig_dep',
        'kode_lama',
        'id_subunitkerja',
        'created_by',
        'modified_by',
        'created_by_desc',
        'modified_by_desc'
    ];

    protected $casts = [
        'id_unit' => 'string',
        'nama' => 'string',
        'is_aktif' => 'string',
        'kode_distrik' => 'string',
        'kode_lama' => 'string',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string'
    ];

    public array $rules = [
        'nama' => 'required|string|max:100',
        'is_aktif' => 'required|string|max:1',
        'kode_distrik' => 'nullable|string|max:2',
        'id_mig_dep' => 'nullable',
        'kode_lama' => 'nullable|string|max:45',
        'id_subunitkerja' => 'nullable',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'modified_by' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'modified_by_desc' => 'nullable|string|max:200',
        'deleted_at' => 'nullable'
    ];

    public function riskMetrikStrategiRisikos(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskMetrikStrategiRisiko::class, 'id_unit');
    }

    public function riskRegisters(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\RiskRegister::class, 'risk_sasaran');
    }

    public function riskRegister1s(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\RiskRegister::class, 'risk_capacity_limit');
    }

    public function mtSdmJabatans(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\MtSdmJabatan::class, 'id_unit');
    }

    public function riskRegister2s(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskRegister::class, 'id_unit');
    }
}
