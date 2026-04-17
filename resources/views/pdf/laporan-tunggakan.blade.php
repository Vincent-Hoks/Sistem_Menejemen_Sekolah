<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Laporan Tunggakan</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: Arial, sans-serif;
            font-size: 11px;
            color: #333;
            line-height: 1.4;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .header {
            text-align: center;
            margin-bottom: 30px;
            border-bottom: 3px solid #333;
            padding-bottom: 15px;
        }
        
        .header h1 {
            font-size: 20px;
            margin-bottom: 5px;
        }
        
        .header p {
            font-size: 10px;
            color: #666;
        }
        
        .info-section {
            margin-bottom: 20px;
            background: #f9f9f9;
            padding: 12px;
            border-left: 4px solid #007bff;
        }
        
        .info-row {
            display: flex;
            margin-bottom: 5px;
            font-size: 11px;
        }
        
        .info-label {
            width: 150px;
            font-weight: bold;
            color: #333;
        }
        
        .info-value {
            flex: 1;
        }
        
        .section-title {
            font-weight: bold;
            font-size: 12px;
            margin-top: 15px;
            margin-bottom: 10px;
            background: #007bff;
            color: white;
            padding: 8px;
            border-radius: 3px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 15px;
            font-size: 10px;
        }
        
        table th {
            background-color: #007bff;
            color: white;
            padding: 8px;
            text-align: left;
            font-weight: bold;
            border: 1px solid #ddd;
        }
        
        table td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: left;
        }
        
        table tr:nth-child(even) {
            background-color: #f5f5f5;
        }
        
        .biaya-name {
            font-weight: bold;
            color: #333;
            width: 25%;
        }
        
        .nominal-col {
            text-align: right;
            width: 15%;
        }
        
        .month-col {
            text-align: center;
            width: 8%;
            font-size: 9px;
        }
        
        .status-ok {
            background-color: #d4edda;
            color: #155724;
            text-align: center;
            font-weight: bold;
        }
        
        .status-warn {
            background-color: #fff3cd;
            color: #856404;
            text-align: center;
            font-weight: bold;
        }
        
        .status-partial {
            background-color: #cce5ff;
            color: #004085;
            text-align: center;
            font-weight: bold;
        }
        
        .summary {
            display: flex;
            gap: 15px;
            margin-top: 20px;
            flex-wrap: wrap;
        }
        
        .summary-box {
            flex: 1;
            min-width: 200px;
            padding: 15px;
            border-radius: 5px;
            border: 2px solid #ddd;
        }
        
        .summary-box.lunas {
            background: #d4edda;
            border-color: #28a745;
        }
        
        .summary-box.sebagian {
            background: #fff3cd;
            border-color: #ffc107;
        }
        
        .summary-box.belum {
            background: #f8d7da;
            border-color: #dc3545;
        }
        
        .summary-box h3 {
            font-size: 11px;
            margin-bottom: 5px;
        }
        
        .summary-box p {
            font-size: 13px;
            font-weight: bold;
        }
        
        .footer {
            text-align: center;
            margin-top: 30px;
            padding-top: 15px;
            border-top: 1px solid #ddd;
            font-size: 9px;
            color: #999;
        }
        
        .nominal-display {
            text-align: right;
            font-size: 10px;
            color: #666;
            margin-bottom: 3px;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <h1>[LAPORAN TUNGGAKAN]</h1>
            <p>Sistem Manajemen Sekolah</p>
        </div>

        <!-- Data Siswa -->
        <div class="info-section">
            <div class="info-row">
                <span class="info-label">Nama Siswa</span>
                <span class="info-value">: {{ $laporan['siswa']->nama_siswa }}</span>
            </div>
            <div class="info-row">
                <span class="info-label">NIPD</span>
                <span class="info-value">: {{ $laporan['siswa']->nipd }}</span>
            </div>
            <div class="info-row">
                <span class="info-label">Jurusan</span>
                <span class="info-value">: {{ $laporan['siswa']->jurusan?->jurusan ?? '-' }}</span>
            </div>
            <div class="info-row">
                <span class="info-label">Kelas</span>
                <span class="info-value">: {{ $laporan['siswa']->tingkatKelas?->tingkat_kelas ?? '-' }}</span>
            </div>
            <div class="info-row">
                <span class="info-label">Tanggal Laporan</span>
                <span class="info-value">: {{ $laporan['tanggal_laporan'] }}</span>
            </div>
        </div>

        <!-- BIAYA SECTION -->
        <div class="section-title">[BIAYA]</div>
        @if($laporan['biaya']->count() > 0)
            <table>
                <thead>
                    <tr>
                        <th style="width: 35%;">Jenis Biaya</th>
                        <th style="width: 15%; text-align: right;">Nominal</th>
                        <th style="width: 15%; text-align: right;">Terbayar</th>
                        <th style="width: 15%; text-align: right;">Sisa</th>
                        <th style="width: 20%; text-align: center;">Status</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($laporan['biaya'] as $biaya)
                        <tr>
                            <td class="biaya-name">
                                {{ $biaya->jenis_biaya }}
                                <div class="nominal-display">Rp {{ number_format($biaya->nominal, 0, ',', '.') }}</div>
                            </td>
                            <td class="nominal-col">Rp {{ number_format($biaya->nominal, 0, ',', '.') }}</td>
                            <td class="nominal-col">Rp {{ number_format($biaya->nominal_terbayar, 0, ',', '.') }}</td>
                            <td class="nominal-col">Rp {{ number_format($biaya->tunggakan, 0, ',', '.') }}</td>
                            <td style="text-align: center;">
                                @if($biaya->tunggakan == 0)
                                    <span class="status-ok">[OK]</span>
                                @elseif($biaya->nominal_terbayar > 0)
                                    <span class="status-partial">[SEBAGIAN]</span>
                                @else
                                    <span class="status-warn">[!]</span>
                                @endif
                            </td>
                        </tr>
                        <!-- Breakdown per bulan -->
                        @if(isset($biaya->bulan_breakdown) && count($biaya->bulan_breakdown) > 0)
                            <tr style="background: #f0f0f0; font-size: 9px;">
                                <td colspan="5">
                                    <strong>Rincian per Bulan:</strong>
                                    @foreach($biaya->bulan_breakdown as $bulan => $detail)
                                        <div style="padding: 3px 0;">
                                            Bulan {{ $bulan }}: Harga Rp {{ number_format($detail['harga'], 0, ',', '.') }} | 
                                            Bayar Rp {{ number_format($detail['bayar'], 0, ',', '.') }} | 
                                            Sisa Rp {{ number_format($detail['sisa'], 0, ',', '.') }} 
                                            @if($detail['sisa'] == 0) <span style="color: green;">[LUNAS]</span> @endif
                                        </div>
                                    @endforeach
                                </td>
                            </tr>
                        @endif
                    @endforeach
                </tbody>
            </table>
        @else
            <p style="text-align: center; color: #666; margin: 20px 0;">Tidak ada tunggakan biaya</p>
        @endif

        <!-- SPP SECTION -->
        <div class="section-title">[SPP]</div>
        @if($laporan['spp']->count() > 0)
            <table>
                <thead>
                    <tr>
                        <th style="width: 35%;">Keterangan SPP</th>
                        <th style="width: 15%; text-align: right;">Nominal</th>
                        <th style="width: 15%; text-align: right;">Terbayar</th>
                        <th style="width: 15%; text-align: right;">Sisa</th>
                        <th style="width: 20%; text-align: center;">Status</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($laporan['spp'] as $spp)
                        <tr>
                            <td class="biaya-name">
                                {{ $spp->keterangan_spp ?? 'SPP' }}
                                <div class="nominal-display">Rp {{ number_format($spp->spp, 0, ',', '.') }}/bulan</div>
                            </td>
                            <td class="nominal-col">Rp {{ number_format($spp->nominal_total, 0, ',', '.') }}</td>
                            <td class="nominal-col">Rp {{ number_format($spp->nominal_terbayar, 0, ',', '.') }}</td>
                            <td class="nominal-col">Rp {{ number_format($spp->tunggakan, 0, ',', '.') }}</td>
                            <td style="text-align: center;">
                                @if($spp->tunggakan == 0)
                                    <span class="status-ok">[OK]</span>
                                @elseif($spp->nominal_terbayar > 0)
                                    <span class="status-partial">[SEBAGIAN]</span>
                                @else
                                    <span class="status-warn">[!]</span>
                                @endif
                            </td>
                        </tr>
                        <!-- Breakdown per bulan -->
                        @if(isset($spp->bulan_breakdown) && count($spp->bulan_breakdown) > 0)
                            <tr style="background: #f0f0f0; font-size: 9px;">
                                <td colspan="5">
                                    <strong>Rincian per Bulan:</strong>
                                    @foreach($spp->bulan_breakdown as $bulan => $detail)
                                        <div style="padding: 3px 0;">
                                            Bulan {{ $bulan }}: Rp {{ number_format($detail['harga'], 0, ',', '.') }} | 
                                            Bayar Rp {{ number_format($detail['bayar'], 0, ',', '.') }} | 
                                            Sisa Rp {{ number_format($detail['sisa'], 0, ',', '.') }} 
                                            @if($detail['sisa'] == 0) <span style="color: green;">[LUNAS]</span> @endif
                                        </div>
                                    @endforeach
                                </td>
                            </tr>
                        @endif
                    @endforeach
                </tbody>
            </table>
        @else
            <p style="text-align: center; color: #666; margin: 20px 0;">Tidak ada tunggakan SPP</p>
        @endif

        <!-- Footer -->
        <div class="footer">
            <p>Laporan ini digenerate otomatis oleh Sistem Manajemen Sekolah</p>
        </div>
    </div>
</body>
</html>
