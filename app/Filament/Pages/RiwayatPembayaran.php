<?php

namespace App\Filament\Pages;

use BackedEnum;
use UnitEnum;
use Filament\Pages\Page;
use App\Filament\Widgets\RiwayatPembayaranGeneralWidget;
use App\Filament\Widgets\RiwayatPembayaranSPPWidget;

class RiwayatPembayaran extends Page
{
    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-document-text';
    protected static ?string $navigationLabel = 'Riwayat Pembayaran';
    protected static UnitEnum|string|null $navigationGroup = 'Transaksi';
    protected static ?int $navigationSort = 999;
    protected static ?string $title = 'Riwayat Pembayaran';

    protected function getFooterWidgets(): array
    {
        return [
            RiwayatPembayaranGeneralWidget::class,
            RiwayatPembayaranSPPWidget::class,
        ];
    }
}
