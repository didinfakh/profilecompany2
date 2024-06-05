<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SysLog extends Model
{
    public $orderDefault = "id_log desc";
    use SoftDeletes;
    public function search($search)
    {
        $ret = $this;
        if (!empty($search)) {
            foreach ($search as $k => $v) {
                $hasLikeExpression = $this->getLikeExpression($v);
                if (!is_null($hasLikeExpression)) {
                    $ret = $ret->where($k, 'like', $v);
                } else {
                    $ret = $ret->where($k, $v);
                }
            }
        }

        return $ret;
    }

    private function getLikeExpression(String $value)
    {
        $position = 0;
        $firstCharacter = substr($value, 0, 1) == '%' ? 1 : 0;
        $endCharacter = substr($value, -1, 1) == '%' ? 2 : 0;
        $position = $position + $firstCharacter + $endCharacter;
        switch ($position) {
            case 1:
                return 'before';
                break;
            case 2:
                return 'after';
                break;
            case 3:
                return 'both';
                break;
            default:
                return null;
        }
    }

    public $table = 'sys_log';

    public $primaryKey = 'id_log';

    public $fillable = [
        'page',
        'activity',
        'data',
        'ip',
        'activity_time',
        'user_desc',
        'action',
        'table_name',
        'created_by',
        'modified_by',
        'created_by_desc',
        'modified_by_desc',
        'deleted_by',
        'deleted_by_desc'
    ];

    protected $casts = [
        'page' => 'string',
        'activity' => 'string',
        'ip' => 'string',
        'activity_time' => 'datetime',
        'user_desc' => 'string',
        'action' => 'string',
        'table_name' => 'string',
        'created_by_desc' => 'string',
        'modified_by_desc' => 'string',
        'deleted_by_desc' => 'string'
    ];

    public array $rules = [
        'page' => 'nullable|string|max:500',
        'activity' => 'nullable|string',
        'ip' => 'nullable|string|max:50',
        'activity_time' => 'nullable',
        'user_desc' => 'nullable|string|max:200',
        'action' => 'nullable|string|max:50',
        'table_name' => 'nullable|string|max:100',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'modified_by' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'modified_by_desc' => 'nullable|string|max:200',
        'deleted_at' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_by_desc' => 'nullable|string|max:200'
    ];
}
