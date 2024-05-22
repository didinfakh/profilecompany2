<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtStatusRencanaPerlakuan extends BaseModel
{
    public $table = 'mt_status_rencana_perlakuan';

    protected $primaryKey = 'id_status_rencana_perlakuan';

    public $fillable = [
        'nama',
        'created_by',
        'updated_by',
        'deleted_by',
        'created_by_desc',
        'updated_by_desc',
        'deleted_by_desc',
        'keterangan'
    ];

    protected $casts = [
        'nama' => 'string',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string',
        'keterangan' => 'string'
    ];

    public array $rules = [
        'nama' => 'nullable|string|max:200',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'updated_by' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_at' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'updated_by_desc' => 'nullable|string|max:200',
        'deleted_by_desc' => 'nullable|string|max:200',
        'keterangan' => 'nullable|string|max:2000'
    ];

    public function mtSdmJabatans(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\MtSdmJabatan::class, 'risk_profile_mitigasi_realisasi');
    }
}
