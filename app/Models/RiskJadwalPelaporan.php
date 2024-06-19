<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskJadwalPelaporan extends BaseModel
{
    public $table = 'risk_jadwal_pelaporan';

    public $primaryKey = 'id_jadwal_pelaporan';

    public $fillable = [
        'id_assessment_type',
        'tgl_mulai',
        'tgl_selesai',
        'jenis',
        'created_by',
        'updated_by',
        'deleted_by',
        'created_by_desc',
        'updated_by_desc',
        'deleted_by_desc'
    ];

    protected $casts = [
        'tgl_mulai' => 'date',
        'tgl_selesai' => 'date',
        'jenis' => 'string',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'id_assessment_type' => 'nullable',
        'tgl_mulai' => 'nullable',
        'tgl_selesai' => 'nullable',
        'jenis' => 'nullable|string|max:100',
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

    public function idAssessmentType(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtAssessmentType::class, 'id_assessment_type');
    }
}
