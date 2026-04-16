<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

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
}
