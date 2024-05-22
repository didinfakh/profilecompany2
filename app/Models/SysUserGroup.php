<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SysUserGroup extends BaseModel
{
    public $table = 'sys_user_group';

    protected $primaryKey = 'id_user';

    public $fillable = [
        'id_user',
        'id_group',
        'deleted_by',
        'deleted_by_desc',
        'id_jabatan',
        'update_at',
        'created_at'
    ];

    protected $casts = [
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'id_user' => 'nullable',
        'id_group' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_by_desc' => 'nullable|string|max:200',
        'id_jabatan' => 'nullable'
    ];

    public function idUser(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\SysUser::class, 'id_user');
    }

    public function idGroup(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\SysGroup::class, 'id_group');
    }

    public function idJabatan(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtSdmJabatan::class, 'id_jabatan');
    }
}
