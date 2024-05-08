<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\RisikoResourceController;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

/**
 * Class RiskProfileMitigasiAPIController
 */
class RiskProfileMitigasiAPIController extends RisikoResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskProfileMitigasi;
    }

    public function search($db, $search)
    {
        $ret = $db;
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


        $db = DB::table("risk_profile")
            ->leftJoin("risk_profile_penyebab", "risk_profile.id_risk_profile", "=", "risk_profile_penyebab.id_risk_profile")
            ->leftJoin("risk_profile_mitigasi", "risk_profile_penyebab.id_profile_penyebab", "=", "risk_profile_mitigasi.id_profile_penyebab")
            ->select(
                "risk_profile.*",
                "risk_profile_penyebab.id_profile_penyebab",
                "risk_profile_penyebab.nama as nama_penyebab",
                "risk_profile_mitigasi.id_mitigasi",
                "risk_profile_mitigasi.nama as nama_mitigasi",
            );
        $db = $this->search($db, $search);
        $db = $db->where("risk_profile.id_register", $id_register);

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



    protected function upsert($id, &$data)
    {
        $data["id_risk_profile"] = $this->data['rowheader']['id_risk_profile'];

        DB::beginTransaction();

        $ret = true;
        $timeline = $data['timeline'];
        unset($data['timeline']);
        if ($ret) {
            if ($id) {
                $ret = $this->model->update($id, $data);
                $data[$this->model->primaryKey] = $id;
            } else {
                $ret = $id = $this->model->insert($data);
                $data[$this->model->primaryKey] = $id;
            }

            if ($ret) {
                $id_mitigasi = $data[$this->model->primaryKey];
                $timem = new \App\Models\RiskProfileMitigasiTimeline();
                foreach ($timeline as $periode => $is_proses) {

                    if (!$ret)
                        break;

                    if (!$periode)
                        continue;

                    $rt = $timem->where("id_mitigasi", $id_mitigasi)->where("periode", $periode)->get();

                    if (isset($rt[0]))
                        $id_mitigasi_timeline = $rt[0]->id_mitigasi_timeline;
                    else
                        $id_mitigasi_timeline = null;

                    $rec = ["is_proses" => (int)$is_proses, "periode" => $periode, "id_mitigasi" => $id_mitigasi];
                    if ($id_mitigasi_timeline) {
                        $ret = $timem->update($id, $rec);
                    } else {
                        $ret = $id_mitigasi_timeline = $timem->insert($rec);
                    }
                    $data['timeline'][$periode] = $is_proses;
                    $data['id_mitigasi_timeline'][$periode] = $id_mitigasi_timeline;
                }
            }
        }

        if ($ret)
            DB::commit();
        else
            DB::rollBack();

        return $ret;
    }
    public function show($id_risk_profile = null, $id = null): JsonResponse
    {
        $record = $this->model->where("id_risk_profile", $id_risk_profile)->find($id);
        if (!$record) {
            return $this->failNotFound(sprintf(
                'item with id %d not found',
                $id
            ));
        }

        $timem = new \App\Models\RiskProfileMitigasiTimeline();
        $rows = $timem->where("id_mitigasi", $record->id_mitigasi)->get();
        $timeline = [];
        foreach ($rows as $r) {
            $timeline[$r->periode] = $r->is_proses;
        }
        $record->timeline = $timeline;

        return $this->respond($record);
    }
}
