<?php

namespace App\Filament\Resources\Biayas\Pages;

use App\Filament\Resources\Biayas\BiayaResource;
use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\EditRecord;

class EditBiaya extends EditRecord
{
    protected static string $resource = BiayaResource::class;

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }
}
