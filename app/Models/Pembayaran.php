<?php

namespace App\Models;
// use App\Models\Siswa;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

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

    /**
     * Hitung total nominal yang sudah terbayar untuk siswa tertentu
     * Query: SUM(nominal) dari trx_pembayaran WHERE id_siswa = ? AND id_biaya = ?
     */
    public function getNominalTerbayar($idSiswa)
    {
        return DB::table('trx_pembayaran')
            ->where('id_siswa', $idSiswa)
            ->where('id_biaya', $this->id_biaya)
            ->sum('nominal');
    }
}
