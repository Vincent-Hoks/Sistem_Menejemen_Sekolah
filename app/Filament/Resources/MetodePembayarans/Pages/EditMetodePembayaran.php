<?php

namespace App\Filament\Resources\MetodePembayarans\Pages;

use App\Filament\Resources\MetodePembayarans\MetodePembayaranResource;
use Filament\Actions\Action;
use Filament\Actions\DeleteAction;
use Filament\Actions\ForceDeleteAction;
use Filament\Actions\RestoreAction;
use Filament\Resources\Pages\EditRecord;

class EditMetodePembayaran extends EditRecord
{
    protected static string $resource = MetodePembayaranResource::class;

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }

    protected function getSaveFormAction(): Action
    {
        return parent::getSaveFormAction()
            ->label('Simpan Perubahan');
    }

    protected function getCancelFormAction(): Action
    {
        return parent::getCancelFormAction()
            ->label('Batalkan');
    }

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make()
                ->label('Hapus'),
            ForceDeleteAction::make(),
            RestoreAction::make(),
        ];
    }
}
