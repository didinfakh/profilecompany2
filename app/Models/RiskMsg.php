<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskMsg extends BaseModel
{
    public $table = 'risk_msg';

    protected $primaryKey = 'id_msg';

    public $fillable = [
        'msg',
        'url',
        'created_by',
        'updated_by',
        'deleted_by',
        'created_by_desc',
        'updated_by_desc',
        'deleted_by_desc',
        'id_register',
        'id_status_pengajuan',
        'id_group',
        'id_kri_hasil',
        'id_lost_event'
    ];

    protected $casts = [
        'msg' => 'string',
        'url' => 'string',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'msg' => 'nullable|string|max:4000',
        'url' => 'nullable|string|max:4000',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'updated_by' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_at' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'updated_by_desc' => 'nullable|string|max:200',
        'deleted_by_desc' => 'nullable|string|max:200',
        'id_register' => 'nullable',
        'id_status_pengajuan' => 'nullable',
        'id_group' => 'nullable',
        'id_kri_hasil' => 'nullable',
        'id_lost_event' => 'nullable'
    ];

    public function idRegister(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskRegister::class, 'id_register');
    }

    public function idStatusPengajuan(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtStatusPengajuan::class, 'id_status_pengajuan');
    }

    public function idGroup(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\SysGroup::class, 'id_group');
    }

    public function idKriHasil(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskProfileKriHasil::class, 'id_kri_hasil');
    }

    public function idLostEvent(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\LostEvent::class, 'id_lost_event');
    }
}
