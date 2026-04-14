<?php

namespace App\Models;
use App\Models\Siswa;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Kelas extends Model
{
    protected $table = 'm_tingkat_kelas';
    protected $primaryKey = 'id_tingkat_kelas';

    public function siswa()
    {
        return $this->hasMany(Siswa::class, 'id_tingkat_kelas');
    }
    use SoftDeletes;
}