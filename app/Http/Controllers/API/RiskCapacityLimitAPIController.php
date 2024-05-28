<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\RiskProfileResourceController;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

/**
 * Class RiskCapacityLimitAPIController
 */
class RiskCapacityLimitAPIController extends RiskProfileResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskCapacityLimit;
    }

    public function eksposur($id_register = null, $tahun = null)
    {
        $row = DB::select("select 
        sum(total_realisasi_eksposur_risiko_residual/kapasitas_risiko*100) total, 
        count(1) jumlah 
        from risk_capacity_limit 
        where deleted_at is null and id_register = ? 
        and tahun < ?", [$id_register, $tahun]);

        $residual = DB::select("select sum((nilai_kemungkinan/100)*nilai_dampak)/1000000000 total
        from risk_profile_target_residual a 
        where exists(select 1 from risk_profile b where b.deleted_at is null and  a.id_risk_profile = b.id_risk_profile and b.id_register = ?) 
        and a.deleted_at is null 
        and a.periode=?", [$id_register, ($tahun + 1) . 'q4'])[0]->total;

        $ret = $row[0];
        $ret->residual = $residual;
        return $this->respond($ret);
    }


    public function store($id_register = null, Request $request): JsonResponse
    {
        $request->validate($this->model->rules);

        $this->_beforeDetail($id_register);

        $data = $request->all();
        $data['status'] = 'Draft';
        $ret = $this->upsert(null, $data);
        if ($ret)
            return $this->respondCreated($data, 'data created');
        else
            return $this->fail("insert failed");
    }


    public function index($id_register = null, Request $request): JsonResponse
    {
        $this->_beforeDetail($id_register);
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
        $rows = [];
        foreach ($data->items() as $r) {

            $avg = DB::select("select 
            avg(case when kapasitas_risiko <> 0 and kapasitas_risiko is not null then total_realisasi_eksposur_risiko_residual/kapasitas_risiko*100 else 0 end) total
            from risk_capacity_limit 
            where deleted_at is null and id_register = ? and tahun <= ?", [$r->id_register, $r->tahun])[0]->total;

            $r->risk_appetite = $r->kapasitas_risiko * ceil($avg) / 100;
            $r->risk_tolerance = $r->risk_appetite * ((100 + $r->persentase_toleran) / 100);

            $residual = DB::select("select sum((nilai_kemungkinan/100)*nilai_dampak)/1000000000 total
            from risk_profile_target_residual a 
            where exists(select 1 from risk_profile b where b.deleted_at is null 
            and a.id_risk_profile = b.id_risk_profile and b.id_register = ?) 
            and a.deleted_at is null and a.periode=?", [$r->id_register, ($r->tahun + 1) . 'q4'])[0]->total;

            if ($this->data['rowheader']->id_assessment_type == 1) {
                $r['risk_limit_corporate'] = $r['risk_limit'];
                $r['risk_limit_divisi'] = DB::select(
                    "select sum(risk_limit) total from risk_capacity_limit rcl 
                    where tahun = ? and 
                    deleted_at is null and 
                    exists(select 1 from risk_register rr 
                    where rr.id_register = rcl.id_register 
                    and rr.id_assessment_type = 2)",
                    [$r->tahun]
                )[0]->total;

                $r['risk_limit_proyek'] = DB::select(
                    "select sum(risk_limit) total from risk_capacity_limit rcl 
                    where tahun = ? and 
                    deleted_at is null and 
                    exists(select 1 from risk_register rr 
                    where rr.id_register = rcl.id_register 
                    and rr.id_assessment_type in (3,4))",
                    [$r->tahun]
                )[0]->total;
            }


            if ($this->data['rowheader']->id_assessment_type == 2) {
                $r['risk_limit_corporate'] = DB::select(
                    "select sum(risk_limit) total from risk_capacity_limit rcl 
                    where tahun = ? and 
                    deleted_at is null and 
                    exists(select 1 from risk_register rr 
                    where rr.id_register = rcl.id_register 
                    and rr.id_assessment_type = 1)",
                    [$r->tahun]
                )[0]->total;

                $r['risk_limit_divisi'] = $r['risk_limit'];

                $r['risk_limit_proyek'] = DB::select(
                    "select sum(risk_limit) total from risk_capacity_limit rcl 
                    where tahun = ? and 
                    deleted_at is null and 
                    exists(select 1 from risk_register rr 
                    where rr.id_register = rcl.id_register 
                    and rr.id_assessment_type in (3,4) 
                    and rr.id_unit = ?)",
                    [$r->tahun, $this->data['rowheader']->id_unit]
                )[0]->total;
            }


            if ($this->data['rowheader']->id_assessment_type == 3 or $this->data['rowheader']->id_assessment_type == 4) {
                $r['risk_limit_corporate'] = DB::select(
                    "select sum(risk_limit) total from risk_capacity_limit rcl 
                    where tahun = ? and 
                    deleted_at is null and 
                    exists(select 1 from risk_register rr 
                    where rr.id_register = rcl.id_register 
                    and rr.id_assessment_type = 1)",
                    [$r->tahun]
                )[0]->total;

                $r['risk_limit_divisi'] = DB::select(
                    "select sum(risk_limit) total from risk_capacity_limit rcl 
                    where tahun = ? and 
                    deleted_at is null and 
                    exists(select 1 from risk_register rr 
                    where rr.id_register = rcl.id_register 
                    and rr.id_assessment_type = 2 
                    and rr.id_unit = ?)",
                    [$r->tahun, $this->data['rowheader']->id_unit]
                )[0]->total;

                $r['risk_limit_proyek'] = $r['risk_limit'];
            }

            $r['risk_residual'] = $residual;
            $rows[] = $r;
        }
        return $this->respond([
            'page' => $data->currentPage(),
            'page_size' => $data->perPage(),
            'data' => $rows,
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
