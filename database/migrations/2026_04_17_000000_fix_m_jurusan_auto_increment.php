<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        // Disable foreign key checks
        DB::statement('SET FOREIGN_KEY_CHECKS=0');

        // Drop foreign key constraints yang mereferensi m_jurusan
        try {
            DB::statement('ALTER TABLE m_siswa DROP FOREIGN KEY FK_m_siswa_m_jurusan');
        } catch (\Exception $e) {
            // FK mungkin tidak ada
        }

        // Alter table untuk set id_jurusan sebagai AUTO_INCREMENT
        DB::statement('ALTER TABLE m_jurusan MODIFY id_jurusan INT(10) UNSIGNED NOT NULL AUTO_INCREMENT');

        // Restore foreign key
        DB::statement('ALTER TABLE m_siswa ADD CONSTRAINT FK_m_siswa_m_jurusan FOREIGN KEY (id_jurusan) REFERENCES m_jurusan(id_jurusan) ON DELETE NO ACTION ON UPDATE NO ACTION');

        // Enable foreign key checks
        DB::statement('SET FOREIGN_KEY_CHECKS=1');
    }

    public function down(): void
    {
        // Disable foreign key checks
        DB::statement('SET FOREIGN_KEY_CHECKS=0');

        // Drop foreign key
        try {
            DB::statement('ALTER TABLE m_siswa DROP FOREIGN KEY FK_m_siswa_m_jurusan');
        } catch (\Exception $e) {
            // FK mungkin tidak ada
        }

        // Revert: remove AUTO_INCREMENT
        DB::statement('ALTER TABLE m_jurusan MODIFY id_jurusan INT(10) UNSIGNED NOT NULL');

        // Restore foreign key
        DB::statement('ALTER TABLE m_siswa ADD CONSTRAINT FK_m_siswa_m_jurusan FOREIGN KEY (id_jurusan) REFERENCES m_jurusan(id_jurusan) ON DELETE NO ACTION ON UPDATE NO ACTION');

        // Enable foreign key checks
        DB::statement('SET FOREIGN_KEY_CHECKS=1');
    }
};
