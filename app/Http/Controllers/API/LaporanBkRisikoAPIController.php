<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\BaseResourceController;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

/**
 * Class LaporanBkRisikoAPIController
 */
class LaporanBkRisikoAPIController extends BaseResourceController
{
    public function __construct()
    {
        $this->model = new \App\Models\RiskProfile();
    }

    public function show($id = null): JsonResponse
    {
        return $this->respond($this->headereasyui($this->header()));
    }

    private function tgl_indo($tanggal){
        $bulan = array (
            1 =>   'Januari',
            'Februari',
            'Maret',
            'April',
            'Mei',
            'Juni',
            'Juli',
            'Agustus',
            'September',
            'Oktober',
            'November',
            'Desember'
        );
        $tgl_dan_tahun = explode('-', $tanggal);
        
        // variabel pecahkan 0 = tanggal
        // variabel pecahkan 1 = bulan
        // variabel pecahkan 2 = tahun
     
        return $tgl_dan_tahun[2] . ' ' . $bulan[ (int)$tgl_dan_tahun[1] ] . ' ' . $tgl_dan_tahun[0];
    }

    private function get_tanda_tangan ($id_register=null,$id_status_pengajuan=null){
        $where = '';
        $params = [];
        if($id_register){
            $where .= ' and id_register = ?';
            $params[] = $id_register;
        }   

        if($id_status_pengajuan){
            $where .= ' and id_status_pengajuan = ?';
            $params[] = $id_status_pengajuan;
        }

        $sql= "select max(created_at) as tanggal_aprove from risk_msg where deleted_at is null " . $where;
        $query = DB::select($sql,$params);
        $ret = $query[0]->tanggal_aprove;
        return $ret;
    }

    private function headereasyui($rows)
    {
        $ret = [];
        $i = 0;
        foreach ($rows as $k => $v) {
            $child = null;
            if (is_array($v)) {
                $child = $this->headereasyui($v[key($v)]);
                $v = key($v);
            }

            $ret[$i] = ["id" => $k, "text" => $v, "children" => $child];
            $i++;
        }
        return $ret;
    }

    private function header_type(){
        $return = [];
        $return['eksposur_risiko'] = 'rupiah';
        $return['nilai_dampak_inheren'] = 'rupiah';
        $return['res_nilai_dampakq1'] = 'rupiah';
        $return['res_nilai_dampakq2'] = 'rupiah';
        $return['res_nilai_dampakq3'] = 'rupiah';
        $return['res_nilai_dampakq4'] = 'rupiah';
        $return['res_eksposur_risikoq1'] = 'rupiah';
        $return['res_eksposur_risikoq2'] = 'rupiah';
        $return['res_eksposur_risikoq3'] = 'rupiah';
        $return['res_eksposur_risikoq4'] = 'rupiah';
        $return['realisasi_mitigasi_biaya'] = 'rupiah';


        return $return;
    }

