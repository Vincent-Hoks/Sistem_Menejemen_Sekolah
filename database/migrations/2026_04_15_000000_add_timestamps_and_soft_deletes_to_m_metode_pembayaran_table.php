<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('m_metode_pembayaran', function (Blueprint $table) {
            if (! Schema::hasColumn('m_metode_pembayaran', 'created_at')) {
                $table->timestamps();
            }
            if (! Schema::hasColumn('m_metode_pembayaran', 'deleted_at')) {
                $table->softDeletes();
            }
        });
    }

    public function down(): void
    {
        Schema::table('m_metode_pembayaran', function (Blueprint $table) {
            if (Schema::hasColumn('m_metode_pembayaran', 'deleted_at')) {
                $table->dropSoftDeletes();
            }
            if (Schema::hasColumn('m_metode_pembayaran', 'created_at') || Schema::hasColumn('m_metode_pembayaran', 'updated_at')) {
                $table->dropTimestamps();
            }
        });
    }
};
