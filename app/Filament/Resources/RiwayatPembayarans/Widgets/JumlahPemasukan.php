<?php

namespace App\Filament\Widgets;

use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;

class JumlahPemasukanWidget extends BaseWidget
{
    protected int|string|array $columnSpan = 'half';

    protected function getStats(): array
    {
        $total = Cache::remember('total_penerimaan', 300, function () {
            return DB::table('trx_pembayaran')->sum('nominal');
        });

        return [
            Stat::make('Total Penerimaan', 'Rp ' . number_format($total, 0, ',', '.'))
                ->description('Total semua pembayaran')
                ->descriptionIcon('heroicon-m-banknotes')
                ->color('success'),
        ];
    }
}