<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtSdmPegawai extends BaseModel
{
    public $table = 'mt_sdm_pegawai';

    protected $primaryKey = 'id_pegawai';

    public $fillable = [
        'nid',
        'email',
        'position_id',
        'nama_lengkap',
        'created_by',
        'modified_by',
        'created_by_desc',
        'modified_by_desc',
        'deleted_by',
        'deleted_by_desc',
        'id_jabatan'
    ];

    protected $casts = [
        'nid' => 'string',
        'email' => 'string',
        'position_id' => 'string',
        'nama_lengkap' => 'string',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'nid' => 'nullable|string|max:10',
        'email' => 'nullable|string|max:500',
        'position_id' => 'nullable|string|max:10',
        'nama_lengkap' => 'required|string|max:500',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'modified_by' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'modified_by_desc' => 'nullable|string|max:200',
        'deleted_at' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_by_desc' => 'nullable|string|max:200',
        'id_jabatan' => 'nullable'
    ];

    public function idJabatan(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtSdmJabatan::class, 'id_jabatan');
    }
}
