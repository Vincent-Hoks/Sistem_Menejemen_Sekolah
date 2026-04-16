<?php

namespace App\Models;
use App\Models\Siswa;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Jurusan extends Model
{
    protected $table = 'm_jurusan';
    protected $primaryKey = 'id_jurusan';

    protected $fillable = [
        'jurusan',
    ];

    public function siswa()
    {
        return $this->hasMany(Siswa::class, 'id_jurusan');
    }
    use SoftDeletes;
}