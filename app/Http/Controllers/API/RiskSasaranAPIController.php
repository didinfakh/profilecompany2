<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\RiskProfileResourceController;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

/**
 * Class RiskSasaranAPIController
 */
class RiskSasaranAPIController extends RiskProfileResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskSasaran;
    }

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
        $sasaranm = new \App\Models\RiskSasaranStrategi();
        foreach ($data->items() as &$r) {
            $rowssasaran = $sasaranm->where('id_sasaran', $r->id_sasaran)->get();
            $arr = [];
            $no = 1;
            foreach ($rowssasaran as $r1) {
                $arr[] = $no . ". " . $r1->strategi;
                $no++;
            }
            $r->strategi = implode("\n", $arr);
        }
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

    protected function upsert($id, &$data)
    {
        $data["id_register"] = $this->data['rowheader']['id_register'];

        $strategim = new \App\Models\RiskSasaranStrategi();

        DB::beginTransaction();

        $strategi = $data['strategi'];
        unset($data['strategi']);
        $ret = true;

        if ($ret) {
            if ($id) {
                $ret = $this->model->update($id, $data);
                $data[$this->model->primaryKey] = $id;
            } else {
                $data['is_accept'] = null;
                $ret = $id = $this->model->insert($data);
                $data[$this->model->primaryKey] = $id;
            }
        }

        $id_sasaran_strategiarr = [];
        if ($strategi) {
            foreach ($strategi as $p) {
                if (!$ret)
                    break;

                $p['id_sasaran'] = $data['id_sasaran'];

                if (!empty($p['id_sasaran_strategi']))
                    $ret = $strategim->update($p['id_sasaran_strategi'], $p);
                else {
                    $p['id_sasaran_strategi'] = $ret = $strategim->insert($p);
                }
                $id_sasaran_strategiarr[] = $p['id_sasaran_strategi'];
            }
        }
        if ($id_sasaran_strategiarr)
            $ret = $strategim->where("id_sasaran", $data['id_sasaran'])->whereNotIn("id_sasaran_strategi", $id_sasaran_strategiarr)->delete() !== false;

        if ($ret)
            DB::commit();
        else
            DB::rollBack();

        return $ret;
    }


    public function show($id_register = null, $id = null): JsonResponse
    {
        $record = $this->model->where("id_register", $id_register)->find($id);
        if (!$record) {
            return $this->failNotFound(sprintf(
                'item with id %d not found',
                $id
            ));
        }

        $sasaranm = new \App\Models\RiskSasaranStrategi();
        $record['strategi'] = $sasaranm->where('id_sasaran', $id)->get();

        return $this->respond($record);
    }


    public function approve($id_register = null, $id = null, $jenis, Request $request): JsonResponse
    {

        $this->_beforeDetail($id_register);

        if (!$data_before = $this->model->where("id_register", $id_register)->find($id)) {
            return $this->failNotFound(sprintf(
                'item with id %d not found',
                $id
            ));
        }

        $updateData = [];
        $updateData['is_accept'] = $jenis;
        $ret = $this->model->update($id, $updateData, $data_before);

        if ($ret)
            return $this->respond($updateData, 200, 'data updated');
        else
            return $this->fail("update failed");
    }
}
