<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SysUserModel extends BaseModel
{
    public $table = 'sys_user';

    protected $primaryKey = 'id_user';

    public $fillable = [
        'name',
        'email',
        'email_verified_at',
        'password',
        'remember_token',
        'last_ip',
        'last_login',
        'created_by',
        'updated_by',
        'created_by_desc',
        'modified_by_desc',
        'salt',
        'deleted_by',
        'deleted_by_desc',
        'id_pegawai'
    ];

    protected $casts = [
        'name' => 'string',
        'email' => 'string',
        'email_verified_at' => 'datetime',
        'password' => 'string',
        'remember_token' => 'string',
        'last_ip' => 'string',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string',
        'salt' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'name' => 'required|string|max:255',
        'email' => 'required|string|max:255',
        'email_verified_at' => 'nullable',
        'password' => 'required|string|max:255',
        'remember_token' => 'nullable|string|max:100',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'last_ip' => 'nullable|string|max:30',
        'last_login' => 'nullable',
        'created_by' => 'nullable',
        'updated_by' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'modified_by_desc' => 'nullable|string|max:200',
        'salt' => 'nullable|string|max:20',
        'deleted_at' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_by_desc' => 'nullable|string|max:200',
        'id_pegawai' => 'nullable'
    ];

    public function idPegawai(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtSdmPegawai::class, 'id_pegawai');
    }

    public function sysUserGroups(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\SysUserGroup::class, 'id_user');
    }
}
