<?php

namespace App\Models;
use App\Models\Siswa;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Jurusan extends Model
{
    protected $table = 'm_jurusan';
    protected $primaryKey = 'id_jurusan';
    
    // Pastikan primary key auto increment
    public $incrementing = true;
    protected $keyType = 'int';

    protected $fillable = [
        'jurusan',
        'spp_pokok_jurusan',
    ];

    public function siswa()
    {
        return $this->hasMany(Siswa::class, 'id_jurusan');
    }
    use SoftDeletes;
}