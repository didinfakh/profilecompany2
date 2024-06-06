<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskRegister extends BaseModel
{
    public $table = 'risk_register';

    public $primaryKey = 'id_register';
    public $orderDefault = 'sort,id_assessment_type,id_register';

    public $fillable = [
        'nama',
        'scope',
        'created_by_desc',
        'updated_by_desc',
        'created_by',
        'updated_by',
        'id_kajian_risiko',
        'id_unit',
        'id_kelompok_bisnis',
        'id_assessment_type',
        'id_parent_register',
        'navigasi',
        'is_kegiatan',
        'kode',
        'periode_mulai',
        'periode_selesai',
        'id_status_pengajuan',
        'id_owner',
        'nama_owner',
        'deleted_by',
        'deleted_by_desc',
        'id_tingkat_agregasi_risiko',
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
        'scope' => 'required|string|max:4000',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'deleted_at' => 'nullable',
        'created_by_desc' => 'nullable',
        'updated_by_desc' => 'nullable',
        'created_by' => 'nullable',
        'updated_by' => 'nullable',
        // 'id_kajian_risiko' => 'required',
        'id_unit' => 'required|string|max:18',
        'id_parent_register' => 'nullable',
        'navigasi' => 'required|string|max:1',
        // 'is_kegiatan' => 'required|string|max:1',
        'kode' => 'required|string|max:20',
        // 'id_status_pengajuan' => 'required',
        'id_owner' => 'required',
        'nama_owner' => 'required|string|max:100',
        'deleted_by' => 'nullable',
        'deleted_by_desc' => 'nullable|string|max:50',
        'id_kelompok_bisnis' => 'required',
        'id_assessment_type' => 'required',
        'id_tingkat_agregasi_risiko' => 'required'
    ];

    public array $rules_if_folder = [
        'nama' => 'required|string|max:300',
        // 'scope' => 'required|string|max:4000',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'deleted_at' => 'nullable',
        'created_by_desc' => 'nullable',
        'updated_by_desc' => 'nullable',
        'created_by' => 'nullable',
        'updated_by' => 'nullable',
        // 'id_kajian_risiko' => 'required',
        // 'id_unit' => 'required|string|max:18',
        'id_parent_register' => 'nullable',
        'navigasi' => 'required|string|max:1',
        // 'is_kegiatan' => 'required|string|max:1',
        // 'kode' => 'required|string|max:20',
        // 'id_status_pengajuan' => 'required',
        // 'id_owner' => 'required',
        // 'nama_owner' => 'required|string|max:100',
        'deleted_by' => 'nullable',
        // 'deleted_by_desc' => 'nullable|string|max:50',
        // 'id_kelompok_bisnis' => 'required',
        // 'id_assessment_type' => 'required'
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

    public function riskMetrikStrategiRisikos(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskMetrikStrategiRisiko::class, 'id_register');
    }

    public function mtSdmUnit1s(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\MtSdmUnit::class, 'risk_sasaran');
    }

    public function mtSdmUnit2s(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\MtSdmUnit::class, 'risk_capacity_limit');
    }
}
