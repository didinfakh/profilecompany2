<?php

namespace App\Http\Controllers;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;


class BaseResourceController extends ResourceController
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
                $db = $db->orderBy(trim($v));
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
    public function show($id = null): JsonResponse
    {
        $record = $this->model->find($id);
        if (!$record) {
            return $this->failNotFound(sprintf(
                'item with id %d not found',
                $id
            ));
        }

        return $this->respond($record);
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
        $id = $this->model->insert($data);
        // if (!$id) {
        //     return $this->fail($this->model->errors());
        // }
        $data[$this->model->primaryKey] = $id;

        return $this->respondCreated($data, 'data created');
    }

    /**
     * Add or update a model resource, from "posted" properties
     *
     * @return array	an array
     */
    public function update($id = null, Request $request): JsonResponse
    {
        $request->validate($this->model->rules);

        if (!$data_before = $this->model->find($id)) {
            return $this->failNotFound(sprintf(
                'item with id %d not found',
                $id
            ));
        }

        // $data       = $request->getRawInput();		
        // $updateData = array_filter($data);
        $updateData = $request->all();
        $ret = $this->model->update($id, $updateData, $data_before);
        // if (!$ret) {
        //     return $this->fail($this->model->errors());
        // }
        return $this->respond($updateData, 200, 'data updated');
    }

    /**
     * Delete the designated resource object from the model
     *
     * @return array	an array
     */
    public function destroy($id = null): JsonResponse
    {
        if (!$model = $this->model->find($id)) {
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



    function GenerateTreeEasyUi(
        &$row,
        $colparent,
        $colid,
        $collabel,
        $valparent = null,
        $level = 0,
        $idarr = array(),
        $assessment = array(),

    ) {

        if (!empty($idarr[$valparent]))
            return;

        $idarr[$valparent] = 1;

        $level++;
        $return = [];
        $i = 0;
        foreach ($row as $idkey => $value) {
            # code...

                if(isset($assessment[$value->id_assessment_type])){
                    $value->text = $value->{$collabel} . ' ('.$assessment[$value->id_assessment_type].')';
                }else{
                    $value->text = $value->{$collabel};
                }
                $value->id = $value->{$colid};

            if (trim($value->{$colparent}) == trim($valparent) && ($value->{$colparent} or $valparent === null)) {

                if (!empty($idarr[$value->{$colid}]))
                    $value->{$colparent} = null;

                unset($row[$idkey]);

                $val = $value;
                $val->id = $value->{$colid};
                if(isset($assessment[$value->id_assessment_type])){
                    $value->text = $value->{$collabel} . ' ('.$assessment[$value->id_assessment_type].')';
                }else{
                    $value->text = $value->{$collabel};
                }
                $children = $this->GenerateTreeEasyUi($row, $colparent, $colid, $collabel, $value->{$colid}, $level, $idarr,$assessment);
                $val->children = $children;
                $return[$i] = $val;
                $i++;
            }
        }

        if (!$valparent && $row) {
            foreach ($row as $k => $v) {
                $row[$k]->{$colparent} = null;
            }

            $return = array_merge($return, $row);
        }

        return $return;
    }
}
