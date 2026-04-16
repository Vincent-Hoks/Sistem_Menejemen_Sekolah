<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Biaya;


class BiayaToKelas extends Model
{
    protected $table = 'biaya_to_kelas';
    protected $primaryKey = 'id_biaya_to_kelas';
    public $timestamps = false;

    public function tingkatKelas()
    {
        return $this->belongsTo(TingkatKelas::class, 'id_tingkat_kelas', 'id_tingkat_kelas');
    }

    public function biaya()
    {
        return $this->belongsTo(Biaya::class, 'id_biaya', 'id_biaya');
    }
}
