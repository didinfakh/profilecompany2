<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtTemplateLaporan extends BaseModel
{
    public $table = 'mt_template_laporan';

    public $primaryKey = 'id_template_laporan';

    public $fillable = [
        'halaman',
        'judul',
        'kolom',
        'created_by',
        'updated_by',
        'deleted_by',
        'created_by_desc',
        'updated_by_desc',
        'deleted_by_desc'
    ];

    protected $casts = [
        'halaman' => 'string',
        'judul' => 'string',
        'kolom' => 'string',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'halaman' => 'nullable|string|max:500',
        'judul' => 'nullable|string|max:2000',
        'kolom' => 'nullable|string',
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

    
}
