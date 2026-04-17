<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SPP extends Model
{
    protected $table = 'm_spp';
    protected $primaryKey = 'id_spp';
    public $timestamps = false;

    protected $fillable = [
        'keterangan_spp',
        'id_tingkat_kelas',
        'id_jurusan',
        'spp',
    ];

    // RELASI KE TINGKAT KELAS
    public function tingkatKelas()
    {
        return $this->belongsTo(
            \App\Models\TingkatKelas::class,
            'id_tingkat_kelas',
            'id_tingkat_kelas'
        );
    }

    // RELASI KE JURUSAN
    public function jurusan()
    {
        return $this->belongsTo(
            \App\Models\Jurusan::class,
            'id_jurusan',
            'id_jurusan'
        );
    }

    // RELASI KE TRANSAKSI SPP
    public function transaksi()
    {
        return $this->hasMany(
            \App\Models\TrxSPP::class,
            'id_spp',
            'id_spp'
        );
    }
}
