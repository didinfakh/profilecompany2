<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class RiskSasaran extends BaseModel
{
    public $table = 'risk_sasaran';

    public $primaryKey = 'id_sasaran';

    public $fillable = [
        'nama',
        'hasil_yang_diharapkan',
        'nilai_risiko',
        'nilai_limit',
        'is_accept',
        'created_by',
        'updated_by',
        'created_by_desc',
        'updated_by_desc',
        'id_register',
        'deleted_by',
        'deleted_by_desc'
    ];

    protected $casts = [
        'nama' => 'string',
        'hasil_yang_diharapkan' => 'string',
        'nilai_risiko' => 'string',
        'nilai_limit' => 'string',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'id_sasaran' => 'required',
        'nama' => 'required|string|max:1000',
        'hasil_yang_diharapkan' => 'required|string|max:1000',
        'nilai_risiko' => 'required|string|max:1000',
        'strategi' => 'required',
        'nilai_limit' => 'nullable|string|max:1000',
        'is_accept' => 'nullable',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'updated_by' => 'nullable',
        'deleted_at' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'updated_by_desc' => 'nullable|string|max:200',
        'id_register' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_by_desc' => 'nullable|string|max:200'
    ];

    public function idRegister(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\RiskRegister::class, 'id_register');
    }

    public function riskSasaranStrategis(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(\App\Models\RiskSasaranStrategi::class, 'id_sasaran');
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
            $paramarr[] = $params['tahun'];
        }

        // DB::enableQueryLog();
        $sql = "select rs.*
        from risk_sasaran rs
        where rs.deleted_at is null 
        $where order by id_sasaran asc";

        $rows = DB::select($sql, $paramarr);
        // echo "<pre>";
        // var_dump( DB::getQueryLog());


        $no = 0;
        foreach ($rows as &$r) {
            $r->keputusan_penetapan = $r->is_accept? 'Accept' : 'Avoid';
            $rows1 = DB::select("select strategi as nama_strategi from risk_sasaran_strategi where deleted_at is null and id_sasaran = ?", [$r->id_sasaran]);
            // $arr = [];
            // foreach ($rows1 as $r1) {
            //     $arr[] = $r1->strategi;
            // }
            // $r->nama_strategi = implode(",", $arr);
            $r->strategis = $rows1;
        }
        return $rows;
    }
}
