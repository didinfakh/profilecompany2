<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtSdmPegawai extends BaseModel
{
    public $table = 'mt_sdm_pegawai';

    protected $primaryKey = 'nid';

    public $fillable = [
        'email',
        'position_id',
        'nama_lengkap',
        'created_by',
        'modified_by',
        'created_by_desc',
        'modified_by_desc'
    ];

    protected $casts = [
        'nid' => 'string',
        'email' => 'string',
        'position_id' => 'string',
        'nama_lengkap' => 'string',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string'
    ];

    public array $rules = [
        'email' => 'nullable|string|max:500',
        'position_id' => 'nullable|string|max:10',
        'nama_lengkap' => 'nullable|string|max:500',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'modified_by' => 'nullable',
        'deleted_at' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'modified_by_desc' => 'nullable|string|max:200'
    ];

    
}