    private function header()
    {
        $return = [];
        $return['sasaran'] = 'Sasaran BUMN';
        $return['sasaran_nama'] = 'Sasaran KBUMN';
        $return['jenis_risiko_nama'] = 'Kategori Risiko BUMN';
        $return['taksonomi_nama'] = 'Kategori Risiko T2 & T3 KBUMN';
        $return['no_risiko'] = 'No. Risiko';
        $return['nama'] = 'Peristiwa Risiko';
        $return['deskripsi'] = 'Deskripsi Peristiwa risiko';
        $return['no_penyebab'] = 'No. Penyebab Risiko';
        $return['penyebab_nama'] = 'Penyebab Risiko';
        $return['kri_nama'] = 'Key Risk Indicators';
        $return['kri_satuan'] = 'Unit Satuan KRI';
        $return['kri_threshold'] = ['Kategori Threshold KRI' => [
            'kri_aman' => 'Aman',
            'kri_hati_hati' => 'Hati-hati',
            'kri_bahaya' => 'Bahaya',
        ]];
        $return['control_jenis'] = 'Jenis Existing Control';
        $return['control_nama'] = 'Existing Control';
        $return['control_efektivitas'] = 'Penilaian Efektivitas Kontrol';
        $return['dampak_kategori'] = 'Kategori Dampak';
        $return['dampak_nama'] = 'Deskripsi Dampak';
        $return['dampak_perkiraan_terpapar'] = 'Perkiraan Waktu Terpapar Risiko';
        $return['risiko_inheren'] = [
            'Risiko Inheren' => [
                'penjelasan_dampak' => 'Asumsi Perhitungan Dampak',
                'nilai_dampak_inheren' => 'Nilai Dampak',
                'skala_dampak' => 'Skala Dampak',
                'nilai_kemungkinan' => 'Nilai Probabilitas',
                'skala_probabilitas' => 'Skala Probabilitas',
                'eksposur_risiko' => 'Eksposur Risiko',
                'skala_risiko' => 'Skala  Risiko',
                'level_risiko' => 'Level  Risiko',
            ]
        ];
        $residual = [];
        $residual['res_nilai_dampak'] = [
            'Nilai Dampak' => [
                'res_nilai_dampakq1' => 'Q1',
                'res_nilai_dampakq2' => 'Q2',
                'res_nilai_dampakq3' => 'Q3',
                'res_nilai_dampakq4' => 'Q4',
            ]
        ];
        $residual['res_skala_dampak'] = [
            'Skala Dampak' => [
                'res_skala_dampakq1' => 'Q1',
                'res_skala_dampakq2' => 'Q2',
                'res_skala_dampakq3' => 'Q3',
                'res_skala_dampakq4' => 'Q4',
            ]
        ];
        $residual['res_nilai_probabilitas'] = [
            'Nilai Probabilitas' => [
                'res_nilai_probabilitasq1' => 'Q1',
                'res_nilai_probabilitasq2' => 'Q2',
                'res_nilai_probabilitasq3' => 'Q3',
                'res_nilai_probabilitasq4' => 'Q4',
            ]
        ];
        $residual['res_skala_probabilitas'] = [
            'Skala Probabilitas' => [
                'res_skala_probabilitasq1' => 'Q1',
                'res_skala_probabilitasq2' => 'Q2',
                'res_skala_probabilitasq3' => 'Q3',
                'res_skala_probabilitasq4' => 'Q4',
            ]
        ];
        $residual['res_eksposur_risiko'] = [
            'Eksposur Risiko' => [
                'res_eksposur_risikoq1' => 'Q1',
                'res_eksposur_risikoq2' => 'Q2',
                'res_eksposur_risikoq3' => 'Q3',
                'res_eksposur_risikoq4' => 'Q4',
            ]
        ];
        $residual['res_skala_risiko'] = [
            'Skala Risiko' => [
                'res_skala_risikoq1' => 'Q1',
                'res_skala_risikoq2' => 'Q2',
                'res_skala_risikoq3' => 'Q3',
                'res_skala_risikoq4' => 'Q4',
            ]
        ];
        $residual['res_level_risiko'] = [
            'Level Risiko' => [
                'res_level_risikoq1' => 'Q1',
                'res_level_risikoq2' => 'Q2',
                'res_level_risikoq3' => 'Q3',
                'res_level_risikoq4' => 'Q4',
            ]
        ];
        $return['residual'] = ["Target Risiko Residual" => $residual];
        $return['mitigasi_opsi'] = 'Opsi Perlakuan Risiko';
        $return['mitigasi_jenis'] = 'Jenis Rencana Perlakuan Risiko';
        $return['mitigasi_nama'] = 'Rencana Perlakuan Risiko';
        $return['mitigasi_output_perlakuan'] = 'Output  Perlakuan Risiko';
        $return['mitigasi_biaya'] = 'Biaya Perlakuan Risiko (Rp/Mata Uang Lain)';
        $return['mitigasi'] = 'Jenis Program Dalam RKAP';
        $return['mitigasi_pic'] = 'PIC';
        $return['mitigasi_timeline'] = ['Timeline (Bulan)' => [
            'mitigasi_timeline1' => '1',
            'mitigasi_timeline2' => '2',
            'mitigasi_timeline3' => '3',
            'mitigasi_timeline4' => '4',
            'mitigasi_timeline5' => '5',
            'mitigasi_timeline6' => '6',
            'mitigasi_timeline7' => '7',
            'mitigasi_timeline8' => '8',
            'mitigasi_timeline9' => '9',
            'mitigasi_timeline10' => '10',
            'mitigasi_timeline11' => '11',
            'mitigasi_timeline12' => '12',
        ]];
        $realisasi = [];
        $realisasi['real_nilai_dampak'] = [
            'Nilai Dampak' => [
                'real_nilai_dampakq1' => 'Q1',
                'real_nilai_dampakq2' => 'Q2',
                'real_nilai_dampakq3' => 'Q3',
                'real_nilai_dampakq4' => 'Q4',
            ]
        ];
        $realisasi['real_skala_dampak'] = [
            'Skala Dampak' => [
                'real_skala_dampakq1' => 'Q1',
                'real_skala_dampakq2' => 'Q2',
                'real_skala_dampakq3' => 'Q3',
                'real_skala_dampakq4' => 'Q4',
            ]
        ];
        $realisasi['real_nilai_probabilitas'] = [
            'Nilai Probabilitas' => [
                'real_nilai_probabilitasq1' => 'Q1',
                'real_nilai_probabilitasq2' => 'Q2',
                'real_nilai_probabilitasq3' => 'Q3',
                'real_nilai_probabilitasq4' => 'Q4',
            ]
        ];
        $realisasi['real_skala_probabilitas'] = [
            'Skala Probabilitas' => [
                'real_skala_probabilitasq1' => 'Q1',
                'real_skala_probabilitasq2' => 'Q2',
                'real_skala_probabilitasq3' => 'Q3',
                'real_skala_probabilitasq4' => 'Q4',
            ]
        ];
        $realisasi['real_eksposur_risiko'] = [
            'Eksposur Risiko' => [
                'real_eksposur_risikoq1' => 'Q1',
                'real_eksposur_risikoq2' => 'Q2',
                'real_eksposur_risikoq3' => 'Q3',
                'real_eksposur_risikoq4' => 'Q4',
            ]
        ];
        $realisasi['real_skala_risiko'] = [
            'Skala Risiko' => [
                'real_skala_risikoq1' => 'Q1',
                'real_skala_risikoq2' => 'Q2',
                'real_skala_risikoq3' => 'Q3',
                'real_skala_risikoq4' => 'Q4',
            ]
        ];
        $realisasi['real_level_risiko'] = [
            'Level Risiko' => [
                'real_level_risikoq1' => 'Q1',
                'real_level_risikoq2' => 'Q2',
                'real_level_risikoq3' => 'Q3',
                'real_level_risikoq4' => 'Q4',
            ]
        ];
        $return['realisasi'] = ["Realisasi Residual Risk" => $realisasi];
        $return['realisasi_mitigasi_nama'] = "Realisasi Rencana Perlakuan Risiko";
        $return['realisasi_mitigasi_output_perlakuan'] = "Realisasi Output atas masing-masing Breakdown Perlakuan Risiko";
        $return['realisasi_mitigasi_biaya'] = "Realisasi Biaya Perlakuan Risiko (Rp/USD)";
        $return['realisasi_mitigasi_serapan_biaya'] = "Persentase Serapan Biaya";
        $return['realisasi_mitigasi_pic'] = "Realisasi PIC";
        $return['realisasi_timeline'] = ["Realisasi Timeline" => [
            "realisasi_timeline1" => "1",
            "realisasi_timeline2" => "2",
            "realisasi_timeline3" => "3",
            "realisasi_timeline4" => "4",
            "realisasi_timeline5" => "5",
            "realisasi_timeline6" => "6",
            "realisasi_timeline7" => "7",
            "realisasi_timeline8" => "8",
            "realisasi_timeline9" => "9",
            "realisasi_timeline10" => "10",
            "realisasi_timeline11" => "11",
            "realisasi_timeline12" => "12",
        ]];
        $return['realisasi_kri'] = ["Realisasi Threshold KRI" => [
            "kri_nama1" => "Key Risk Indicators",
            "realisasi_kri_treshhold" => "Threshold",
            "realisasi_kri_skor" => "Skor",
        ]];
        $return['realisasi_mitigasi_status_rencana_perlakuan'] = "Status Rencana Perlakuan Risiko";
        $return['realisasi_penjelasan_status_rencana_perlakuan'] = "Penjelasan Status Rencana Perlakuan";
        $return['progress_perlakuan'] = [
            'Progress Pelaksanaan Rencana Perlakuan' => [
                'progress_perlakuan1' => 'Q1',
                'progress_perlakuan2' => 'Q2',
                'progress_perlakuan3' => 'Q3',
                'progress_perlakuan4' => 'Q4',
            ]
        ];
        return $return;
    }

