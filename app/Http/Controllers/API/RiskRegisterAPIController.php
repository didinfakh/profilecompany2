<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

use App\Http\Controllers\BaseResourceController;
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

    public function tree(): JsonResponse
    {
        $rows = $this->model->get();
        $data = $this->GenerateTreeEasyUi(
            $rows,
            "id_parent_register",
            "id_register",
            "nama"
        );
        return $this->respond($data);
    }

    public function getdetail($id = null): JsonResponse
    {
        $record = $this->model->find($id);
        if (!$record) {
            return $this->failNotFound(sprintf(
                'item with id %d not found',
                $id
            ));
        }
        $rs = DB::select("select nama 
        from mt_status_pengajuan 
        where id_status_pengajuan = ?", [$record->id_status_pengajuan]);

        if ($rs)
            $record->nama_status_pengajuan = $rs[0]->nama;

        $record->history_pengajuan = DB::select("select * 
        from risk_msg 
        where id_register = ? and deleted_at is null 
        order by id_msg", [$id]);

        return $this->respond($record);
    }

    public function ajukan(Request $request): JsonResponse
    {
        /**
         * [
         * "msg",id_register
         * ]
         */
        $data = $request->all();
        $rm = new \App\Models\RiskMsg();
        $rmp = new \App\Models\RiskMsgPenerima();

        DB::beginTransaction();
        $ret = $id_msg = $rm->insert($data);

        // $penerima
        // foreach ($penerima as $id_user) {
        //     if (!$ret)
        //         break;

        //     $record = [];
        //     $record["id_msg"] = $id_msg;
        //     $record["id_user"] = $id_user;
        //     $ret = $rmp->insert($record);
        // }

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
