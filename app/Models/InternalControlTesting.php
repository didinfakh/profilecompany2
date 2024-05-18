<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class InternalControlTesting extends BaseModel
{
    public $table = 'internal_control_testing';

    protected $primaryKey = 'id_internal_control_testing';

    public $fillable = [
        'sasaran_bumn',
        'business_process',
        'key_control',
        'metode_pengujian',
        'kelemahan_kontrol',
        'rencana_tindak_lanjut',
        'due_date',
        'id_pic',
        'status_tindak_lanjut',
        'id_register',
        'created_by',
        'updated_by',
        'deleted_by',
        'created_by_desc',
        'updated_by_desc',
        'deleted_by_desc'
    ];

    protected $casts = [
        'sasaran_bumn' => 'string',
        'business_process' => 'string',
        'key_control' => 'string',
        'metode_pengujian' => 'string',
        'kelemahan_kontrol' => 'string',
        'rencana_tindak_lanjut' => 'string',
        'due_date' => 'date',
        'status_tindak_lanjut' => 'string',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'sasaran_bumn' => 'required|string|max:2000',
        'business_process' => 'required|string|max:2000',
        'key_control' => 'required|string|max:2000',
        'metode_pengujian' => 'required|string|max:2000',
        'kelemahan_kontrol' => 'required|string|max:2000',
        'rencana_tindak_lanjut' => 'required|string|max:2000',
        'due_date' => 'required',
        'id_pic' => 'required',
        'status_tindak_lanjut' => 'required|string|max:2000',
        'id_register' => 'nullable',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'updated_by' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_at' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'updated_by_desc' => 'nullable|string|max:200',
        'deleted_by_desc' => 'nullable|string|max:200'
    ];

    public function idPic(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtSdmJabatan::class, 'id_pic');
    }

    public function idRegister(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskRegister::class, 'id_register');
    }
}
