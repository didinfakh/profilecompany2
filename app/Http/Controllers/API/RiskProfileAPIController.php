<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\RiskProfileResourceController;
use Illuminate\Support\Facades\DB;

/**
 * Class RiskProfileAPIController
 */
class RiskProfileAPIController extends RiskProfileResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskProfile;
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
        $mts = DB::select("select a.id_kemungkinan, a.id_dampak, a.skala, b.nama, b.warna, b.penanganan 
        from mt_risk_matrix a 
        join mt_risk_tingkat b on a.id_tingkat = b.id_tingkat
        where a.deleted_at is null 
        and b.deleted_at is null 
        and a.jenis = ?", [$search['jenis']]);
        $rmt = [];
        foreach ($mts as $rm) {
            $rmt[$rm->id_kemungkinan][$rm->id_dampak] = $rm;
        }

        $items = [];
        foreach ($data->items() as $r) {
            $tahun = date("Y", strtotime($r->tgl_risiko));
            $r->eksposur_risiko = $r->nilai_dampak_inheren * $r->nilai_kemungkinan / 100;
            if ($r->id_kemungkinan_inheren && $r->id_dampak_inheren)
                $r->level_inheren = $rmt[$r->id_kemungkinan_inheren][$r->id_dampak_inheren];

            $rows1 = DB::select("select rptr.*, 
            coalesce(rptr.nilai_dampak,0)*coalesce(rptr.nilai_kemungkinan,0)/100 as eksposur_risiko
            from risk_profile_target_residual rptr 
            where rptr.deleted_at is null 
            and rptr.id_risk_profile = ?", [$r->id_risk_profile]);
            foreach ($rows1 as $r1) {
                $periode = str_replace(date("Y", strtotime($r->tgl_risiko)), "", $r1->periode);
                $r->{"res_eksposur_risiko" . $periode} = $r1->eksposur_risiko;
                $r->{"res_level" . $periode} = $rmt[$r1->id_kemungkinan][$r1->id_dampak];
            }


            $rows1 = DB::select("select rrtr.*, 
            coalesce(rrtr.nilai_dampak,0)*coalesce(rrtr.nilai_kemungkinan,0)/100 as eksposur_risiko
            from risk_profile_realisasi_residual rrtr 
            where rrtr.deleted_at is null 
            and rrtr.id_risk_profile = ?", [$r->id_risk_profile]);
            foreach ($rows1 as $r1) {
                $periode = str_replace(date("Y", strtotime($r->tgl_risiko)), "", $r1->periode);
                if (in_array($periode, ['1', '2', '3']))
                    $periode = 1;

                if (in_array($periode, ['4', '5', '6']))
                    $periode = 2;

                if (in_array($periode, ['7', '8', '9']))
                    $periode = 3;

                if (in_array($periode, ['10', '11', '12']))
                    $periode = 4;

                $r->{"real_eksposur_risikoq" . $periode} = $r1->eksposur_risiko;
                if ($r1->id_kemungkinan && $r1->id_dampak)
                    $r->{"real_levelq" . $periode} = $rmt[$r1->id_kemungkinan][$r1->id_dampak];
            }

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

    protected function _beforeDetail($id_register = null)
    {
        $rrm = new \App\Models\RiskRegister();
        $this->data['rowheader'] = $rrm->find($id_register);
    }

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

        // $data       = $request->getRawInput();
        // $updateData = array_filter($data);
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

        $penyebabm = new \App\Models\RiskProfilePenyebab();
        $pm = new \App\Models\RiskPenyebab();
        $risikom = new \App\Models\RiskRisiko();
        $krim = new \App\Models\RiskProfileKri();
        $controlm = new \App\Models\RiskProfileControl();
        $dampakm = new \App\Models\RiskProfileDampak();
        $dm = new \App\Models\RiskDampak();

        DB::beginTransaction();

        $penyebab = $data['penyebab'];
        unset($data['penyebab']);
        unset($data['id_risiko_induk']);
        $kri_kualitatif = $data['kri_kualitatif'];
        unset($data['kri_kualitatif']);
        $kri_kuantitatif = $data['kri_kuantitatif'];
        unset($data['kri_kuantitatif']);
        $control = $data['control'];
        unset($data['control']);
        $dampak = $data['dampak'];
        unset($data['dampak']);

        $ret = true;
        if (!$data['id_risiko']) {
            $r = [];
            $r["id_taksonomi"] = $data['id_taksonomi'];
            $r["id_jenis_risiko"] = $data['id_jenis_risiko'];
            $r["nama"] = $data['nama'];
            $r["status"] = 'Draft';
            $r["id_unit"] = $this->data['rowheader']->id_unit;
            $data['id_risiko'] = $risikom->insert($r);
        }

        if ($ret) {
            $data["status"] = "Draft";
            if ($id) {
                $ret = $this->model->update($id, $data);
                $data[$this->model->primaryKey] = $id;
            } else {
                $ret = $id = $this->model->insert($data);
                $data[$this->model->primaryKey] = $id;
            }
        }

        $id_profile_penyebabarr = [];
        if ($penyebab)
            foreach ($penyebab as $p) {
                if (!$ret)
                    break;

                if (empty($p['id_penyebab'])) {
                    $rt = [];
                    $rt['id_risiko'] = $data['id_risiko'];
                    $rt['nama'] = $p['nama'];
                    $rt['id_unit'] = $this->data['rowheader']->id_unit;
                    $rt['status'] = 'Draft';
                    $ret = $p['id_penyebab'] = $pm->insert($rt);
                }

                if ($ret) {
                    if (!empty($p['id_profile_penyebab']))
                        $ret = $penyebabm->update($p['id_profile_penyebab'], $p);
                    else {
                        $p["id_risk_profile"] = $id;
                        $p['id_profile_penyebab'] = $ret = $penyebabm->insert($p);
                    }

                    $id_profile_penyebabarr[] = $p['id_profile_penyebab'];
                }
            }


        if ($ret)
            $ret = $penyebabm->where("id_risk_profile", $id)->whereNotIn(
                "id_profile_penyebab",
                $id_profile_penyebabarr
            )->delete() !== false;

        $id_kriarr = [];
        if ($kri_kualitatif)
            foreach ($kri_kualitatif as $k) {
                if (!$ret)
                    break;

                $k['is_kuantitatif'] = 0;
                if (!empty($k['id_kri']))
                    $ret = $krim->update($k['id_kri'], $k);
                else {
                    $k["id_risk_profile"] = $id;
                    $k['id_kri'] = $ret = $krim->insert($k);
                }
                $id_kriarr[] = $k['id_kri'];
            }
        if ($kri_kuantitatif)
            foreach ($kri_kuantitatif as $k) {
                if (!$ret)
                    break;

                $k['is_kuantitatif'] = 1;
                if (!empty($k['id_kri']))
                    $ret = $krim->update($k['id_kri'], $k);
                else {
                    $k["id_risk_profile"] = $id;
                    $k['id_kri'] = $ret = $krim->insert($k);
                }
                $id_kriarr[] = $k['id_kri'];
            }

        if ($ret)
            $ret = $krim->where("id_risk_profile", $id)->whereNotIn(
                "id_kri",
                $id_kriarr
            )->delete() !== false;

        $id_controlarr = [];
        foreach ($control as $c) {
            if (!$ret)
                break;

            $c["id_risk_profile"] = $id;
            if (!empty($c['id_control']))
                $ret = $controlm->update($c['id_control'], $c);
            else {
                $c['id_control'] = $ret = $controlm->insert($c);
            }
            $id_controlarr[] = $c['id_control'];
        }

        if ($ret)
            $ret = $controlm->where("id_risk_profile", $id)->whereNotIn(
                "id_control",
                $id_controlarr
            )->delete() !== false;

        $id_profile_dampakarr = [];
        foreach ($dampak as $d) {
            if (!$ret)
                break;


            if (empty($d['id_dampak'])) {
                $rt = [];
                $rt['id_risiko'] = $data['id_risiko'];
                $rt['nama'] = $d['nama'];
                $rt['id_unit'] = $this->data['rowheader']->id_unit;
                $rt['status'] = 'Draft';
                $ret = $d['id_dampak'] = $dm->insert($rt);
            }
            if ($ret) {
                $d["id_risk_profile"] = $id;
                if (!empty($d['id_profile_dampak']))
                    $ret = $dampakm->update($d['id_profile_dampak'], $d);
                else {
                    $d['id_profile_dampak'] = $ret = $dampakm->insert($d);
                }
                $id_profile_dampakarr[] = $d['id_profile_dampak'];
            }
        }

        if ($ret)
            $ret = $dampakm->where("id_risk_profile", $id)->whereNotIn(
                "id_profile_dampak",
                $id_profile_dampakarr
            )->delete() !== false;

        if ($ret)
            $ret = $this->_setStatus($this->data['rowheader']['id_register']);

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

        $penyebabm = new \App\Models\RiskProfilePenyebab();
        $record['penyebab'] = $penyebabm->where('id_risk_profile', $id)->get();
        $krim = new \App\Models\RiskProfileKri();
        $record['kri_kuantitatif'] = $krim->where('id_risk_profile', $id)->where('is_kuantitatif', 1)->get();
        $record['kri_kualitatif'] = $krim->where('id_risk_profile', $id)->where('is_kuantitatif', 0)->get();
        $controlm = new \App\Models\RiskProfileControl();
        $record['control'] = $controlm->where('id_risk_profile', $id)->get();
        $dampakm = new \App\Models\RiskProfileDampak();
        $record['dampak'] = $dampakm->where('id_risk_profile', $id)->get();

        return $this->respond($record);
    }

    public function levelrisiko($id_register = null, $tahun = null, $jenis = null, Request $request)
    {
        // $jenis = 1;
        $risklimit = new \App\Models\RiskCapacityLimit();
        $riskmatrix = new \App\Models\MtRiskMatrix();
        $riskkemungkinan = new \App\Models\MtRiskKemungkinan();
        $riskdampak = new \App\Models\MtRiskDampak();

        $register = $risklimit->where("id_register", $id_register)->where("tahun", $tahun - 1)->get();
        $ret = [];
        $risk_limit = 0;
        if (isset($register[0])) {
            $register = $register[0];
            $risk_limit = $register->risk_limit;
        }
        $ret['risk_limit'] = $risk_limit;
        $dampak = $riskdampak->get();
        foreach ($dampak as &$r) {
            $r->nama = $r->kode . '-' . $r->nama;
            $r->nilai_mulai = $r->mulai / 100 * $risk_limit;
            $r->nilai_sampai = $r->sampai / 100 * $risk_limit;
        }
        $ret["dampak"] = $dampak;

        $kemungkinan = $riskkemungkinan->get();
        foreach ($kemungkinan as &$r1) {
            $r1->nama = $r1->kode . ' - ' . $r1->nama;
        }
        $ret["kemungkinan"] = $kemungkinan;
        // $matrix = $riskmatrix->get();
        $matrix = $riskmatrix->where("jenis", $jenis)->get();
        $rmatriks = [];
        foreach ($matrix as &$r1) {
            $rc = DB::select("select warna, nama from mt_risk_tingkat where id_tingkat = ?", [$r1->id_tingkat]);
            if ($rc) {
                $r1->warna = $rc[0]->warna;
                $r1->nama = $rc[0]->nama;
            }

            $id_kemungkinan = $r1->id_kemungkinan;
            $id_dampak = $r1->id_dampak;
            unset($r1->id_kemungkinan);
            unset($r1->id_dampak);

            $rmatriks[$id_kemungkinan][$id_dampak] = $r1;
        }
        $ret["matrix"] = $rmatriks;

        return $ret;
    }

    public function matriks(Request $request)
    {
        // $data = $request->all();
        // $data = $this->model->matriks($data);
        $data = [];
        $data[] = [
            "id_register" => 1,
            "id_risk_profile" => 1,
            "nama" => "Pembengkakan HPP (Harga Pokok Penjualan)",
            "risk_owner" => "Divisi Sipil dan Umum",
            "inheren" => "<span style='color:red'>Ekstrem [5x5]</span>",
            "target_residual" => "<span style='color:yellow'>Moderat [5x1]</span>",
            "residual" => "<span style='color:yellow'>Moderat [5x1]</span>",
        ];
        $data[] = [
            "id_register" => 2,
            "id_risk_profile" => 2,
            "nama" => "Keterbatasan Pendanaan JTTS",
            "risk_owner" => "Divisi Corporate Planing",
            "inheren" => "<span style='color:red'>Ekstrem [5x4]</span>",
            "target_residual" => "<span style='color:orange'>Tinggi [5x3]</span>",
            "residual" => "<span style='color:orange'>Tinggi [5x3]</span>",
        ];
        return $this->respond($data);
    }

    public function getinduk($id_register = null, $id_kriteria_dampak = null, Request $request)
    {
        $this->_beforeDetail($id_register);
        $id_tingkat_agregasi_risiko = $this->data['rowheader']->id_tingkat_agregasi_risiko;
        $id_unit = $this->data['rowheader']->id_unit;
        $id_kelompok_bisnis = $this->data['rowheader']->id_kelompok_bisnis;

        $id_tingkat_agregasi_parent = DB::select("select 
        id_tingkat_agregasi_risiko_parent 
        from mt_risk_tingkat_agregasi_risiko 
        where id_tingkat_agregasi_risiko = ?", $id_tingkat_agregasi_risiko)[0]["id_tingkat_agregasi_risiko_parent"];

        $paramarr = [];
        $valarr = [];
        $paramarr[] = "b.id_kriteria_dampak = ?";
        $valarr[] = $id_kriteria_dampak;
        $paramarr[] = "c.id_tingkat_agregasi_risiko = ?";
        $valarr[] = $id_tingkat_agregasi_parent;
        if ($id_tingkat_agregasi_risiko == 4) {
            $paramarr[] = "c.id_unit = ?";
            $valarr[] = $id_unit;
        }
        if ($id_tingkat_agregasi_risiko == 3) {
            $paramarr[] = "c.id_kelompok_bisnis = ?";
            $valarr[] = $id_kelompok_bisnis;
        }
        if ($id_tingkat_agregasi_risiko == 2) {
        }
        if ($id_tingkat_agregasi_risiko == 1) {
            $paramarr[] = "1 <> ?";
            $valarr[] = 1;
        }

        $rows = DB::select("select id_risiko, nama 
        from risk_risiko a 
        where exists (select 1 from risk_profile b 
        left join risk_register c on b.id_register = c.id_register
        where " . implode(" and ", $paramarr) . "
        )", $valarr);

        return $rows;
    }
}
