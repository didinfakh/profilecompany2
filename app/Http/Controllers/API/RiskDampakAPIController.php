<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\BaseResourceController;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

/**
 * Class RiskDampakAPIController
 */
class RiskDampakAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskDampak;
    }

    public function index(Request $request): JsonResponse
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
            $exp = explode(",", $this->model->orderDefault);
            if (!is_array($exp))
                $exp = array($exp);

            foreach ($exp as $v)
                $db = $db->orderByRaw(trim($v));
        } else if ($this->model->primaryKey) {
            $db = $db->orderBy($this->model->primaryKey);
        }

        if (empty(session('access')["dashboard"]["view_all"])) {
            $db = $db->whereRaw("(id_unit = ? or status='Aktif')", [session('id_unit')]);
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

    public function approve($id = null, Request $request): JsonResponse
    {
        if (!$data_before = $this->model->find($id)) {
            return $this->failNotFound(sprintf(
                'item with id %d not found',
                $id
            ));
        }

        $updateData = [];
        $updateData['status'] = 'Aktif';
        $ret = $this->model->update($id, $updateData, $data_before);

        return $this->respond($updateData, 200, 'data updated');
    }


    /**
     * Create a new resource object, from "posted" parameters
     *
     * @return array	an array
     */
    public function store(Request $request): JsonResponse
    {
        $request->validate($this->model->rules);

        $data = $request->all();
        $data['status'] = 'Draft';
        $id = $this->model->insert($data);
        // if (!$id) {
        //     return $this->fail($this->model->errors());
        // }
        $data[$this->model->primaryKey] = $id;

        return $this->respondCreated($data, 'data created');
    }
}
