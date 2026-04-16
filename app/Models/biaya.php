<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

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
}
