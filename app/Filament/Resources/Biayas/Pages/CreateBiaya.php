<?php

namespace App\Filament\Resources\Biayas\Pages;

use App\Filament\Resources\Biayas\BiayaResource;
use Filament\Actions\Action;
use Filament\Resources\Pages\CreateRecord;

class CreateBiaya extends CreateRecord
{
    protected static string $resource = BiayaResource::class;

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
