<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TrxSPP extends Model
{
    protected $table = 'trx_spp';
    protected $primaryKey = 'id_trx_spp';
    public $timestamps = false;

    protected $fillable = [
        'id_siswa',
        'id_spp',
        'nominal_bayar',
    ];

    // RELASI KE SISWA
    public function siswa()
    {
        return $this->belongsTo(
            \App\Models\Siswa::class,
            'id_siswa',
            'id_siswa'
        );
    }

    // RELASI KE SPP
    public function spp()
    {
        return $this->belongsTo(
            \App\Models\SPP::class,
            'id_spp',
            'id_spp'
        );
    }
}
