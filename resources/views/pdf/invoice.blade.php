<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Invoice Pembayaran</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: Arial, sans-serif;
            font-size: 12px;
            color: #333;
            background: #fff;
        }
        
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background: white;
        }
        
        .header {
            text-align: center;
            margin-bottom: 30px;
            border-bottom: 3px solid #333;
            padding-bottom: 15px;
        }
        
        .header h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 5px;
        }
        
        .header .subtitle {
            font-size: 14px;
            color: #666;
        }
        
        .invoice-number {
            text-align: center;
            margin-bottom: 20px;
            font-size: 14px;
        }
        
        .invoice-number .label {
            font-weight: bold;
        }
        
        .section {
            margin-bottom: 20px;
        }
        
        .section-title {
            font-weight: bold;
            margin-bottom: 8px;
            font-size: 12px;
            text-transform: uppercase;
            color: #333;
            border-bottom: 2px solid #007bff;
            padding-bottom: 5px;
        }
        
        .info-row {
            display: flex;
            margin-bottom: 6px;
            font-size: 11px;
        }
        
        .info-row .label {
            font-weight: bold;
            width: 150px;
            color: #555;
        }
        
        .info-row .value {
            flex: 1;
        }
        
        .detail-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        
        .detail-table th {
            background-color: #007bff;
            color: white;
            padding: 10px;
            text-align: left;
            font-size: 11px;
            font-weight: bold;
        }
        
        .detail-table td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            font-size: 11px;
        }
        
        .detail-table tr:last-child td {
            border-bottom: 2px solid #333;
        }
        
        .detail-table .text-right {
            text-align: right;
        }
        
        .detail-table .label-col {
            width: 50%;
            font-weight: bold;
            color: #333;
        }
        
        .detail-table .nominal-col {
            width: 50%;
            text-align: right;
            font-size: 14px;
        }
        
        .total-section {
            margin-top: 15px;
            padding: 15px;
            background-color: #f0f0f0;
            border-left: 4px solid #007bff;
            border-radius: 3px;
        }
        
        .total-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
            font-size: 12px;
        }
        
        .total-row.total {
            font-weight: bold;
            font-size: 14px;
            color: #007bff;
            margin-top: 10px;
            padding-top: 10px;
            border-top: 2px solid #ddd;
        }
        
        .footer {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #ddd;
            font-size: 9px;
            color: #999;
        }
        
        .status {
            text-align: center;
            padding: 15px;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            border-radius: 3px;
            color: #155724;
            margin-bottom: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <h1>INVOICE PEMBAYARAN</h1>
        </div>

        <!-- Status -->
        <div class="status">
            PEMBAYARAN DITERIMA
        </div>

        <!-- Invoice Number -->
        <div class="invoice-number">
            <span class="label">No. Invoice:</span>
            <span>{{ $invoice['nomor_invoice'] }}</span>
        </div>

        <!-- Tanggal & Waktu -->
        <div class="section">
            <div class="section-title">Informasi Pembayaran</div>
            <div class="info-row">
                <span class="label">Hari, Tanggal</span>
                <span class="value">: {{ $invoice['hari'] }}, {{ $invoice['waktu_dibuat'] }}</span>
            </div>
            <div class="info-row">
                <span class="label">Jam Dibuat</span>
                <span class="value">: {{ $invoice['jam'] }} WIB</span>
            </div>
            <div class="info-row">
                <span class="label">Tipe Pembayaran</span>
                <span class="value">: {{ $invoice['tipe'] }}</span>
            </div>
        </div>

        <!-- Data Siswa -->
        <div class="section">
            <div class="section-title">Data Siswa</div>
            <div class="info-row">
                <span class="label">Nama Siswa</span>
                <span class="value">: {{ $invoice['siswa']->nama_siswa }}</span>
            </div>
            <div class="info-row">
                <span class="label">NIPD</span>
                <span class="value">: {{ $invoice['siswa']->nipd }}</span>
            </div>
            <div class="info-row">
                <span class="label">Jurusan</span>
                <span class="value">: {{ $invoice['siswa']->jurusan?->jurusan ?? '-' }}</span>
            </div>
        </div>

        <!-- Detail Pembayaran -->
        <div class="section">
            <div class="section-title">Detail Pembayaran</div>
            <table class="detail-table">
                <tr>
                    <td class="label-col">Jenis Biaya</td>
                    <td class="nominal-col">{{ $invoice['jenis_biaya'] }}</td>
                </tr>
                <tr>
                    <td class="label-col">Metode Pembayaran</td>
                    <td class="nominal-col">{{ $invoice['metode_pembayaran'] }}</td>
                </tr>
                <tr>
                    <td class="label-col">Nominal Pembayaran</td>
                    <td class="nominal-col">Rp {{ number_format($invoice['nominal'], 0, ',', '.') }}</td>
                </tr>
            </table>

            <div class="total-section">
                <div class="total-row">
                    <span>Total Pembayaran:</span>
                    <span>Rp {{ number_format($invoice['nominal'], 0, ',', '.') }}</span>
                </div>
                <div class="total-row total">
                    <span>JUMLAH DIBAYAR:</span>
                    <span>Rp {{ number_format($invoice['nominal'], 0, ',', '.') }}</span>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            <p>Terima kasih telah melakukan pembayaran.</p>
            <p>Simpan invoice ini untuk arsip data Anda.</p>
            <p style="margin-top: 15px;">Dokumen ini dicetak otomatis pada {{ now()->format('d-m-Y H:i:s') }}</p>
        </div>
    </div>
</body>
</html>
