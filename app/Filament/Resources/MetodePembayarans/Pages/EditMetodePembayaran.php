<?php

namespace App\Filament\Resources\MetodePembayarans\Pages;

use App\Filament\Resources\Concerns\RedirectsToIndex;
use App\Filament\Resources\MetodePembayarans\MetodePembayaranResource;
use Filament\Actions\DeleteAction;
use Filament\Actions\ForceDeleteAction;
use Filament\Actions\RestoreAction;
use Filament\Resources\Pages\EditRecord;

class EditMetodePembayaran extends EditRecord
{
    use RedirectsToIndex;

    protected static string $resource = MetodePembayaranResource::class;

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
            ForceDeleteAction::make(),
            RestoreAction::make(),
        ];
    }
}
