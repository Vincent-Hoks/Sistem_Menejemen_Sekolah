<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class MetodePembayaran extends Model
{
    protected $table = 'm_metode_pembayaran';
    protected $primaryKey = 'id_metode_pembayaran';

    protected $fillable = [
        'metode_pembayaran',
    ];
        use SoftDeletes;
}
