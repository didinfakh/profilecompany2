<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\RiskProfileResourceController;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

/**
 * Class RiskProfileMitigasiAPIController
 */
class RiskProfileMitigasiAPIController extends RiskProfileResourceController
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
}
