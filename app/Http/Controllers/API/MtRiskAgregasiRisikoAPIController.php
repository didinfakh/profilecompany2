<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\BaseResourceController;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

/**
 * Class MtRiskAgregasiRisikoAPIController
 */
class MtRiskAgregasiRisikoAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\MtRiskAgregasiRisiko;
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
        // $id_kelompok_bisnis = null;
        // if ($search['id_kelompok_bisnis'])
        //     $id_kelompok_bisnis = $search['id_kelompok_bisnis'];

        // unset($search['id_kelompok_bisnis']);
        // $filter = $request->get('q');
        $page = $request->get('page') ?? 1;
        $limit = $request->get('pagesize') ?? $this->limit;
        $db = $this->model->search($search);
        // if ($id_kelompok_bisnis) {
        //     $db = $db->where("");
        // }
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
        $kelompokm = new \App\Models\MtRiskAgregasiKelompokBisnis();
        $kelompokmm = new \App\Models\MtSdmKelompokBisnis();
        $items = [];
        foreach ($data->items() as $r) {
            $rows = $kelompokm->where("id_risk_agregasi_risiko", $r->id_risk_agregasi_risiko)->get();
            $id_agregasi_kelompok_bisnisarr = [];
            foreach ($rows as $r1) {
                $id_agregasi_kelompok_bisnisarr[] = $kelompokmm->find($r1->id_kelompok_bisnis)->nama;
            }
            $r->nama_kelompok_bisnis = implode(",", $id_agregasi_kelompok_bisnisarr);
            $items[] = $r;
        }
        return $this->respond([
            'page' => $data->currentPage(),
            'page_size' => $data->perPage(),
            'data' => $items,
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

    public function show($id = null): JsonResponse
    {
        $record = $this->model->find($id);
        if (!$record) {
            return $this->failNotFound(sprintf(
                'item with id %d not found',
                $id
            ));
        }

        $kelompokm = new \App\Models\MtRiskAgregasiKelompokBisnis();
        $rows = $kelompokm->where("id_risk_agregasi_risiko", $record->id_risk_agregasi_risiko)->get();
        $id_agregasi_kelompok_bisnisarr = [];
        foreach ($rows as $r) {
            $id_agregasi_kelompok_bisnisarr[] = $r->id_kelompok_bisnis;
        }
        $record->id_kelompok_bisnis = $id_agregasi_kelompok_bisnisarr;

        return $this->respond($record);
    }

    public function store(Request $request): JsonResponse
    {
        $request->validate($this->model->rules);

        $data = $request->all();
        $ret = $this->upsert(null, $data);
        if ($ret)
            return $this->respondCreated($data, 'data created');
        else
            return $this->fail("insert failed");
    }

    public function update($id = null, Request $request): JsonResponse
    {
        $request->validate($this->model->rules);

        if (!$this->model->find($id)) {
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
        DB::beginTransaction();

        $ret = true;
        $id_kelompok_bisnis = $data['id_kelompok_bisnis'];
        unset($data['id_kelompok_bisnis']);

        if ($ret) {
            if ($id) {
                $ret = $this->model->update($id, $data);
                $data[$this->model->primaryKey] = $id;
            } else {
                $ret = $id = $this->model->insert($data);
                $data[$this->model->primaryKey] = $id;
            }
        }


        if ($ret) {
            $kelompokm = new \App\Models\MtRiskAgregasiKelompokBisnis();
            $id_agregasi_kelompok_bisnisarr = [];
            foreach ($id_kelompok_bisnis as $id_kelompok_bisnis) {

                if (!$ret)
                    break;

                $rt = $kelompokm->where("id_risk_agregasi_risiko", $id)->where("id_kelompok_bisnis", $id_kelompok_bisnis)->get();

                if (isset($rt[0]))
                    $id_agregasi_kelompok_bisnis = $rt[0]->id_agregasi_kelompok_bisnis;
                else
                    $id_agregasi_kelompok_bisnis = null;

                $rec = ["id_kelompok_bisnis" => $id_kelompok_bisnis, "id_risk_agregasi_risiko" => $id];
                if ($id_agregasi_kelompok_bisnis) {
                    $ret = $kelompokm->update($id_agregasi_kelompok_bisnis, $rec);
                } else {
                    $ret = $id_agregasi_kelompok_bisnis = $kelompokm->insert($rec);
                }
                $data['id_agregasi_kelompok_bisnis'][] = $id_agregasi_kelompok_bisnis;

                $id_agregasi_kelompok_bisnisarr[] = $id_agregasi_kelompok_bisnis;
            }

            if ($ret)
                $ret = $kelompokm->where("id_risk_agregasi_risiko", $id)->whereNotIn(
                    "id_agregasi_kelompok_bisnis",
                    $id_agregasi_kelompok_bisnisarr
                )->delete() !== false;
        }

        if ($ret)
            DB::commit();
        else
            DB::rollBack();

        return $ret;
    }
}
