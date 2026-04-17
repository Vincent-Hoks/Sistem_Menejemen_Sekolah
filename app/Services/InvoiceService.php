<?php

namespace App\Services;

use App\Models\TrxPembayaran;
use App\Models\TrxSPP;

class InvoiceService
{
    /**
     * Get invoice data for TrxPembayaran
     */
    public function getInvoicePembayaran($idTrxPembayaran)
    {
        $trx = TrxPembayaran::with(['siswa', 'biaya', 'metode'])->findOrFail($idTrxPembayaran);
        
        $createdAt = $trx->created_at ? \Carbon\Carbon::parse($trx->created_at)->setTimezone('Asia/Jakarta') : \Carbon\Carbon::now('Asia/Jakarta');

        return [
            'nomor_invoice' => $this->generateInvoiceNumber($trx->id_trx_pembayaran),
            'tipe' => 'Pembayaran Biaya',
            'siswa' => $trx->siswa,
            'jenis_biaya' => $trx->biaya->jenis_biaya,
            'nominal' => $trx->nominal,
            'metode_pembayaran' => $trx->metode->metode_pembayaran,
            'tanggal_bayar' => $trx->tanggal_bayar,
            'waktu_dibuat' => $createdAt->format('d-m-Y H:i:s'),
            'hari' => $this->getDayName($createdAt),
            'jam' => $createdAt->format('H:i:s'),
        ];
    }

    /**
     * Get invoice data for TrxSPP
     */
    public function getInvoiceSPP($idTrxSPP)
    {
        $trx = TrxSPP::with(['siswa', 'spp', 'metode'])->findOrFail($idTrxSPP);
        
        $metodeNama = $trx->metode?->metode_pembayaran ?? '-';
        $createdAt = $trx->created_at ? \Carbon\Carbon::parse($trx->created_at)->setTimezone('Asia/Jakarta') : \Carbon\Carbon::now('Asia/Jakarta');

        return [
            'nomor_invoice' => $this->generateInvoiceNumber($trx->id_trx_spp, 'SPP'),
            'tipe' => 'Pembayaran SPP',
            'siswa' => $trx->siswa,
            'jenis_biaya' => $trx->spp->keterangan_spp ?? 'SPP',
            'nominal' => $trx->nominal_bayar,
            'metode_pembayaran' => $metodeNama,
            'tanggal_bayar' => $createdAt->format('Y-m-d'),
            'waktu_dibuat' => $createdAt->format('d-m-Y H:i:s'),
            'hari' => $this->getDayName($createdAt),
            'jam' => $createdAt->format('H:i:s'),
        ];
    }

    /**
     * Generate invoice number
     */
    private function generateInvoiceNumber($id, $prefix = 'INV')
    {
        $date = now()->format('dmY');
        return "{$prefix}/{$date}/{$id}";
    }

    /**
     * Get Indonesian day name
     */
    private function getDayName($date)
    {
        $days = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];
        return $days[$date->dayOfWeek];
    }
}
