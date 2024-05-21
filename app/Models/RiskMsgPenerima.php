<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskMsgPenerima extends BaseModel
{
    public $table = 'risk_msg_penerima';

    protected $primaryKey = 'id_msg';

    public $fillable = [
        'is_read',
        'id_user',
        'id_msg_penerima'
    ];

    protected $casts = [
        'is_read' => 'string'
    ];

    public array $rules = [
        'is_read' => 'nullable|string|max:1',
        'id_user' => 'required',
        'id_msg_penerima' => 'required'
    ];

    
}
