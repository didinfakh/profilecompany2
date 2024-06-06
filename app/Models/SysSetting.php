<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SysSetting extends BaseModel
{
    public $table = 'sys_setting';

    protected $primaryKey = 'id_setting';

    public $fillable = [
        'nama',
        'isi',
        'deleted_by',
        'deleted_by_desc'
    ];

    protected $casts = [
        'nama' => 'string',
        'isi' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'nama' => 'nullable|string|max:100',
        'isi' => 'nullable|string|max:500',
        'deleted_by' => 'nullable',
        'deleted_by_desc' => 'nullable|string|max:200'
    ];

    
}
