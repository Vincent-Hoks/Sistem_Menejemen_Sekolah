<?php

namespace App\Filament\Widgets;

use Filament\Widgets\ChartWidget;
use Illuminate\Support\Facades\DB;

class JurusanChart extends ChartWidget
{
    protected static ?int $sort = 2;
   protected int | string | array $columnSpan = [
    'md' => 1,
    'xl' => 1,
    ];
    protected static ?string $height = '180px';
    protected static ?int $rowSpan = 1;

    protected function getExtraAttributes(): array
    {
        return [
            'class' => 'p-0 m-0 [&>div]:p-0.5 [&_.fi-chart-root]:p-1.5 h-[160px] shadow-sm border-l border-gray-200/50',
        ];
    }

    protected ?string $heading = 'Jumlah Siswa per Jurusan';

    protected function getData(): array
    {
        $data = DB::table('m_siswa')
            ->join('m_jurusan', 'm_siswa.id_jurusan', '=', 'm_jurusan.id_jurusan')
            ->select('m_jurusan.jurusan', DB::raw('COUNT(*) as total'))
            ->groupBy('m_jurusan.jurusan')
            ->pluck('total', 'm_jurusan.jurusan')
            ->toArray();

        $brightColors = [
            '#007bff', // Bright Blue
            '#28a745', // Bright Green
            '#ffc107', // Bright Yellow
            '#dc3545', // Bright Red
            '#6f42c1', // Bright Purple
            '#fd7e14', // Bright Orange
            '#17a2b8', // Bright Cyan
            '#e83e8c', // Bright Pink
            '#20c997', // Bright Teal
            '#6610f2', // Bright Indigo
        ];

        return [
            'datasets' => [
                [
                    'data'            => array_values($data),
                    'backgroundColor' => array_slice($brightColors, 0, count($data)),
                ],
            ],
            'labels' => array_keys($data),
        ];
    }

    protected function getType(): string
    {
        return 'pie';
    }
}