<?php

namespace App\Filament\Widgets;

use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;

class TunggakanWidget extends BaseWidget
{
    protected int|string|array $columnSpan = 'half';

    protected function getStats(): array
    {
        $tunggakan = Cache::remember('jumlah_tagihan', 300, function () {
            return DB::table('t_tagihan')
                ->where('status_tagihan', 'belum_lunas') // sesuaikan kalau beda
                ->sum('jumlah_tagihan'); // sesuaikan nama kolom
        });

        return [
            Stat::make(
                'Total Tagihan',
                'Rp ' . number_format($tunggakan, 0, ',', '.')
            )
                ->description('Total tagihan yang belum dibayar')
                ->descriptionIcon('heroicon-m-exclamation-triangle')
                ->color('danger'),
        ];
    }
}