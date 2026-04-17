<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LaporanTunggakanController;
use App\Http\Controllers\InvoiceController;

Route::get('/', function () {
    return view('welcome');
});

// Route untuk download laporan tunggakan
Route::get('/laporan-tunggakan/{siswaid}/download', [LaporanTunggakanController::class, 'download'])
    ->name('laporan-tunggakan.download')
    ->middleware('auth');

// Route untuk download invoice
Route::get('/invoice/pembayaran/{idTrxPembayaran}', [InvoiceController::class, 'downloadPembayaran'])
    ->name('invoice.pembayaran')
    ->middleware('auth');

Route::get('/invoice/spp/{idTrxSPP}', [InvoiceController::class, 'downloadSPP'])
    ->name('invoice.spp')
    ->middleware('auth');
