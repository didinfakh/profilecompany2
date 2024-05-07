<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtStatusPengajuan extends BaseModel
{
    public $table = 'mt_status_pengajuan';

    protected $primaryKey = 'id_status_pengajuan';

    public $fillable = [
        'nama',
        'created_by',
        'updated_by',
        'created_by_desc',
        'updated_by_desc',
        'deleted_by',
        'deleted_by_desc'
    ];

    protected $casts = [
        'nama' => 'string',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'nama' => 'required|string|max:50',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'deleted_at' => 'nullable',
        'created_by' => 'nullable',
        'updated_by' => 'nullable',
        'created_by_desc' => 'nullable|string|max:50',
        'updated_by_desc' => 'nullable|string|max:50',
        'deleted_by' => 'nullable',
        'deleted_by_desc' => 'nullable|string|max:200'
    ];

    public function riskRegisters(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskRegister::class, 'id_status_pengajuan');
    }
}
