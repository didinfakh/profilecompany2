<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\BaseResourceController;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

/**
 * Class RiskProfileKriAPIController
 */
class RiskProfileKriAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskProfileKri;
    }

    public function checkstatus($id_kri, $nilai, Request $request)
    {
        $d = DB::select("select
        from risk_profile_kri
        where id_kri = ?", [$id_kri]);
        $row = $d[0];
        $status = "";
        if ($row->polaritas == '+') {
            if ($nilai < $row["target_sampai"])
                $status = "Aman";

            if ($nilai >= $row["batas_atas"])
                $status = "Bahaya";
        } else {
            if ($nilai > $row["target_mulai"])
                $status = "Aman";

            if ($nilai <= $row["batas_bawah"])
                $status = "Bahaya";
        }

        if ($row["target_mulai"] && $row["target_sampai"]) {
            if ($nilai > $row["target_mulai"] or $nilai < $row["target_sampai"])
                $status = "Aman";
        }

        if ($row["batas_bawah"] && $row["batas_atas"]) {
            if ($nilai <= $row["batas_bawah"] or $nilai >= $row["batas_atas"])
                $status = "Bahaya";
        }

        if (!$status)
            $status = "Hati-hati";

        return $status;
    }
}
