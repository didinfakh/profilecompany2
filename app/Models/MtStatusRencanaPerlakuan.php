<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtStatusRencanaPerlakuan extends BaseModel
{
    public $table = 'mt_status_rencana_perlakuan';

    public $primaryKey = 'id_status_rencana_perlakuan';

    public $fillable = [
        'nama'
    ];

    protected $casts = [
        'nama' => 'string'
    ];

    public array $rules = [
        'nama' => 'nullable|string|max:200'
    ];

    public function mtSdmJabatans(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\MtSdmJabatan::class, 'risk_profile_mitigasi_realisasi');
    }
}
