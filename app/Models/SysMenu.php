<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SysMenu extends Model
{
    public $table = 'sys_menu';

    public $fillable = [
        'id_parent_menu',
        'nama',
        'url',
        'sort',
        'icon',
        'is_show'
    ];

    protected $casts = [
        'nama' => 'string',
        'url' => 'string',
        'icon' => 'string'
    ];

    public static array $rules = [
        'id_parent_menu' => 'nullable',
        'nama' => 'nullable|string|max:100',
        'url' => 'nullable|string|max:300',
        'deleted_at' => 'nullable',
        'sort' => 'nullable',
        'icon' => 'nullable|string|max:20',
        'is_show' => 'nullable'
    ];

    public function sysActions(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\SysAction::class, 'id_menu');
    }

    public function sysGroups(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\SysGroup::class, 'sys_group_menu');
    }
}
