<?php

namespace App\Http\Controllers;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class RiskProfileResourceController extends ResourceController
{
    /**
     *
     * @var int limit data to show
     */
    protected $limit = 10;

    protected $data = [];

    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return array	an array
     */

    public function index($id_register = null, Request $request): JsonResponse
    {
        $search = $request->get('q');
        if ($search) {
            if (!empty($search['nama']))
                $search['nama'] = "%" . $search['nama'] . "%";
            if (!empty($search['kode']))
                $search['kode'] = "%" . $search['kode'] . "%";
        }
        // $filter = $request->get('q');
        $page = $request->get('page') ?? 1;
        $limit = $request->get('pagesize') ?? $this->limit;
        $db = $this->model->search($search);
        $db = $db->where("id_register", $id_register);
        $orderby = $request->get('order');
        if ($orderby) {
            $orderby = explode(",", $orderby);
            if (!is_array($orderby))
                $orderby = array($orderby);

            foreach ($orderby as $v) {
                $exp = explode(" ", $v);
                $column = $exp[0];
                if ($exp[1])
                    $sc = $exp[1];

                $db = $db->orderBy($column, $sc);
            }
        } else if ($this->model->orderDefault) {
            $db = $db->orderBy($this->model->orderDefault);
        } else if ($this->model->primaryKey) {
            $db = $db->orderBy($this->model->primaryKey);
        }

        // if($filter)
        // 	$db = $db->where($filter);
        $data = $db->paginate($limit);
        // $pagination = [
        // 	'currentPage' => $this->model->pager->getCurrentPage(),
        // 	'totalPage' => $this->model->pager->getPageCount(),
        // ];
        // dd($data->items);
        return $this->respond([
            'page' => $data->currentPage(),
            'page_size' => $data->perPage(),
            'data' => $data->items(),
            'total_page' => ceil($data->total() / $limit),
            'total_records' => $data->total()
        ]);
        // return $this->respond([
        //     'page' => $this->model->pager->getCurrentPage(),
        //     'page_size' => $limit,
        //     'data' => $data,
        //     'total_page' => $this->model->pager->getPageCount(),
        //     'total_records' => $this->model->pager->getDataCount()
        // ]);
    }

    /**
     * Return the properties of a resource object
     *
     * @return array	an array
     */
    public function show($id_register = null, $id = null): JsonResponse
    {
        $record = $this->model->where("id_register", $id_register)->find($id);
        if (!$record) {
            return $this->failNotFound(sprintf(
                'item with id %d not found',
                $id
            ));
        }

        return $this->respond($record);
    }


    protected function _beforeDetail($id_register = null)
    {
        $rrm = new \App\Models\RiskRegister();
        $this->data['rowheader'] = $rrm->find($id_register);
    }

    /**
     * Create a new resource object, from "posted" parameters
     *
     * @return array	an array
     */


    public function store($id_register = null, Request $request): JsonResponse
    {
        $request->validate($this->model->rules);

        $this->_beforeDetail($id_register);

        $data = $request->all();
        $ret = $this->upsert(null, $data);
        if ($ret)
            return $this->respondCreated($data, 'data created');
        else
            return $this->fail("insert failed");
    }

    public function update($id_register = null, $id = null, Request $request): JsonResponse
    {
        $request->validate($this->model->rules);

        $this->_beforeDetail($id_register);

        if (!$this->model->where("id_register", $id_register)->find($id)) {
            return $this->failNotFound(sprintf(
                'item with id %d not found',
                $id
            ));
        }

        $data = $request->all();
        $ret = $this->upsert($id, $data);
        if ($ret)
            return $this->respond($data, 200, 'data updated');
        else
            return $this->fail("update failed");
    }

    protected function upsert($id, &$data)
    {
        $data["id_register"] = $this->data['rowheader']['id_register'];

        DB::beginTransaction();

        $ret = true;

        if ($ret) {
            if ($id) {
                $ret = $this->model->update($id, $data);
                $data[$this->model->primaryKey] = $id;
            } else {
                $ret = $id = $this->model->insert($data);
                $data[$this->model->primaryKey] = $id;
            }
        }

        if ($ret)
            DB::commit();
        else
            DB::rollBack();

        return $ret;
    }

    /**
     * Delete the designated resource object from the model
     *
     * @return array	an array
     */
    public function destroy($id_register = null, $id = null): JsonResponse
    {
        if (!$model = $this->model->where("id_register", $id_register)->find($id)) {
            return $this->failNotFound(sprintf(
                'item with id %d not found',
                $id
            ));
        }

        $ret = $model->delete();
        if (!$ret) {
            return $this->failNotFound(sprintf(
                'item with id %d not found or already deleted',
                $id
            ));
        }

        return $this->respondDeleted(['id' => $id], 'data deleted');
    }

    protected function filterArray($array, $filter)
    {
        return array_values(array_filter($array, $filter))[0];
    }
}
