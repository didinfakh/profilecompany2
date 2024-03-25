<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SysSetting extends Model
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

    public static array $rules = [
        'nama' => 'nullable|string|max:100',
        'isi' => 'nullable|string|max:500'
    ];

    
}
