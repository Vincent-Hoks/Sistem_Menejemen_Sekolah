<?php

namespace App\Filament\Resources\RiwayatPembayarans\Pages;
use App\Filament\Widgets\KeuanganBulananChart;
use App\Filament\Widgets\KeuanganTahunanChart;
use App\Filament\Resources\RiwayatPembayarans\RiwayatPembayaranResource;
use App\Filament\Widgets\JumlahPemasukanWidget;
use App\Filament\Widgets\TunggakanWidget;
use Filament\Resources\Pages\ListRecords;
class ListRiwayatPembayarans extends ListRecords
{
    protected static string $resource = RiwayatPembayaranResource::class;
    protected function getHeaderWidgets(): array
{
    return [
        JumlahPemasukanWidget::class,
        TunggakanWidget::class,
        KeuanganBulananChart::class,
        KeuanganTahunanChart::class,
        
    ];
}

    protected function shouldShowTable(): bool
    {
        return true;
    }
    
}
