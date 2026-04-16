<?php

namespace App\Models;
// use App\Models\Siswa;
use Illuminate\Database\Eloquent\Model;

class Pembayaran extends Model
{
    //
    protected $table = 'trx_pembayaran';
    protected $primaryKey = 'id_trx_pembayaran';

    protected $fillable = [
        'id_tagihan',
        'id_siswa',
        'id_metode_pembayaran',
        'nominal',
        'tanggal_bayar',
    ];

public function siswa()
{
    return $this->belongsTo(
        \App\Models\Siswa::class,
        'id_siswa',     // FK di pembayarans
        'id_siswa'      // PK di m_siswa
    );
}
}
