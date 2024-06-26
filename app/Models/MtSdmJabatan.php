<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtSdmJabatan extends BaseModel
{
    public $table = 'mt_sdm_jabatan';

    protected $primaryKey = 'id_jabatan';

    public $fillable = [
        'nama',
        'id_unit',
        'position_id',
        'created_date',
        'modified_date',
        'tgl_mulai_efektif',
        'tgl_akhir_efektif',
        'id_jabatan_parent',
        'superior_id',
        'urutan',
        'created_by',
        'modified_by',
        'created_by_desc',
        'modified_by_desc',
        'deleted_by',
        'deleted_by_desc'
    ];

    protected $casts = [
        'nama' => 'string',
        'id_unit' => 'string',
        'position_id' => 'string',
        'created_date' => 'datetime',
        'modified_date' => 'datetime',
        'tgl_mulai_efektif' => 'date',
        'tgl_akhir_efektif' => 'date',
        'superior_id' => 'string',
        'urutan' => 'float',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'nama' => 'required|string|max:200',
        'id_unit' => 'nullable|string|max:18',
        'position_id' => 'nullable|string|max:20',
        'created_date' => 'nullable',
        'modified_date' => 'nullable',
        'tgl_mulai_efektif' => 'nullable',
        'tgl_akhir_efektif' => 'nullable',
        'id_jabatan_parent' => 'nullable',
        'superior_id' => 'nullable|string|max:20',
        'urutan' => 'nullable|numeric',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'modified_by' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'modified_by_desc' => 'nullable|string|max:200',
        'deleted_at' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_by_desc' => 'nullable|string|max:200'
    ];

    public function idUnit(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtSdmUnit::class, 'id_unit');
    }

    public function riskProfileMitigasis(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskProfileMitigasi::class, 'id_pic');
    }

    public function mtStatusRencanaPerlakuans(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\MtStatusRencanaPerlakuan::class, 'risk_profile_mitigasi_realisasi');
    }

    public function riskRegisters(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\RiskRegister::class, 'internal_control_testing');
    }

    public function riskRegister1s(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskRegister::class, 'id_owner');
    }
}
