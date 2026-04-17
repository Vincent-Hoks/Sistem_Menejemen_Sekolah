<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RiwayatPembayaran extends Model
{
    protected $table = 'trx_pembayaran';

    protected $fillable = [
        'id_tagihan',
        'id_siswa',
        'id_metode_pembayaran',
        'nominal',
        'tanggal_bayar',
    ];

    public function siswa()
    {
        return $this->belongsTo(Siswa::class, 'id_siswa');
    }
}
