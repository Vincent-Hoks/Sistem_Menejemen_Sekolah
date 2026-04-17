<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        DB::statement('SET FOREIGN_KEY_CHECKS=0');

        try {
            // Step 1: Backup data ke table temp
            DB::statement('CREATE TABLE IF NOT EXISTS m_biaya_backup AS SELECT * FROM m_biaya');
            
            // Step 2: Delete duplikat dengan keeping hanya yang punya id unik dan valid
            DB::statement('DELETE FROM m_biaya WHERE id_biaya = 0 OR id_biaya IS NULL');
            
            // Step 3: Reset AUTO_INCREMENT
            DB::statement('ALTER TABLE m_biaya AUTO_INCREMENT = 1');
            
            // Step 4: Add AUTO_INCREMENT jika belum ada
            $result = DB::selectOne("SHOW CREATE TABLE m_biaya");
            if (strpos($result->{'Create Table'}, 'AUTO_INCREMENT') === false) {
                DB::statement('ALTER TABLE m_biaya MODIFY id_biaya INT(10) UNSIGNED NOT NULL AUTO_INCREMENT');
            }
            
        } finally {
            DB::statement('SET FOREIGN_KEY_CHECKS=1');
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Tidak ada revert yang aman untuk ini
    }
};
