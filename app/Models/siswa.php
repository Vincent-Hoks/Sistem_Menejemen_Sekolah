<?php

namespace App\Models;

use App\Models\Jurusan;
use App\Models\Kelas;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Siswa extends Model
{
    protected $table = 'm_siswa';
    protected $primaryKey = 'id_siswa';

    public $incrementing = true; // kalau auto increment
    protected $keyType = 'int'; // biasanya int

    protected $fillable = [
        'nipd',
        'nama_siswa',
        'id_jurusan',
        'id_tingkat_kelas',
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
        return $this->belongsTo(Kelas::class, 'id_tingkat_kelas');
    }

    use SoftDeletes;
}