<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskSasaran extends BaseModel
{
    public $table = 'risk_sasaran';

    protected $primaryKey = 'id_sasaran';

    public $fillable = [
        'nama',
        'hasil_yang_diharapkan',
        'nilai_risiko',
        'nilai_limit',
        'is_accept',
        'created_by',
        'updated_by',
        'created_by_desc',
        'updated_by_desc',
        'id_unit',
        'id_register',
        'deleted_by',
        'deleted_by_desc'
    ];

    protected $casts = [
        'nama' => 'string',
        'hasil_yang_diharapkan' => 'string',
        'nilai_risiko' => 'string',
        'nilai_limit' => 'string',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'id_unit' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'nama' => 'required|string|max:1000',
        'hasil_yang_diharapkan' => 'required|string|max:1000',
        'nilai_risiko' => 'required|string|max:1000',
        'nilai_limit' => 'nullable|string|max:1000',
        'is_accept' => 'nullable',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'updated_by' => 'nullable',
        'deleted_at' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'updated_by_desc' => 'nullable|string|max:200',
        'id_unit' => 'nullable|string|max:18',
        'id_register' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_by_desc' => 'nullable|string|max:200'
    ];

    public function idUnit(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtSdmUnit::class, 'id_unit');
    }

    public function idRegister(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskRegister::class, 'id_register');
    }

    public function riskSasaranStrategis(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskSasaranStrategi::class, 'id_sasaran');
    }
}