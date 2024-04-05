<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtSdmUnit extends Model
{
    public $table = 'mt_sdm_unit';

    protected $primaryKey = 'table_code';

    public $fillable = [
        'table_desc',
        'is_aktif',
        'kode_distrik',
        'id_mig_dep',
        'kode_lama',
        'id_subunitkerja',
        'created_by',
        'modified_by',
        'created_by_desc',
        'modified_by_desc'
    ];

    protected $casts = [
        'table_code' => 'string',
        'table_desc' => 'string',
        'is_aktif' => 'string',
        'kode_distrik' => 'string',
        'kode_lama' => 'string',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string'
    ];

    public array $rules = [
        'table_desc' => 'required|string|max:100',
        'is_aktif' => 'required|string|max:1',
        'kode_distrik' => 'nullable|string|max:2',
        'id_mig_dep' => 'nullable',
        'kode_lama' => 'nullable|string|max:45',
        'id_subunitkerja' => 'nullable',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'modified_by' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'modified_by_desc' => 'nullable|string|max:200',
        'deleted_at' => 'nullable'
    ];

    public function mtSdmJabatans(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\MtSdmJabatan::class, 'id_unit');
    }
}