    private function levelHeader($rows, $header, &$ret = [], &$colsarr = [], $level = -1)
    {
        $level++;
        $cols = 0;
        foreach ($rows as $k => $r) {
            if (!in_array($k, $header))
                continue;

            $cols1 = 0;
            $label = $r;
            if (is_array($r)) {
                $label = $key = key($r);
                $cols1 = $this->levelHeader($r[$key], $header, $ret, $colsarr, $level);
                $r['cols'] = $cols1;
                $cols += $cols1;
            }
            if (!$cols1)
                $colsarr[] = $k;

            $ret[$level][$k] = ["cols" => $cols1, "label" => $label];
            $cols++;
        }
        return $cols;
    }



    private function levelRows($rows, &$ret = [], $level = 0, $cols,$cols_color = [])
    {
        $rows = (array)$rows;
        foreach ($rows as $k => $r) {
            if (is_array($r)) {
                $levela = $level;
                foreach ($r as $rws) {
                    $this->levelRows($rws, $ret, $levela, $cols,$cols_color);
                    $levela++;
                }
            } else {
                if (in_array($k, $cols)){
                    $ret[$level][$k] = $r;
                }
                if(in_array($k,$cols_color)){
                    $ret[$level][$k] = $r;
                }
            }
        }
        $level++;
    }

