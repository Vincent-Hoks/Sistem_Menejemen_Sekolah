<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        // Alter table untuk set id_jurusan sebagai AUTO_INCREMENT
        DB::statement('ALTER TABLE m_jurusan MODIFY id_jurusan INT(10) AUTO_INCREMENT NOT NULL');
    }

    public function down(): void
    {
        // Revert: remove AUTO_INCREMENT
        DB::statement('ALTER TABLE m_jurusan MODIFY id_jurusan INT(10) NOT NULL');
    }
};
