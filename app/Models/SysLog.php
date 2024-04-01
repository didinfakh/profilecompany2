<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SysLog extends Model
{
    public $table = 'sys_log';

    protected $primaryKey = 'id_log';

    public $fillable = [
        'page',
        'activity',
        'ip',
        'activity_time',
        'user_desc',
        'action',
        'table_name'
    ];

    protected $casts = [
        'page' => 'string',
        'activity' => 'string',
        'ip' => 'string',
        'activity_time' => 'datetime',
        'user_desc' => 'string',
        'action' => 'string',
        'table_name' => 'string'
    ];

    public static array $rules = [
        'page' => 'nullable|string|max:500',
        'activity' => 'nullable|string',
        'ip' => 'nullable|string|max:50',
        'activity_time' => 'nullable',
        'user_desc' => 'nullable|string|max:200',
        'action' => 'nullable|string|max:50',
        'table_name' => 'nullable|string|max:100'
    ];

    
}