    public function print(Request $request)
    {
        $data = $request->all();
        $this->data['title'] = 
        $titleHeader = DB::table('mt_template_laporan')->where('id_template_laporan','=',$data['id_template_laporan'])->get();

        $this->data['title'] = $titleHeader[0]->judul;
        $this->data['tahun'] = 'Periode TW I/II/III/IV Tahun' . ' ' . $data['tahun'];
        $this->data['nama_unit'] = null;
        $this->data['nama_jabatan'] = null;

    if(isset($data['id_register']) && $data['id_register'] != 'null'){
        $sql1 = 'SELECT ID_OWNER,
        MSJ.NAMA AS nama_jabatan,
        MSU.NAMA AS nama_unit,
        SU.NAME AS nama_user
    FROM RISK_REGISTER RR
    LEFT JOIN MT_SDM_JABATAN MSJ ON RR.ID_OWNER = MSJ.ID_JABATAN
    LEFT JOIN MT_SDM_UNIT MSU ON MSJ.ID_UNIT = MSU.ID_UNIT
    LEFT JOIN SYS_USER_GROUP SUG ON MSJ.ID_JABATAN = SUG.ID_JABATAN
    LEFT JOIN SYS_USER SU ON SUG.ID_USER = SU.ID_USER
    WHERE SU.DELETED_AT IS NULL
        AND MSJ.DELETED_AT IS NULL
        AND MSU.DELETED_AT IS NULL
        AND SU.DELETED_AT IS NULL
        AND RR.ID_REGISTER = ?';
    $params1=[];
    $params1[] = $data['id_register'];
    $dataTTD = DB::select($sql1,$params1);
    $this->data['nama_unit'] = $dataTTD[0]->nama_unit;
    $this->data['nama_jabatan'] = $dataTTD[0]->nama_jabatan;
    $this->data['nama_user'] = $dataTTD[0]->nama_user;

        }elseif(isset($data['id_unit']) && $data['id_unit'] != null ){
            $dataUnit = DB::table('mt_sdm_unit')->where('id_unit','=',$data['id_unit'])->get();
            $this->data['nama_unit'] = $dataUnit[0]->nama;

        };
        $id_status_pengajuan = '';
        if($data['id_template_laporan'] < 6){
            $id_status_pengajuan = '9';
        }else{
            $id_status_pengajuan = '14';
        }
        $id_register = $data['id_register'];
        if($id_register){
            $tanggal_tanda_tangan = $this->get_tanda_tangan($id_register,$id_status_pengajuan);
            if($tanggal_tanda_tangan){
                $this->data['tanggal'] = $this->tgl_indo(date( 'Y-m-d', strtotime($tanggal_tanda_tangan) ));
            }else{
                $this->data['tanggal'] = ' ';
            }
        }
        $this->data['header'] = [];
        $this->data['cols'] = [];
        $this->levelHeader(
            $this->header(),
            explode(",", $data['header']),
            $this->data['header'],
            $this->data['cols']
        );
        $this->data['header_type'] = $this->header_type();
        $this->data['rows1'] = $rows = $this->model->laporan($data);
     
        $this->data['rows'] = [];
        // $rws = [$rows[0]];
        $this->data['cols_color'] = $cols_color = [
            "skala_probabilitas_warna",
            "skala_dampak_warna",
            "level_risiko_warna",
            "res_skala_dampakq1_warna",
            "res_skala_dampakq2_warna",
            "res_skala_dampakq3_warna",
            "res_skala_dampakq4_warna",
            "res_skala_probabilitasq1_warna",
            "res_skala_probabilitasq2_warna",
            "res_skala_probabilitasq3_warna",
            "res_skala_probabilitasq4_warna",
            "res_level_risikoq1_warna",
            "res_level_risikoq2_warna",
            "res_level_risikoq3_warna",
            "res_level_risikoq4_warna"
        ];
        foreach ($rows as $rw) {
            $r = [];
            $this->levelRows($rw, $r, 0, $this->data['cols'],$cols_color);
            $this->data['rows'][] = $r;
        }
        return view('api/laporanbkrisikoprint', $this->data);
        // return $this->respond($titleHeader, 200, 'data updated');
        // return $r;
    }

