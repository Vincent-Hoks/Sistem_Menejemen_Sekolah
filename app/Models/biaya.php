<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class biaya extends Model
{
    //
    protected $table = 'm_biaya';
    protected $primaryKey = 'id_biaya';

    protected $fillable = [
        'jenis_biaya',
        'nominal',
        'periode',
    ];
}
