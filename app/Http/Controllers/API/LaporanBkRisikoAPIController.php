<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\BaseResourceController;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

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



    private function levelRows($rows, &$ret = [], $level = 0, $cols)
    {
        $rows = (array)$rows;
        foreach ($rows as $k => $r) {
            if (is_array($r)) {
                $levela = $level;
                foreach ($r as $rws) {
                    $this->levelRows($rws, $ret, $levela, $cols);
                    $levela++;
                }
            } else {
                if (in_array($k, $cols))
                    $ret[$level][$k] = $r;
            }
        }
        $level++;
    }

    public function print(Request $request)
    {
        $data = $request->all();

        $this->data['header'] = [];
        $this->data['cols'] = [];
        $this->levelHeader(
            $this->header(),
            explode(",", $data['header']),
            $this->data['header'],
            $this->data['cols']
        );
        $this->data['rows1'] = $rows = $this->model->laporan($data);
        $this->data['rows'] = [];
        // $rws = [$rows[0]];
        foreach ($rows as $rw) {
            $r = [];
            $this->levelRows($rw, $r, 0, $this->data['cols']);
            $this->data['rows'][] = $r;
        }
        return view('api/laporanbkrisikoprint', $this->data);
        // return $r;
    }

    public function printmatrik(Request $request)
    {
        $data = $request->all();
        $this->data['rowslimit'] = \App\Models\RiskCapacityLimit::laporan($data);
        $this->data['rowsmetrik'] = \App\Models\RiskMetrikStrategiRisiko::laporan($data);
        return view('api/laporanmetrikstrategirisikoprint', $this->data);
    }

    public function printsasaran(Request $request)
    {
        $data = $request->all();

        $this->data['header'] = [[
            "nama" => ["label" => "Pilihan Sasaran"],
            "nama_strategi" => ["label" => "Pilihan Strategi"],
            "hasil_yang_diharapkan" => ["label" => "Hasil yang diharapkan dapat diterima perusahaan"],
            "nilai_risiko" => ["label" => "Nilai Risiko Yang Akan Timbul"],
            "nilai_limit" => ["label" => "Nilai limit risiko sesuai dengan parameter risiko dalam Metrik Strategi Risiko"],
            "keputusan_penetapan" => ["label" => "Keputusan Penetapan"],
        ]];
        $this->data['cols'] = ["nama", "nama_strategi", "hasil_yang_diharapkan", "nilai_risiko", "nilai_limit", "keputusan_penetapan"];
        $this->data['rows'] = \App\Models\RiskSasaran::laporan($data);
        return view('api/laporanbkrisikoprint', $this->data);
    }

    public function printlossevent(Request $request)
    {
        $data = $request->all();

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
        $this->data['rows'] = \App\Models\LostEvent::laporan($data);
        return view('api/laporanbkrisikoprint', $this->data);
    }
}
