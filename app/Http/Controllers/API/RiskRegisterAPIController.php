<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

use App\Http\Controllers\BaseResourceController;
use App\Models\User;
use Illuminate\Support\Facades\DB;

/**
 * Class RiskRegisterAPIController
 */
class RiskRegisterAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskRegister;
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

        $tgl_efektif = date('Y-m-d');

        $tahun = null;
        if (!empty($search['tahun']))
            $tahun = $search['tahun'];
        $bulan = null;
        if (!empty($search['bulan']))
            $bulan = $search['bulan'];
        if (!empty($search['tgl_efektif']))
            $tgl_efektif = $search['tgl_efektif'];

        unset($search['tahun']);
        unset($search['bulan']);
        unset($search['tgl_efektif']);
        // $filter = $request->get('q');
        $page = $request->get('page') ?? 1;
        $limit = $request->get('pagesize') ?? $this->limit;
        $db = $this->model->search($search);

        if ($bulan && $tahun) {
            $bulantahun = $tahun . $bulan;
            $db = $db->whereRaw(
                "? between 
                coalesce(to_char(periode_mulai,'YYYYMM'),?) 
                and 
                coalesce(to_char(periode_selesai,'YYYYMM'),?)",
                [$bulantahun, $bulantahun, $bulantahun]
            );
        } else if ($tahun) {
            $db = $db->whereRaw(
                "? between 
                coalesce(to_char(periode_mulai,'YYYY'),?) 
                and 
                coalesce(to_char(periode_selesai,'YYYY'),?)",
                [$tahun, $tahun, $tahun]
            );
        } elseif ($tgl_efektif) {
            $db = $db->whereRaw(" TO_DATE(?,'YYYYMMDD') 
            between 
            coalesce(periode_mulai,TO_DATE(?,'YYYYMMDD')) 
            and 
            coalesce(periode_selesai,TO_DATE(?,'YYYYMMDD'))", [$tgl_efektif, $tgl_efektif, $tgl_efektif]);
        }

        // return $this->respond(session('access'));

        if (empty(session('access')["dashboard"]["view_all"])) {
            $db = $db->where("id_unit", [session('id_unit')]);
            $db = $db->where("id_kelompok_bisnis", [session('id_kelompok_bisnis')]);
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

        $assesment = [];
        $getAssessment = DB::select("select id_assessment_type, nama from mt_assessment_type where deleted_at is null");
        foreach ($getAssessment as $dataAssesment) {
            $assesment[$dataAssesment->id_assessment_type] = $dataAssesment->nama;
        }
        $rows = $data->items();
        $data1 = $this->GenerateTreeEasyUi(
            $rows,
            "id_parent_register",
            "id_register",
            "nama",
            null,
            0,
            array(),
            $assesment,
        );

        // $data1 = $rows;

        return $this->respond([
            'page' => $data->currentPage(),
            'page_size' => $data->perPage(),
            'data' => $data1,
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

    public function store(Request $request): JsonResponse
    {
        if($request->navigasi != '0'){
            $request->validate($this->model->rules);
        }else{
            $request->validate($this->model->rules_if_folder);
        }

        $data = $request->all();

        $id = $this->model->insert($data);
        // if (!$id) {
        //     return $this->fail($this->model->errors());
        // }
        $data[$this->model->primaryKey] = $id;


        return $this->respondCreated($data, 'data created');
    }

    public function update($id = null, Request $request): JsonResponse
    {

        if($request->navigasi != '0'){
            $request->validate($this->model->rules);
        }else{
            $request->validate($this->model->rules_if_folder);
        }
        // $request->validate($this->model->rules);

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

    public function tree(): JsonResponse
    {
        $db = $this->model;

        if (empty(session('access')["dashboard"]["view_all"])) {
            $db = $db->where("id_unit", [session('id_unit')]);
            $db = $db->where("id_kelompok_bisnis", [session('id_kelompok_bisnis')]);
        }

        $rows = $db->get();

        $data = $this->GenerateTreeEasyUi(
            $rows,
            "id_parent_register",
            "id_register",
            "nama"
        );
        return $this->respond($data);
    }

    public function getdetail($id = null, Request $request): JsonResponse
    {
        $record = $this->model->find($id);
        if (!$record) {
            return $this->failNotFound(sprintf(
                'item with id %d not found',
                $id
            ));
        }

        $rs = DB::select("select nama 
        from mt_assessment_type 
        where id_assessment_type = ?", [$record->id_assessment_type]);
        if ($rs) {
            $record->nama_assessment_type = $rs[0]->nama;
        }

        $rs = DB::select("select nama 
        from mt_sdm_kelompok_bisnis 
        where id_kelompok_bisnis = ?", [$record->id_kelompok_bisnis]);
        if ($rs) {
            $record->nama_kelompok_bisnis = $rs[0]->nama;
        }

        $rs = DB::select("select nama 
        from mt_sdm_unit 
        where id_unit = ?", [$record->id_unit]);
        if ($rs) {
            $record->nama_unit = $rs[0]->nama;
        }

        $rs = DB::select("select nama,warna 
        from mt_status_pengajuan 
        where id_status_pengajuan = ?", [$record->id_status_pengajuan]);

        if ($rs) {
            $record->nama_status_pengajuan = $rs[0]->nama;
            $record->warna = $rs[0]->warna;
        }

        $record->history_pengajuan = DB::select("select * 
        from risk_msg 
        where id_register = ? and deleted_at is null 
        order by id_msg", [$id]);

        $rows = DB::select("select page 
        from mt_status_pengajuan_page_disable 
        where id_status_pengajuan = ? and deleted_at is null ", [$record->id_status_pengajuan]);
        $page_disable = [];
        foreach ($rows as $r) {
            $page_disable[] = $r->page;
        }
        $record->page_disable = $page_disable;

        $rows = DB::select("select page 
        from mt_status_pengajuan_read_only 
        where id_status_pengajuan = ? and deleted_at is null ", [$record->id_status_pengajuan]);
        $page_read_only = [];
        foreach ($rows as $r) {
            $page_read_only[] = $r->page;
        }
        $record->page_read_only = $page_read_only;

        $id_group = $request->session()->get('id_group');

        // return $this->respond("select b.nama as selanjutnya, c.nama as dikembalikan 
        // from mt_status_pengajuan_penerima a 
        // join mt_status_pengajuan b on a.id_status_pengajuan_selanjutnya = b.id_status_pengajuan
        // join mt_status_pengajuan c on a.id_status_pengajuan_dikembalikan = c.id_status_pengajuan
        // where a.id_status_pengajuan = {$record->id_status_pengajuan} 
        // and a.id_group = {$id_group} 
        // and a.id_assessment_type = {$record->id_assessment_type}");

        $row = DB::select("select b.nama as selanjutnya, c.nama as dikembalikan 
        from mt_status_pengajuan_penerima a 
        left join mt_status_pengajuan b on a.id_status_pengajuan_selanjutnya = b.id_status_pengajuan
        left join mt_status_pengajuan c on a.id_status_pengajuan_dikembalikan = c.id_status_pengajuan
        where a.deleted_at is null
        and a.id_status_pengajuan = ? 
        and a.id_group = ? 
        and a.id_assessment_type = ?", [
            $record->id_status_pengajuan,
            $id_group,
            $record->id_assessment_type
        ]);
        if ($row) {
            if (strstr($row[0]->selanjutnya, "Disetujui") !== false)
                $button = ["ajukan" => "Setujui"];
            elseif (strstr($row[0]->selanjutnya, "Pemantauan") !== false)
                $button = ["ajukan" => "Setujui"];
            else
                $button = ["ajukan" => "Ajukan " . $row[0]->selanjutnya];

            if ($row[0]->dikembalikan)
                $button["kembalikan"] = "Kembalikan " . str_replace("Dikembalikan", "", $row[0]->dikembalikan);

            $record->button = $button;
        }

        $record->parent = $this->registerParent($id);

        return $this->respond($record);
    }

    private function registerParent($id_register)
    {
        $ret = [];
        $row = $this->model->find($id_register);
        $rs = DB::select("select nama 
        from mt_assessment_type 
        where id_assessment_type = ?", [$row->id_assessment_type]);
        if ($rs) {
            $row->nama_assessment_type = $rs[0]->nama;
            $row->nama .= " (" . $row->nama_assessment_type . ")";
        }

        if ($row->id_parent_register) {
            $arr = $this->registerParent($row->id_parent_register);
            foreach ($arr as $r) {
                $ret[] = $r;
            }
        }
        $ret[] = $row;
        return $ret;
    }

    private function idJabatanBawahan($id_jabatan)
    {
        $ret = [0];
        $cek = DB::select("select 1 
        from sys_user_group a
        join sys_group_menu b on b.deleted_at is null and a.id_group = b.id_group
        join sys_menu c on b.id_menu = c.id_menu and c.deleted_at is null
        join sys_group_action d on b.id_group_menu = d.id_group_menu and d.deleted_at is null
        join sys_action e on e.id_action = d.id_action and c.id_menu = e.id_menu and e.deleted_at is null
        where a.deleted_at is null
        and a.id_jabatan = ?
        and c.url = 'risk_profile' and e.nama = 'add'", [$id_jabatan]);
        if ($cek)
            $ret[] = $id_jabatan;

        $rows = DB::select("select id_jabatan 
        from mt_sdm_jabatan a
        where a.deleted_at is null 
        and id_jabatan_parent = ?", [$id_jabatan]);
        foreach ($rows as $r) {
            $arr = $this->idJabatanBawahan($r->id_jabatan);
            foreach ($arr as $id)
                $ret[] = $id;
        }
        return $ret;
    }

    public function ajukan($jenis = null, Request $request): JsonResponse
    {
        /**
         * [
         * "msg",id_register
         * ]
         */
        $data = $request->all();
        $rm = new \App\Models\RiskMsg();
        $rmp = new \App\Models\RiskMsgPenerima();
        $rr = $this->model->find($data['id_register']);
        $id_group = $request->session()->get('id_group');

        $rowstatus = DB::select("select a.* 
        from mt_status_pengajuan_penerima a 
        where a.id_status_pengajuan = ? and a.deleted_at is null
        and a.id_group = ? 
        and a.id_assessment_type = ?", [
            $rr->id_status_pengajuan,
            $id_group,
            $rr->id_assessment_type
        ])[0];


        if ($jenis == 1)
            $id_status_pengajuan = $rowstatus->id_status_pengajuan_selanjutnya;
        else
            $id_status_pengajuan = $rowstatus->id_status_pengajuan_dikembalikan;

        DB::beginTransaction();
        $url = "";
        if (in_array($id_status_pengajuan, [1, 2, 3, 4, 15])) {
            $url = "risk_capacity_limit/" . $rr->id_register;
        } elseif (in_array($id_status_pengajuan, [5, 6, 7, 8, 9, 16]) || !$id_status_pengajuan) {
            $url = "risk_profile/" . $rr->id_register;
        } else {
            $url = "risk_profile_realisasi_risiko_residual/" . $rr->id_register;
        }
        $record = [
            "id_register" => $rr->id_register,
            "id_group" => $id_group,
            "id_status_pengajuan" => $id_status_pengajuan,
            "msg" => $data["msg"],
            "url" => $url
        ];

        $ret = $id_msg = $rm->insert($record);
        $id_jabatanarr = $this->idJabatanBawahan($rr->id_owner);
        $penerima = DB::select(
            "select id_user 
            from sys_user_group a 

            where exists (select 1 
            from mt_status_pengajuan_penerima b
            where a.id_group = b.id_group 
            and b.deleted_at is null
            and b.id_assessment_type = ? 
            and b.id_status_pengajuan = ?) 

            and exists(select 1 
            from sys_group_menu b 
            join sys_menu c on b.id_menu = c.id_menu  and c.deleted_at is null
            join sys_group_action d on b.id_group_menu = d.id_group_menu  and d.deleted_at is null
            join sys_action e on d.id_action = e.id_action and c.id_menu = e.id_menu and e.deleted_at is null
            where a.id_group = b.id_group
            and a.deleted_at is null
            and 
                (
                    (c.url = 'dashboard' and e.nama = 'view_all') 
                    or 
                    (exists(
                            select 1 from mt_sdm_jabatan f 
                            where f.id_jabatan = a.id_jabatan
                            and f.deleted_at is null
                            and f.id_unit = ?
                        )
                    ) 
                    or 
                    (c.url = 'risk_profile' and e.nama = 'add' and a.id_jabatan in (" . implode(",", $id_jabatanarr) . "))
                )
            )  and a.deleted_at is null",
            [$rr->id_assessment_type, $id_status_pengajuan, $rr->id_unit]
        );
        // $penerima
        foreach ($penerima as $r) {
            if (!$ret)
                break;

            $record = [];
            $record["id_msg"] = $id_msg;
            $record["id_user"] = $r->id_user;
            $ret = $rmp->insert($record);
        }

        if ($ret) {
            if ($jenis == 1) {
                if ($id_status_pengajuan == 5) {
                    $mrl = new \App\Models\RiskCapacityLimit();
                    $ret = $mrl->where("id_register", $rr->id_register)->update(["status" => "Aktif"]);
                }

                if ($id_status_pengajuan == 10 && $ret) {
                    $mrl = new \App\Models\RiskProfile();
                    $ret = $mrl->where("id_register", $rr->id_register)->update(["status" => "Aktif"]);
                }

                if ($id_status_pengajuan == 10 && $rr->id_status_pengajuan == 14 && $ret) {
                    $mrl = new \App\Models\RiskProfileRealisasiResidual();
                    $mrp = new \App\Models\RiskProfile();
                    $rows = $mrp->where("id_register", $rr->id_register)->get();
                    foreach ($rows as $r1) {
                        if (!$ret)
                            break;

                        $ret = $mrl->where("id_risk_profile", $r1->id_risk_profile)->update(["status" => "Aktif"]);
                    }
                }
            }
            if ($ret) {
                $ret = $this->model
                    ->where("id_register", $rr->id_register)
                    ->update(["id_status_pengajuan" => $id_status_pengajuan]);
            }
        }

        if ($ret) {
            DB::commit();
            return $this->respondCreated($data, 'data created');
        } else {
            DB::rollBack();
            return $this->fail("Failed");
        }
    }

    public function readmsg(Request $request): JsonResponse
    {
        /**
         * [
         * id_msg, id_user
         * ]
         */
        $rmp = new \App\Models\RiskMsgPenerima();
        $data = $request->all();
        $id_msg_penerima = $rmp->where("id_msg", $data['id_msg'])
            ->where("id_user", $data['id_user'])
            ->first()->id_msg_penerima;

        $ret = $rmp->update($id_msg_penerima, ["is_read" => 1]);

        if ($ret)
            return $this->respondCreated($data, 'data created');
        else
            return $this->fail("Failed");
    }
}