    public function printmatrik(Request $request)
    {
        $data = $request->all();
        // $id_register = $request->get('id_register');
        // if($id_register){
        //     $tanggal_tanda_tangan = $this->get_tanda_tangan($id_register,'9');
        //     $this->data['tanggal_tanda_tangan'] = date( 'd M Y', strtotime($tanggal_tanda_tangan[0]->tanggal_aprove) );
        // }
        $this->data['title'] = 'Metrik Strategi Risiko';
        $this->data['tahun'] = $data['tahun'];
        $this->data['rowslimit'] = \App\Models\RiskCapacityLimit::laporan($data);
        $this->data['rowsmetrik'] = \App\Models\RiskMetrikStrategiRisiko::laporan($data);
        return view('api/laporanmetrikstrategirisikoprint', $this->data);
    }

    public function printsasaran(Request $request)
    {
        $data = $request->all();
        $this->data['title'] = 'Sasaran Strategi Bisnis';
        $this->data['tahun'] = 'Tahun' . ' ' . $data['tahun'];

        $this->data['header'] = [[
            "nama" => ["label" => "Pilihan Sasaran"],
            "nama_strategi" => ["label" => "Pilihan Strategi"],
            "hasil_yang_diharapkan" => ["label" => "Hasil yang diharapkan dapat diterima perusahaan"],
            "nilai_risiko" => ["label" => "Nilai Risiko Yang Akan Timbul"],
            "nilai_limit" => ["label" => "Nilai limit risiko sesuai dengan parameter risiko dalam Metrik Strategi Risiko"],
            "keputusan_penetapan" => ["label" => "Keputusan Penetapan"],
        ]];
        $this->data['cols'] = ["nama", "nama_strategi", "hasil_yang_diharapkan", "nilai_risiko", "nilai_limit", "keputusan_penetapan"];
        $this->data['rows1'] = $rows = \App\Models\RiskSasaran::laporan($data);
        $this->data['rows'] = [];
        // $rws = [$rows[0]];
        foreach ($rows as $rw) {
            $r = [];
            $this->levelRows($rw, $r, 0, $this->data['cols']);
            $this->data['rows'][] = $r;
        }
        return view('api/laporanbkrisikoprint', $this->data);
    }

