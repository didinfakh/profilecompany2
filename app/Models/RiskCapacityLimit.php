<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class RiskCapacityLimit extends BaseModel
{
    public $table = 'risk_capacity_limit';

    protected $primaryKey = 'id_capacity_limit';
    public $orderDefault = 'tahun';

    public $fillable = [
        'tahun',
        'kapasitas_risiko',
        'persentase_toleran',
        'risk_limit',
        'created_by',
        'modified_by',
        'created_by_desc',
        'modified_by_desc',
        'total_realisasi_eksposur_risiko_residual',
        'id_register',
        'deleted_by',
        'deleted_by_desc',
        'status'
    ];

    protected $casts = [
        'kapasitas_risiko' => 'decimal:2',
        'persentase_toleran' => 'decimal:2',
        'risk_limit' => 'decimal:2',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string',
        'total_realisasi_eksposur_risiko_residual' => 'decimal:2',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'tahun' => 'required',
        'kapasitas_risiko' => 'required|numeric',
        'persentase_toleran' => 'required|numeric',
        'risk_limit' => 'required|numeric',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'modified_by' => 'nullable',
        'deleted_at' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'modified_by_desc' => 'nullable|string|max:200',
        'total_realisasi_eksposur_risiko_residual' => 'nullable|numeric',
        'id_register' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_by_desc' => 'nullable|string|max:200'
    ];

    public function idRegister(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskRegister::class, 'id_register');
    }
    public static function laporan($params = [])
    {
        $paramarr = [];
        $where = "";
        if ($params["id_register"] && $params["id_register"] != 'null') {
            $where .= " and rs.id_register = ?";
            $paramarr[] = $params['id_register'];
        }
        if ($params["tahun"]) {
            $where .= " and tahun = ?";
            $paramarr[] = $params['tahun'] - 1;
        }

        $sql = "select rs.*
        from risk_capacity_limit rs
        where rs.deleted_at is null 
        $where";

        $rows = DB::select($sql, $paramarr);

        $no = 0;
        foreach ($rows as &$r) {
            $avg = DB::select("select 
            avg(total_realisasi_eksposur_risiko_residual/kapasitas_risiko*100) total
            from risk_capacity_limit 
            where deleted_at is null and id_register = ? and tahun <= ?", [$r->id_register, $r->tahun])[0]->total;

            $r->risk_appetite = $r->kapasitas_risiko * ceil($avg) / 100;
            $r->risk_tolerance = $r->risk_appetite * ((100 + $r->persentase_toleran) / 100);

            $r->risk_residual = DB::select("select sum((nilai_kemungkinan/100)*nilai_dampak)/1000000000 total
            from risk_profile_target_residual a 
            where exists(select 1 from risk_profile b where b.deleted_at is null 
            and a.id_risk_profile = b.id_risk_profile and b.id_register = ?) 
            and a.deleted_at is null and a.periode=?", [$r->id_register, ($r->tahun + 1) . 'Q4'])[0]->total;
        }
        return $rows;
    }
}
