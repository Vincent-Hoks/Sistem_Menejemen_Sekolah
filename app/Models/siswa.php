<?php

namespace App\Models;

use App\Models\Jurusan;
use App\Models\Kelas;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class siswa extends Model
{
    protected $table = 'm_siswa';
    protected $primaryKey = 'id_siswa';

    protected $fillable = [
        'nipd',
        'nama_siswa',
        'id_jurusan',
        'id_kelas',
        'nama_ayah',
        'nama_ibu',
        'alamat',
        'status',
    ];

    public function jurusan()
    {
        return $this->belongsTo(Jurusan::class, 'id_jurusan');
    }

    public function kelas()
    {
        return $this->belongsTo(Kelas::class, 'id_kelas');
    }
    use SoftDeletes;
}