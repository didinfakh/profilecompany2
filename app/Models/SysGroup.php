<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SysGroup extends Model
{
    public $table = 'sys_group';

    public $fillable = [
        'nama',
        'delete_at'
    ];

    protected $casts = [
        'nama' => 'string',
        'delete_at' => 'datetime'
    ];

    public static array $rules = [
        'nama' => 'nullable|string|max:100',
        'delete_at' => 'nullable'
    ];

    public function sysUsers(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\SysUser::class, 'sys_user_group');
    }

    public function sysMenus(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\SysMenu::class, 'sys_group_menu');
    }
}
