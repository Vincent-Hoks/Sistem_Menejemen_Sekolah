<?php

namespace App\Filament\Widgets;

use Filament\Widgets\ChartWidget;
use Illuminate\Support\Facades\DB;

class KeuanganBulananChart extends ChartWidget
{
    protected ?string $heading = 'Keuangan Bulanan';

    public ?string $filter = null;

    //  otomatis tahun sekarang
    public function mount(): void
    {
        $this->filter = date('Y');
    }

    // filter dinamis dari database
    protected function getFilters(): ?array
    {
        return DB::table('trx_pembayaran')
            ->selectRaw('YEAR(tanggal_bayar) as tahun')
            ->distinct()
            ->orderBy('tahun')
            ->pluck('tahun', 'tahun')
            ->toArray();
    }

    protected function getData(): array
    {
        $year = $this->filter;

        $data = DB::table('trx_pembayaran')
            ->selectRaw('MONTH(tanggal_bayar) as bulan, SUM(nominal) as total')
            ->whereYear('tanggal_bayar', $year)
            ->groupBy('bulan')
            ->pluck('total', 'bulan')
            ->toArray();

        $result = [];
        for ($i = 1; $i <= 12; $i++) {
            $result[] = (int) ($data[$i] ?? 0);
        }

        return [
            'datasets' => [
                [
                    'label' => "Total Pembayaran Tahun $year",
                    'data' => $result,
                ],
            ],
            'labels' => [
                'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
                'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'
            ],
        ];
    }

    protected function getType(): string
    {
        return 'bar';
    }

    protected int | string | array $columnSpan = 'full';
}