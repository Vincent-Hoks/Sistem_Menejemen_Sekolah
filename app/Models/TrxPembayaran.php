<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TrxPembayaran extends Model
{
    protected $table = 'trx_pembayaran';
    protected $primaryKey = 'id_trx_pembayaran';

    protected $fillable = [
        'id_biaya',
        'id_siswa',
        'id_metode_pembayaran',
        'nominal',
        'tanggal_bayar',
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

    // RELASI KE BIAYA
    public function biaya()
    {
        return $this->belongsTo(
            \App\Models\Biaya::class,
            'id_biaya',
            'id_biaya'
        );
    }

    // RELASI KE METODE PEMBAYARAN
    public function metode()
    {
        return $this->belongsTo(
            \App\Models\MetodePembayaran::class,
            'id_metode_pembayaran',
            'id_metode_pembayaran'
        );
    }
}