    public function printlossevent(Request $request)
    {
        $data = $request->all();
        $id_status_pengajuan = '14';
        
        $id_register = $data['id_register'];
        if($id_register){
            $tanggal_tanda_tangan = $this->get_tanda_tangan($id_register,$id_status_pengajuan);
            if($tanggal_tanda_tangan){
                $this->data['tanggal'] = $this->tgl_indo(date( 'Y-m-d', strtotime($tanggal_tanda_tangan) ));
            }else{
                $this->data['tanggal'] = ' ';
            }}
        $this->data['title'] = 'Loss Event Report';
        $this->data['tahun'] = 'Periode TW I/II/III/IV Tahun' . ' ' . $data['tahun'];
        $this->data['nama_unit'] = null;
        $this->data['nama_jabatan'] = null;
        // $this->data['tanggal'] = date("d M Y");
      


if(isset($data['id_register']) && $data['id_register'] != 'null'){
        $sql1 = 'SELECT ID_OWNER,
        MSJ.NAMA AS nama_jabatan,
        MSU.NAMA AS nama_unit,
        SU.NAME AS nama_user
    FROM RISK_REGISTER RR
    LEFT JOIN MT_SDM_JABATAN MSJ ON RR.ID_OWNER = MSJ.ID_JABATAN
    LEFT JOIN MT_SDM_UNIT MSU ON MSJ.ID_UNIT = MSU.ID_UNIT
    LEFT JOIN SYS_USER_GROUP SUG ON MSJ.ID_JABATAN = SUG.ID_JABATAN
    LEFT JOIN SYS_USER SU ON SUG.ID_USER = SU.ID_USER
    WHERE SU.DELETED_AT IS NULL
        AND MSJ.DELETED_AT IS NULL
        AND MSU.DELETED_AT IS NULL
        AND SU.DELETED_AT IS NULL
        AND RR.ID_REGISTER = ?';
    $params1=[];
    $params1[] = $data['id_register'];
    $dataTTD = DB::select($sql1,$params1);
    $this->data['nama_unit'] = $dataTTD[0]->nama_unit;
    $this->data['nama_jabatan'] = $dataTTD[0]->nama_jabatan;
    $this->data['nama_user'] = $dataTTD[0]->nama_user;

        }if(isset($data['id_unit']) && $data['id_unit'] != 'null' ){
            $dataUnit = DB::table('mt_sdm_unit')->where('id_unit','=',$data['id_unit'])->get();
            $this->data['nama_unit'] = $dataUnit[0]->nama;
        }
        $this->data['header_type'] = [
            "nilai_kerugian" => 'rupiah',
            "nilai_premi" => 'rupiah',
            "nilai_klaim" => 'rupiah',
        ];
        $this->data['header'] = [[
            "nama_kejadian" => ["label" => "Nama Kejadian"],
            "identifikasi_kejadian" => ["label" => "Identifikasi Kejadian"],
            "namalost_event_kategori" => ["label" => "Kategori Kejadian"],
            "namalost_event_sumber_penyebab_kejadian" => ["label" => "Sumber Penyebab Kejadian"],
            "penyebab_kejadian" => ["label" => "Penyebab Kejadian"],
            "penanganan_saat_kejadian" => ["label" => "Penanganan saat Kejadian"],
            "deskripsi_kejadian" => ["label" => "Deskripsi Kejadian - Risk Event"],
            "namajenis_risiko" => ["label" => "Kategori Risiko BUMN"],
            "namataksonomi " => ["label" => "Kategori Risiko T2 & T3 KBUMN"],
            "penjelasan_kerugian" => ["label" => "Penjelasan Kerugian"],
            "nilai_kerugian" => ["label" => "Nilai Kerugian"],
            "namakejadian_berulang" => ["label" => "Kejadian Berulang"],
            "namalost_event_frakuensi_kejadian" => ["label" => "Frekuensi Kejadian"],
            "mitigasi_yang_direncanakan" => ["label" => "Mitigasi yang Direncanakan"],
            "realisasi_mitigasi" => ["label" => "Realisasi Mitigasi"],
            "perbaikan_mendatang" => ["label" => "Perbaikan Mendatang"],
            "pihak_terkait" => ["label" => "Pihak terkait"],
            "namalost_event_status_asuransi" => ["label" => "Status Asuransi"],
            "nilai_premi" => ["label" => "Nilai Premi"],
            "nilai_klaim" => ["label" => "Nilai Klaim"],
        ]];
        $this->data['cols'] = array_keys($this->data['header'][0]);
        $this->data['rows1'] = $rows = \App\Models\LostEvent::laporan($data);
        $this->data['rows'] = [];
        // $rws = [$rows[0]];
        foreach ($rows as $rw) {
            $r = [];
            $this->levelRows($rw, $r, 0, $this->data['cols']);
            $this->data['rows'][] = $r;
        }
        return view('api/laporanbkrisikoprint', $this->data);
    }

    public function printinternal_control_testing(Request $request){
        $data = $request->all();

        $this->data['title'] = 'Internal Control Testing';
        $this->data['tahun'] =  'Tahun ' . $data['tahun'];
        $this->data['cols_color'] = [];

        $this->data['header'] = [[
            "sasaran_bumn" => ["label" => "Sasaran BUMN"],
            "business_process" => ["label" => "Business Process"],
            "key_control" => ["label" => "Key Control"],
            "metode_pengujian" => ["label" => "Metode Pengujian"],
            "kelemahan_kontrol" => ["label" => "Kelemahan Kontrol"],
            "rencana_tindak_lanjut" => ["label" => "Rencana Tindak Lanjut"],
            "due_date" => ["label" => "Due Date"],
            "id_pic" => ["label"=> "PIC"],
            "status_tindak_lanjut" => ["label" => "Status Tindak Lanjut"]
        ]];
        $this->data['cols'] = array_keys($this->data['header'][0]);
        $this->data['rows1'] = $rows= \App\Models\InternalControlTesting::laporan($data);
        foreach ($rows as $rw) {
            $r = [];
            $this->levelRows($rw, $r, 0, $this->data['cols']);
            $this->data['rows'][] = $r;
        }
        return view('api/laporanbkrisikoprint', $this->data);
    }

}
