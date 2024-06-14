<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskMsgPenerima extends BaseModel
{
    public $table = 'risk_msg_penerima';

    public $primaryKey = 'id_msg_penerima';

    public $fillable = [
        'is_read',
        'id_user',
        'id_msg',
        'created_by',
        'updated_by',
        'deleted_by',
        'created_by_desc',
        'updated_by_desc',
        'deleted_by_desc'
    ];

    protected $casts = [
        'is_read' => 'string',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'is_read' => 'nullable|string|max:1',
        'id_user' => 'required',
        'id_msg' => 'required',
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

    
}
