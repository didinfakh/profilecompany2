<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\URL;

class BaseModel extends Model
{

    public function escape($k)
    {
        return trim(DB::escape($k), "'");
    }
    public $orderDefault;
    use SoftDeletes;
    public function search($search)
    {
        $ret = $this;
        if (!empty($search)) {
            foreach ($search as $k => $v) {
                $hasLikeExpression = $this->getLikeExpression($v);
                if (!is_null($hasLikeExpression)) {
                    $ret = $ret->whereRaw("lower(" . $this->escape($k) . ") like ?", [strtolower($v)]);
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

    // /**
    //  * Rec : action, table_name, activity
    //  */

    public function log($aktivitas)
    {
        $this->logging(["activity" => $aktivitas]);
    }
    public function logging($rec = array())
    {
        $rec['page'] = URL::current();
        $rec['ip'] = $_SERVER["REMOTE_ADDR"];
        $rec['activity_time'] = date("Y-m-d H:i:s");

        // $user_desc = "User";
        // $user_desc .= "#" . (auth()->user() ? auth()->user()->name : null);

        $user_desc = (auth()->user() ? auth()->user()->name : null);
        $rec['user_desc'] = $user_desc;

        $rec["data"] = json_encode((array)$rec["data"]);
        // $rec["activity"] = '';

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
        // $this->formatData($data);
        // $this->setValidationRulesCreated();
        // $this->db->debug = 1;
        // $ret = parent::insert($data, $returnID);

        // if ($this->informationSchemas['created_by']) {
        $data['created_by'] = (auth()->user() ? auth()->user()->id_user : null);
        // }
        // if ($this->informationSchemas['created_by_desc']) {
        $data['created_by_desc'] = (auth()->user() ? auth()->user()->name : null);
        // }
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
                    'activity' => 'Menambah data',
                    "data" => $data
                )
            );
        }

        return $ret;
    }


    private function formatData(&$data)
    {
        $data = (array)$data;
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

        if ($data[$this->primaryKey]) {
            // unset($data['created_date']);
            // unset($data['created_by']);
            // unset($data['created_by_desc']);
            // if ($this->informationSchemas['updated_date']) {
            //     $data['updated_date'] = date("Y-m-d H:i:s");
            // }
            if ($this->informationSchemas['updated_by']) {
                $data['updated_by'] = (auth()->user() ? auth()->user()->id_user : null);
            }
            if ($this->informationSchemas['updated_by_desc']) {
                $data['updated_by_desc'] = (auth()->user() ? auth()->user()->name : null);
            }
        } else {
            // unset($data['updated_date']);
            // unset($data['updated_by']);
            // unset($data['updated_by_desc']);
            // if ($this->informationSchemas['created_date']) {
            //     $data['created_date'] = date("Y-m-d H:i:s");
            // }
            if ($this->informationSchemas['created_by']) {
                $data['created_by'] = (auth()->user() ? auth()->user()->id_user : null);
            }
            if ($this->informationSchemas['created_by_desc']) {
                $data['created_by_desc'] = (auth()->user() ? auth()->user()->name : null);
            }
        }
    }

    public function delete($id = null, bool $purge = false, $data = [])
    {
        // if (!$data) {
        //     $data = $this->find($id);
        //     if (!$data)
        //         return false;
        // }


        // // if ($this->informationSchemas['created_by']) {
        // $data['deleted_by'] = (auth()->user() ? auth()->user()->id_user : null);
        // // }
        // // if ($this->informationSchemas['created_by_desc']) {
        // $data['deleted_by_desc'] = (auth()->user() ? auth()->user()->name : null);
        // }

        // $this->formatData($data);
        $ret = parent::delete($id, $purge);
        // var_dump($ret);
        if ($ret) {
            // if (is_array($data))
            //     $data[$this->primaryKey] = $id;
            // else
            //     $data->{$this->primaryKey} = $id;

            // $this->logging(
            //     array(
            //         "action" => "delete",
            //         "table_name" => $this->table,
            //         "activity" => $data
            //     )
            // );
        }

        return $ret;
    }

    protected function runSoftDelete()
    {
        $query = $this->setKeysForSaveQuery($this->newModelQuery());

        $time = $this->freshTimestamp();

        $columns = [$this->getDeletedAtColumn() => $this->fromDateTime($time)];

        $this->{$this->getDeletedAtColumn()} = $time;

        if ($this->usesTimestamps() && !is_null($this->getUpdatedAtColumn())) {
            $this->{$this->getUpdatedAtColumn()} = $time;

            $columns[$this->getUpdatedAtColumn()] = $this->fromDateTime($time);
        }

        $columns['deleted_by'] = (auth()->user() ? auth()->user()->id_user : null);
        $columns['deleted_by_desc'] = (auth()->user() ? auth()->user()->name : null);

        $query->update($columns);

        $this->syncOriginalAttributes(array_keys($columns));

        $this->fireModelEvent('trashed', false);
    }

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
    public function update($id = null, $data = null, $data_before = []): bool
    {
        if (!$id)
            return false;

        if (!$data_before && $id) {
            // print_r($id);
            $data_before = $this->where($this->primaryKey, $id)->first();
            // print_r( DB::getQueryLog());
            // print_r($data_before);
            if (!$data_before)
                return false;
        }

        // if ($this->informationSchemas['updated_by']) {
        $data['updated_by'] = (auth()->user() ? auth()->user()->id_user : null);
        // }
        // if ($this->informationSchemas['updated_by_desc']) {
        $data['updated_by_desc'] = (auth()->user() ? auth()->user()->name : null);
        // }
        // $this->formatData($data);
        // $this->setValidationRulesUpdated($data);
        $ret = $this->where($this->primaryKey, $id)->update($data);

        if ($ret) {
            $this->logging(
                array(
                    "action" => "update",
                    "table_name" => $this->table,
                    'activity' => 'Mengubah data',
                    "data" => [
                        "before" => $data_before,
                        "after" => $data
                    ]
                )
            );
        }

        return $ret;
    }
}
