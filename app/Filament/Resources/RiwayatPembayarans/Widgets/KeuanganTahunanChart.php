<?php

namespace App\Filament\Widgets;

use Filament\Widgets\ChartWidget;
use Illuminate\Support\Facades\DB;

class KeuanganTahunanChart extends ChartWidget
{
    protected ?string $heading = 'Keuangan Tahunan';

    protected function getData(): array
    {
        $data = DB::table('trx_pembayaran')
            ->selectRaw('YEAR(tanggal_bayar) as tahun, SUM(nominal) as total')
            ->groupBy('tahun')
            ->orderBy('tahun')
            ->pluck('total', 'tahun')
            ->toArray();

        return [
            'datasets' => [
                [
                    'label' => 'Pembayaran per Tahun',
                    'data' => array_map('intval', array_values($data)),
                ],
            ],
            'labels' => array_keys($data),
        ];
    }

    protected function getType(): string
    {
        return 'line';
    }

    protected int | string | array $columnSpan = 'full';
}