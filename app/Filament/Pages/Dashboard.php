<?php

namespace App\Filament\Pages;

use Filament\Pages\Dashboard as BaseDashboard;

class Dashboard extends BaseDashboard
{
    protected function getHeaderWidgets(): array
    {
        return [
            \Filament\Widgets\AccountWidget::class, // pakai yang asli dulu
        ];
    }

    public function getHeaderWidgetsColumns(): int | array
    {
        return 1; // ⬅️ ini bikin dia full 1 baris
    }

    protected function getFooterWidgets(): array
    {
        return [
            \App\Filament\Widgets\SiswaChart::class,
            \App\Filament\Widgets\JurusanChart::class,
        ];
    }

    public function getFooterWidgetsColumns(): int | array
    {
        return 2; // ⬅️ ini bikin 2 kolom (berdampingan)
    }
}