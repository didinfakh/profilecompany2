<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtSdmUnit extends BaseModel
{
    public $table = 'mt_sdm_unit';

    public $primaryKey = 'id_unit';

    public $fillable = [
        'id_unit',
        'nama',
        'created_by',
        'modified_by',
        'created_by_desc',
        'modified_by_desc',
        'deleted_by',
        'deleted_by_desc',
        'id_kelompok_bisnis'
    ];

    protected $casts = [
        'id_unit' => 'string',
        'nama' => 'string',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'nama' => 'required|string|max:100',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'modified_by' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'modified_by_desc' => 'nullable|string|max:200',
        'deleted_at' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_by_desc' => 'nullable|string|max:200',
        'id_kelompok_bisnis' => 'nullable'
    ];

    public function idKelompokBisnis(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtSdmKelompokBisni::class, 'id_kelompok_bisnis');
    }

    public function riskRegisters(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskRegister::class, 'id_unit');
    }

    public function mtSdmJabatans(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\MtSdmJabatan::class, 'id_unit');
    }

    public function riskRisikos(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\RiskRisiko::class, 'risk_dampak');
    }

    public function riskRisiko1s(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\RiskRisiko::class, 'risk_penyebab');
    }

    public function riskRisiko2s(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskRisiko::class, 'id_unit');
    }

    public function lostEvents(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\LostEvent::class, 'id_unit');
    }
}
