<?php

namespace App\Filament\Resources\Biayas\Pages;

use App\Filament\Resources\Concerns\RedirectsToIndex;
use App\Filament\Resources\Biayas\BiayaResource;
use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\EditRecord;

class EditBiaya extends EditRecord
{
    use RedirectsToIndex;

    protected static string $resource = BiayaResource::class;

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }
}
