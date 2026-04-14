<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // 1. m_jurusan
        Schema::create('m_jurusan', function (Blueprint $table) {
            $table->id('id_jurusan');
            $table->string('jurusan', 100);
            $table->timestamps();
        });

        // 2. m_tingkat_kelas
        Schema::create('m_tingkat_kelas', function (Blueprint $table) {
            $table->id('id_kelas');
            $table->string('tingkat_kelas', 20); // X, XI, XII
            $table->timestamps();
        });

        // 3. m_biaya
        Schema::create('m_biaya', function (Blueprint $table) {
            $table->id('id_biaya');
            $table->string('jenis_biaya', 100);
            $table->decimal('nominal', 12, 2);
            $table->enum('periode', ['bulanan', 'tahunan', 'sekali']);
            $table->timestamps();
        });

        // 4. m_siswa
        Schema::create('m_siswa', function (Blueprint $table) {
            $table->id('id_siswa');
            $table->string('nipd', 20)->unique();
            $table->string('nama_siswa', 150);
            $table->unsignedBigInteger('id_jurusan');
            $table->unsignedBigInteger('id_kelas');
            $table->enum('status', ['aktif', 'alumni', 'keluar'])->default('aktif');
            $table->timestamps();

            $table->foreign('id_jurusan')
                  ->references('id_jurusan')->on('m_jurusan')
                  ->onDelete('restrict');

            $table->foreign('id_kelas')
                  ->references('id_kelas')->on('m_tingkat_kelas')
                  ->onDelete('restrict');
        });

        // 5. t_tagihan
        Schema::create('t_tagihan', function (Blueprint $table) {
            $table->id('id_tagihan');
            $table->unsignedBigInteger('id_siswa');
            $table->unsignedBigInteger('id_biaya');
            $table->tinyInteger('bulan')->nullable(); // 1-12
            $table->year('tahun');
            $table->decimal('jumlah_tagihan', 12, 2);
            $table->date('tanggal_tagihan');
            $table->date('tanggal_jatuh_tempo')->nullable();
            $table->enum('status_tagihan', ['belum_bayar', 'sebagian', 'lunas'])
                  ->default('belum_bayar');
            $table->timestamps();

            $table->foreign('id_siswa')
                  ->references('id_siswa')->on('m_siswa')
                  ->onDelete('cascade');

            $table->foreign('id_biaya')
                  ->references('id_biaya')->on('m_biaya')
                  ->onDelete('restrict');
        });

        // 6. trx_pembayaran
        Schema::create('trx_pembayaran', function (Blueprint $table) {
            $table->id('id_trx_pembayaran');
            $table->unsignedBigInteger('id_tagihan');
            $table->unsignedBigInteger('id_siswa');
            $table->decimal('nominal', 12, 2);
            $table->date('tanggal_bayar');
            $table->enum('metode_bayar', ['tunai', 'transfer', 'virtual_account'])
                  ->default('tunai');
            $table->string('no_bukti', 100)->nullable();
            $table->text('keterangan')->nullable();
            $table->timestamps();

            $table->foreign('id_tagihan')
                  ->references('id_tagihan')->on('t_tagihan')
                  ->onDelete('restrict');

            $table->foreign('id_siswa')
                  ->references('id_siswa')->on('m_siswa')
                  ->onDelete('restrict');
        });
    }

    public function down(): void
    {
        // Drop urutan terbalik agar FK tidak error
        Schema::dropIfExists('trx_pembayaran');
        Schema::dropIfExists('t_tagihan');
        Schema::dropIfExists('m_siswa');
        Schema::dropIfExists('m_biaya');
        Schema::dropIfExists('m_tingkat_kelas');
        Schema::dropIfExists('m_jurusan');
    }
};