<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiskMsg extends BaseModel
{
    public $table = 'risk_msg';

    protected $primaryKey = 'id_msg';

    public $fillable = [
        'msg',
        'url'
    ];

    protected $casts = [
        'msg' => 'string',
        'url' => 'string'
    ];

    public array $rules = [
        'msg' => 'nullable|string|max:4000',
        'url' => 'nullable|string|max:4000'
    ];

    
}
