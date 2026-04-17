<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Facades\DB;

class Biaya extends Model
{
    protected $table = 'm_biaya';
    protected $primaryKey = 'id_biaya';
    public $timestamps = false;
    protected $fillable = [
        'jenis_biaya',
        'nominal',
        'id_tingkat_kelas',
    ];

    /**
     * Relasi: Biaya memiliki satu TingkatKelas
     */
    public function tingkatKelas(): BelongsTo
    {
        return $this->belongsTo(
            TingkatKelas::class,
            'id_tingkat_kelas',
            'id_tingkat_kelas'
        );
    }

    /**
     * Hitung total nominal yang sudah terbayar untuk siswa tertentu
     * Query acuan:
     * SELECT SUM(trx_pembayaran.nominal) AS total_pembayaran
     * FROM trx_pembayaran
     * JOIN m_biaya ON m_biaya.id_biaya = trx_pembayaran.id_biaya
     * JOIN m_siswa ON m_siswa.id_siswa = trx_pembayaran.id_siswa
     * WHERE trx_pembayaran.id_siswa = ? AND m_biaya.id_biaya = ?
     * GROUP BY m_siswa.nama_siswa, m_biaya.jenis_biaya
     */
    public function getNominalTerbayar($idSiswa)
    {
        if (!$idSiswa) {
            return 0;
        }
        
        $result = DB::table('trx_pembayaran')
            ->join('m_biaya', 'm_biaya.id_biaya', '=', 'trx_pembayaran.id_biaya')
            ->join('m_siswa', 'm_siswa.id_siswa', '=', 'trx_pembayaran.id_siswa')
            ->where('trx_pembayaran.id_siswa', (int)$idSiswa)
            ->where('m_biaya.id_biaya', (int)$this->id_biaya)
            ->sum('trx_pembayaran.nominal');
        
        return (float)($result ?? 0);
    }
}
