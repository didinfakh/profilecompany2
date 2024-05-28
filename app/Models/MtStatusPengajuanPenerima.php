<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtStatusPengajuanPenerima extends BaseModel
{
    public $table = 'mt_status_pengajuan_penerima';

    protected $primaryKey = 'id_status_pengajuan_penerima';

    public $fillable = [
        'id_status_pengajuan',
        'id_group',
        'id_status_pengajuan_selanjutnya',
        'created_by',
        'updated_by',
        'deleted_by',
        'created_by_desc',
        'updated_by_desc',
        'deleted_by_desc'
    ];

    protected $casts = [
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'id_status_pengajuan' => 'nullable',
        'id_group' => 'nullable',
        'id_status_pengajuan_selanjutnya' => 'nullable',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'updated_by' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_at' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'updated_by_desc' => 'nullable|string|max:200',
        'deleted_by_desc' => 'nullable|string|max:200'
    ];

    public function idStatusPengajuan(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtStatusPengajuan::class, 'id_status_pengajuan');
    }

    public function idGroup(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\SysGroup::class, 'id_group');
    }

    public function idStatusPengajuanSelanjutnya(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtStatusPengajuan::class, 'id_status_pengajuan_selanjutnya');
    }
}
