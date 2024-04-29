<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class LostEvent extends BaseModel
{
    public $table = 'lost_event';

    protected $primaryKey = 'id_lost_event';

    public $fillable = [
        'nama_kejadian',
        'identifikasi_kejadian',
        'id_lost_event_kategori',
        'id_lost_event_sumber_penyebab_kejadian',
        'penanganan_saat_kejadian',
        'deskripsi_kejadian',
        'id_jenis_risiko',
        'id_taksonomi',
        'penjelasan_kerugian',
        'nilai_kerugian',
        'is_kejadian_berulang',
        'id_lost_event_frakuensi_kejadian',
        'mitigasi_yang_direncanakan',
        'realisasi_mitigasi',
        'perbaikan_mendatang',
        'pihak_terkait',
        'id_lost_event_status_asuransi',
        'nilai_premi',
        'nilai_klaim',
        'created_by',
        'updated_by',
        'deleted_by',
        'created_by_desc',
        'updated_by_desc',
        'deleted_by_desc',
        'penyebab_kejadian'
    ];

    protected $casts = [
        'nama_kejadian' => 'string',
        'identifikasi_kejadian' => 'string',
        'penanganan_saat_kejadian' => 'string',
        'deskripsi_kejadian' => 'string',
        'penjelasan_kerugian' => 'string',
        'nilai_kerugian' => 'decimal:2',
        'mitigasi_yang_direncanakan' => 'string',
        'realisasi_mitigasi' => 'string',
        'perbaikan_mendatang' => 'string',
        'pihak_terkait' => 'string',
        'nilai_premi' => 'decimal:2',
        'nilai_klaim' => 'decimal:2',
        'created_by_desc' => 'string',
        'updated_by_desc' => 'string',
        'deleted_by_desc' => 'string',
        'penyebab_kejadian' => 'string'
    ];

    public array $rules = [
        'nama_kejadian' => 'nullable|string|max:1000',
        'identifikasi_kejadian' => 'nullable|string|max:1000',
        'id_lost_event_kategori' => 'required',
        'id_lost_event_sumber_penyebab_kejadian' => 'nullable',
        'penanganan_saat_kejadian' => 'nullable|string|max:1000',
        'deskripsi_kejadian' => 'nullable|string|max:1000',
        'id_jenis_risiko' => 'nullable',
        'id_taksonomi' => 'nullable',
        'penjelasan_kerugian' => 'nullable|string|max:1000',
        'nilai_kerugian' => 'nullable|numeric',
        'is_kejadian_berulang' => 'nullable',
        'id_lost_event_frakuensi_kejadian' => 'nullable',
        'mitigasi_yang_direncanakan' => 'nullable|string|max:1000',
        'realisasi_mitigasi' => 'nullable|string|max:1000',
        'perbaikan_mendatang' => 'nullable|string|max:1000',
        'pihak_terkait' => 'nullable|string|max:1000',
        'id_lost_event_status_asuransi' => 'nullable',
        'nilai_premi' => 'nullable|numeric',
        'nilai_klaim' => 'nullable|numeric',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'created_by' => 'nullable',
        'updated_by' => 'nullable',
        'deleted_by' => 'nullable',
        'deleted_at' => 'nullable',
        'created_by_desc' => 'nullable|string|max:200',
        'updated_by_desc' => 'nullable|string|max:200',
        'deleted_by_desc' => 'nullable|string|max:200',
        'penyebab_kejadian' => 'nullable|string|max:1000'
    ];

    public function idLostEventKategori(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtLostEventKategori::class, 'id_lost_event_kategori');
    }

    public function idLostEventSumberPenyebabKejadian(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtLostEventSumberPenyebabKejadian::class, 'id_lost_event_sumber_penyebab_kejadian');
    }

    public function idJenisRisiko(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskJenisRisiko::class, 'id_jenis_risiko');
    }

    public function idTaksonomi(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtRiskTaksonomi::class, 'id_taksonomi');
    }

    public function idLostEventFrakuensiKejadian(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtLostEventFrakuensiKejadian::class, 'id_lost_event_frakuensi_kejadian');
    }

    public function idLostEventStatusAsuransi(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(\App\Models\MtLostEventStatusAsuransi::class, 'id_lost_event_status_asuransi');
    }
}
