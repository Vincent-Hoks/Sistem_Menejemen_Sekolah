<?php

namespace App\Filament\Widgets;

use App\Models\Pembayaran;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class DashboardStats extends BaseWidget
{
    protected int|string|array $columnSpan = 'full';

    protected function getStats(): array
    {
        $bulan = now()->month;

        // transaksi bulan ini
        $transaksiBulanIni = Pembayaran::whereMonth('created_at', $bulan)->count();

        // total pemasukan bulan ini
        $totalPenerimaan = Pembayaran::whereMonth('created_at', $bulan)
            ->sum('nominal');

        return [
            Stat::make('Transaksi Bulan Ini', $transaksiBulanIni)
                ->description('Bulan ' . now()->translatedFormat('F'))
                ->icon('heroicon-o-credit-card')
                ->color('warning'),

            Stat::make('Total Penerimaan', 'Rp ' . number_format($totalPenerimaan, 0, ',', '.'))
                ->description('Pemasukan bulan ini')
                ->icon('heroicon-o-banknotes')
                ->color('success'),
        ];
    }

    protected function getColumns(): int
    {
        return 2;
    }
}