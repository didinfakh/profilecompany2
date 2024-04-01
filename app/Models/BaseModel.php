<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\URL;

class BaseModel extends Model
{
    use SoftDeletes;
    public function search($search)
    {
        if (!empty($search)) {
            foreach ($search as $k => $v) {
                $hasLikeExpression = $this->getLikeExpression($v);
                if (!is_null($hasLikeExpression)) {
                    $this->where($k, 'like', $v);
                } else {
                    $this->where($k, $v);
                }
            }
        }
        return $this;
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

    // /**
    //  * Rec : action, table_name, activity
    //  */
    protected function logging($rec = array())
    {
        $rec['page'] = URL::current();
        $rec['ip'] = $_SERVER["REMOTE_ADDR"];
        $rec['activity_time'] = date("Y-m-d H:i:s");

        $user_desc = "User";
        $user_desc .= "#" . (auth()->user() ? auth()->user()->name : null);
        $rec['user_desc'] = $user_desc;

        $rec["activity"] = json_encode((array)$rec["activity"]);

        $log = new \App\Models\SysLog();
        $log->insert($rec);
    }

    // /**
    //  * Inserts data into the current table. If an object is provided,
    //  * it will attempt to convert it to an array.
    //  *
    //  * @param array|object $data
    //  * @param boolean      $returnID Whether insert ID should be returned or not.
    //  *
    //  * @return BaseResult|integer|string|false
    //  * @throws \ReflectionException
    //  */
    public function insert($data = null)
    {
        $this->formatData($data);
        // $this->setValidationRulesCreated();
        // $this->db->debug = 1;
        // $ret = parent::insert($data, $returnID);

        $ret = $this->create($data)->{$this->primaryKey};
        // $query = $this->db->getLastQuery();
        // echo (string) $query;
        if ($ret) {
            if (is_array($data))
                $data[$this->primaryKey] = $ret;
            else
                $data->{$this->primaryKey} = $ret;

            $this->logging(
                array(
                    "action" => "insert",
                    "table_name" => $this->table,
                    "activity" => $data
                )
            );
        }

        return $ret;
    }


    private function formatData(&$data)
    {
        // $temp = (array)$data;
        // $data = [];
        // foreach ($this->informationSchemas as $k => $v) {
        //     if (in_array($k, array_keys($temp))) {
        //         $val = $temp[$k];

        //         if (strstr($k, 'is_') && !strstr($k, 'is_', true))
        //             $val = (int)$val;

        //         if ($v['type'] == 'integer') {
        //             if ($val === '') {
        //                 if ($this->validationRules[$k]) {
        //                     if (strstr($this->validationRules[$k], "required") === false)
        //                         unset($this->validationRules[$k]);
        //                 }

        //                 $val = null;
        //             } else
        //                 $val = (int)$val;
        //         }

        //         if ($v['type'] == 'date') {
        //             if ($val === '') {
        //                 if ($this->validationRules[$k]) {
        //                     if (strstr($this->validationRules[$k], "required") === false)
        //                         unset($this->validationRules[$k]);
        //                 }

        //                 $val = null;
        //             }
        //         }

        //         if ($v['type'] == 'decimal') {
        //             $val = (float)$val;
        //         }

        //         $data[$k] = $val;
        //     } else {
        //         if (($v['type'] == 'integer' || $v['type'] == 'decimal') && $this->validationRules[$k]) {
        //             if (strstr($this->validationRules[$k], "required") === false)
        //                 unset($this->validationRules[$k]);
        //         }
        //     }
        // }
    }

    // public function delete($id = null, bool $purge = false)
    // {
    //     $data = $this->find($id);
    //     if (!$data)
    //         return false;

    //     $ret = parent::delete($id, $purge);
    //     if ($ret) {
    //         if (is_array($data))
    //             $data[$this->primaryKey] = $id;
    //         else
    //             $data->{$this->primaryKey} = $id;

    //         $this->logging(
    //             array(
    //                 "action" => "delete",
    //                 "table_name" => $this->table,
    //                 "activity" => $data
    //             )
    //         );
    //     }

    //     return $ret;
    // }

    // /**
    //  * Updates a single record in $this->table. If an object is provided,
    //  * it will attempt to convert it into an array.
    //  *
    //  * @param integer|array|string $id
    //  * @param array|object         $data
    //  *
    //  * @return boolean
    //  * @throws \ReflectionException
    //  */
    public function update($id = null, $data = null): bool
    {
        $this->formatData($data);
        // $this->setValidationRulesUpdated($data);
        $ret = $this->where($this->primaryKey, $id)->update($data);

        if ($ret) {
            $this->logging(
                array(
                    "action" => "update",
                    "table_name" => $this->table,
                    "activity" => $data
                )
            );
        }

        return $ret;
    }
}
