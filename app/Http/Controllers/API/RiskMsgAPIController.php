<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\BaseResourceController;
use Illuminate\Database\Query\JoinClause;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;

/**
 * Class RiskMsgAPIController
 */
class RiskMsgAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskMsg;
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

        $db = $db->selectRaw("risk_msg.*, risk_msg_penerima.is_read");
        $db = $db->join("risk_msg_penerima", function (JoinClause $join) {
            $join->on('risk_msg_penerima.id_msg', '=', 'risk_msg.id_msg')
                ->whereRaw('risk_msg_penerima.deleted_at is null');
        });
        $db = $db->whereRaw("(id_kri_hasil is not null or id_lost_event is not null)");
        $db = $db->whereRaw(
            "risk_msg_penerima.id_user = ? 
            and (risk_msg_penerima.id_group = ? or risk_msg_penerima.id_group is null)",
            [$request->user()->id_user, session('id_group')]
        );

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



    public function index_task(Request $request): JsonResponse
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

        $db = $db->selectRaw("sys_group.nama as nama_group, mt_status_pengajuan.nama as status_pengajuan, risk_msg.*, risk_msg_penerima.is_read");
        $db = $db->join("risk_msg_penerima", function (JoinClause $join) {
            $join->on('risk_msg_penerima.id_msg', '=', 'risk_msg.id_msg')
                ->whereRaw('risk_msg_penerima.deleted_at is null');
        });
        $db = $db->leftJoin("sys_group", function (JoinClause $join) {
            $join->on('sys_group.id_group', '=', 'risk_msg.id_group')
                ->whereRaw('sys_group.deleted_at is null');
        });
        $db = $db->leftJoin("mt_status_pengajuan", function (JoinClause $join) {
            $join->on('mt_status_pengajuan.id_status_pengajuan', '=', 'risk_msg.id_status_pengajuan')
                ->whereRaw('mt_status_pengajuan.deleted_at is null');
        });


        $db = $db->whereRaw("(id_kri_hasil is null and id_lost_event is null)");
        $db = $db->whereRaw(
            "risk_msg_penerima.id_user = ? 
            and (risk_msg_penerima.id_group = ? or risk_msg_penerima.id_group is null)",
            [$request->user()->id_user, session('id_group')]
        );

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
                $db = $db->orderByRaw("risk_msg." . trim($v));
        } else if ($this->model->primaryKey) {
            $db = $db->orderByRaw("risk_msg." . $this->model->primaryKey);
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
