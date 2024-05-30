<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\RisikoResourceController;
use Illuminate\Database\Query\JoinClause;
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
        $bulan = date("m");
        $tahun = date("Y");
        if (!empty($search['bulan']))
            $bulan = $search['bulan'];
        if (!empty($search['tahun']))
            $tahun = $search['tahun'];
        unset($search['bulan']);
        unset($search['tahun']);
        // $filter = $request->get('q');
        $page = $request->get('page') ?? 1;
        $limit = $request->get('pagesize') ?? $this->limit;


        $db = DB::table("risk_profile")
            ->leftJoin("risk_profile_penyebab", function (JoinClause $join) {
                $join->on('risk_profile.id_risk_profile', '=', 'risk_profile_penyebab.id_risk_profile')
                    ->whereRaw('risk_profile_penyebab.deleted_at is null');
            })
            ->leftJoin("risk_profile_mitigasi", function (JoinClause $join) {
                $join->on('risk_profile_penyebab.id_profile_penyebab', '=', 'risk_profile_mitigasi.id_profile_penyebab')
                    ->whereRaw('risk_profile_mitigasi.deleted_at is null');
            })
            ->select(
                "risk_profile.*",
                "risk_profile_penyebab.id_profile_penyebab",
                "risk_profile_penyebab.nama as nama_penyebab",
                "risk_profile_mitigasi.id_mitigasi",
                "risk_profile_mitigasi.nama as nama_mitigasi",
            );
        $db = $this->search($db, $search);
        $db = $db->where("risk_profile.id_register", $id_register);
        if ($bulan && $tahun) {
            $blnthn = $blnthn1 = $tahun . $bulan;
            $db = $db->whereRaw("to_char(coalesce(risk_profile.tgl_risiko,to_date(?,'YYYYMM')),'YYYYMM') <= ? 
			and to_char(coalesce(risk_profile.tgl_close,to_date(?,'YYYYMM')),'YYYYMM') >= ?", [$blnthn1, $blnthn1, $blnthn, $blnthn]);
        }

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
            $db = $db->orderByRaw($this->model->orderDefault);
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
        $items = [];
        foreach ($data->items() as $i) {
            $periode = $tahun . (int)$bulan;
            $rs = DB::select("select progress, biaya from risk_profile_mitigasi_realisasi where id_mitigasi = ? and periode = ?", [$i->id_mitigasi, $periode]);
            if($rs){
                $i->progress = $rs[0]->progress;
                $i->biaya = $rs[0]->biaya;
            }
            $items[] = $i;
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



    protected function upsert($id, &$data)
    {
        $data["id_risk_profile"] = $this->data['rowheader']['id_risk_profile'];

        DB::beginTransaction();

        $ret = true;
        $timeline = $data['timeline'];
        $id_jenis_perlakuan = $data['id_jenis_perlakuan'];
        unset($data['timeline']);
        unset($data['id_jenis_perlakuan']);
        if ($ret) {
            if ($id) {
                $ret = $this->model->update($id, $data);
                $data[$this->model->primaryKey] = $id;
            } else {
                $ret = $id = $this->model->insert($data);
                $data[$this->model->primaryKey] = $id;
            }

            $id_mitigasi = $data[$this->model->primaryKey];

            if ($ret) {
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
                        $ret = $timem->update($id_mitigasi_timeline, $rec);
                    } else {
                        $ret = $id_mitigasi_timeline = $timem->insert($rec);
                    }
                    $data['timeline'][$periode] = $is_proses;
                    $data['id_mitigasi_timeline'][$periode] = $id_mitigasi_timeline;
                }
            }


            if ($ret) {
                $jenism = new \App\Models\RiskProfileMitigasiJenis();
                $id_mitigasi_jenisarr = [];
                foreach ($id_jenis_perlakuan as $id_jenis_perlakuan) {

                    if (!$ret)
                        break;

                    if (!$periode)
                        continue;

                    $rt = $jenism->where("id_mitigasi", $id_mitigasi)->where("id_jenis_perlakuan", $id_jenis_perlakuan)->get();

                    if (isset($rt[0]))
                        $id_mitigasi_jenis = $rt[0]->id_mitigasi_jenis;
                    else
                        $id_mitigasi_jenis = null;

                    $rec = ["id_jenis_perlakuan" => $id_jenis_perlakuan, "id_mitigasi" => $id_mitigasi];
                    if ($id_mitigasi_jenis) {
                        $ret = $jenism->update($id_mitigasi_jenis, $rec);
                    } else {
                        $ret = $id_mitigasi_jenis = $jenism->insert($rec);
                    }
                    $data['id_mitigasi_jenis'][] = $id_mitigasi_jenis;

                    $id_mitigasi_jenisarr[] = $id_mitigasi_jenis;
                }

                if ($ret)
                    $ret = $jenism->where("id_mitigasi", $id_mitigasi)->whereNotIn(
                        "id_mitigasi_jenis",
                        $id_mitigasi_jenisarr
                    )->delete() !== false;
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

        $jenism = new \App\Models\RiskProfileMitigasiJenis();
        $rows = $jenism->where("id_mitigasi", $record->id_mitigasi)->get();
        $id_mitigasi_jenisarr = [];
        foreach ($rows as $r) {
            $id_mitigasi_jenisarr[] = $r->id_jenis_perlakuan;
        }
        $record->id_jenis_perlakuan = $id_mitigasi_jenisarr;

        return $this->respond($record);
    }
}
