<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MtJenisData extends BaseModel
{
    public $table = 'mt_jenis_data';

    public $primaryKey = 'jenis';

    public $fillable = [
        'nama'
    ];

    protected $casts = [
        'jenis' => 'string',
        'nama' => 'string'
    ];

    public array $rules = [
        'nama' => 'required|string|max:50'
    ];

    public function mtRiskTaksonomiObjectives(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\MtRiskTaksonomiObjective::class, 'jenis');
    }

    public function mtRiskTaksonomiAreas(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\MtRiskTaksonomiArea::class, 'mt_risk_taksonomi');
    }

    public function mtRiskTaksonomiObjective1s(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(\App\Models\MtRiskTaksonomiObjective::class, 'mt_risk_taksonomi_area');
    }
}
