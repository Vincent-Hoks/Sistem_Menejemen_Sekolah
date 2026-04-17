<?php

namespace App\Http\Controllers;

use App\Services\InvoiceService;
use Barryvdh\DomPDF\Facade\Pdf;

class InvoiceController extends Controller
{
    /**
     * Download invoice for pembayaran
     */
    public function downloadPembayaran($idTrxPembayaran)
    {
        try {
            $service = new InvoiceService();
            $invoice = $service->getInvoicePembayaran($idTrxPembayaran);

            $pdf = Pdf::loadView('pdf.invoice', ['invoice' => $invoice])
                ->setPaper('a4')
                ->setOption('margin-top', 10)
                ->setOption('margin-bottom', 10)
                ->setOption('margin-left', 10)
                ->setOption('margin-right', 10);

            $filename = 'Invoice-Pembayaran-' . $invoice['nomor_invoice'] . '.pdf';
            $filename = str_replace('/', '-', $filename);

            return $pdf->download($filename);
        } catch (\Exception $e) {
            abort(404, 'Transaksi tidak ditemukan: ' . $e->getMessage());
        }
    }

    /**
     * Download invoice for SPP
     */
    public function downloadSPP($idTrxSPP)
    {
        try {
            $service = new InvoiceService();
            $invoice = $service->getInvoiceSPP($idTrxSPP);

            $pdf = Pdf::loadView('pdf.invoice', ['invoice' => $invoice])
                ->setPaper('a4')
                ->setOption('margin-top', 10)
                ->setOption('margin-bottom', 10)
                ->setOption('margin-left', 10)
                ->setOption('margin-right', 10);

            $filename = 'Invoice-SPP-' . $invoice['nomor_invoice'] . '.pdf';
            $filename = str_replace('/', '-', $filename);

            return $pdf->download($filename);
        } catch (\Exception $e) {
            abort(404, 'Transaksi tidak ditemukan: ' . $e->getMessage());
        }
    }
}
