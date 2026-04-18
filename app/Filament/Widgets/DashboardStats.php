<?php

namespace App\Filament\Widgets;

use App\Models\Siswa;
use App\Models\TrxPembayaran;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class DashboardStats extends BaseWidget
{
    protected int|string|array $columnSpan = 'full';

    protected function getStats(): array
    {
        $jumlahSiswa = Siswa::count();

        $transaksiBulanIni = TrxPembayaran::whereMonth('created_at', now()->month)
            ->count();

        $totalPenerimaan = TrxPembayaran::sum('nominal');

        return [
            Stat::make('Jumlah Siswa', $jumlahSiswa)
                ->description('Total siswa')
                ->icon('heroicon-o-users')
                ->color('primary'),

            Stat::make('Transaksi Bulan Ini', $transaksiBulanIni)
                ->description('Pembayaran bulan ini')
                ->icon('heroicon-o-credit-card')
                ->color('warning'),

            Stat::make('Total Penerimaan', 'Rp ' . number_format($totalPenerimaan, 0, ',', '.'))
                ->description('Total pemasukan')
                ->icon('heroicon-o-banknotes')
                ->color('success'),

            Stat::make('Siswa Lunas', '-')
                ->description('Sudah bayar')
                ->icon('heroicon-o-check-circle')
                ->color('success'),
        ];
    }
}
