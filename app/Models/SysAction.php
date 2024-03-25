<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SysAction extends Model
{
    public $table = 'sys_action';

    public $fillable = [
        'nama',
        'id_menu'
    ];

    protected $casts = [
        'nama' => 'string'
    ];

    public static array $rules = [
        'nama' => 'nullable|string|max:200',
        'id_menu' => 'nullable'
    ];

    public function idMenu(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\SysMenu::class, 'id_menu');
    }

    public function sysGroupMenus(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\SysGroupMenu::class, 'sys_group_action');
    }
}
