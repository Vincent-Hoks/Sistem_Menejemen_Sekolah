<?php

namespace App\Filament\Resources\MetodePembayarans\Pages;

use App\Filament\Resources\MetodePembayarans\MetodePembayaranResource;
use Filament\Actions\Action;
use Filament\Resources\Pages\CreateRecord;

class CreateMetodePembayaran extends CreateRecord
{
    protected static string $resource = MetodePembayaranResource::class;

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }

    protected function getCreateFormAction(): Action
    {
        return parent::getCreateFormAction()
            ->label('Tambah');
    }

    protected function getCreateAnotherFormAction(): Action
    {
        return parent::getCreateAnotherFormAction()
            ->label('Tambah & Tambah Lagi');
    }

    protected function getCancelFormAction(): Action
    {
        return parent::getCancelFormAction()
            ->label('Batalkan');
    }
}
