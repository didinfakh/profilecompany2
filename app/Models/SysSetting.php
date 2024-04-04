<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SysSetting extends BaseModel
{
    public $table = 'sys_setting';

    public $fillable = [
        'nama',
        'isi'
    ];

    protected $casts = [
        'nama' => 'string',
        'isi' => 'string'
    ];

    public array $rules = [
        'nama' => 'nullable|string|max:100',
        'isi' => 'nullable|string|max:500'
    ];

    
}
