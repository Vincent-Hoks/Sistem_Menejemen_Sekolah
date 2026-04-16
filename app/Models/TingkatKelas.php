<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class TingkatKelas extends Model
{
    protected $table = 'm_tingkat_kelas';
    protected $primaryKey = 'id_tingkat_kelas';
    public $timestamps = false;

    /**
     * Relasi: TingkatKelas memiliki banyak Biaya
     */
    public function biaya(): HasMany
    {
        return $this->hasMany(
            Biaya::class,
            'id_tingkat_kelas',
            'id_tingkat_kelas'
        );
    }
}
