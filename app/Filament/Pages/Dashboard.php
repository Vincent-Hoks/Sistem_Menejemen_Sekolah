<?php

namespace App\Filament\Pages;

use Filament\Pages\Dashboard as BaseDashboard;
use Filament\Widgets\AccountWidget;
use App\Filament\Widgets\DashboardStats;

class Dashboard extends BaseDashboard
{
    protected function getHeaderWidgets(): array
    {
        return [
            AccountWidget::class,
        ];
    }

    protected function getFooterWidgets(): array
    {
        return [
            DashboardStats::class,
        ];
    }
}
