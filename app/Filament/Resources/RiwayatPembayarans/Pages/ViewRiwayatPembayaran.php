<?php

namespace App\Filament\Resources\RiwayatPembayarans\Pages;

use App\Filament\Resources\RiwayatPembayarans\RiwayatPembayaranResource;
use Filament\Actions\EditAction;
use Filament\Resources\Pages\ViewRecord;

class ViewRiwayatPembayaran extends ViewRecord
{
    protected static string $resource = RiwayatPembayaranResource::class;

    protected function getHeaderActions(): array
    {
        return [
            EditAction::make(),
        ];
    }
}
