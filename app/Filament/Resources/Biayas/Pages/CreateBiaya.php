<?php

namespace App\Filament\Resources\Biayas\Pages;

use App\Filament\Resources\Concerns\RedirectsToIndex;
use App\Filament\Resources\Biayas\BiayaResource;
use Filament\Resources\Pages\CreateRecord;

class CreateBiaya extends CreateRecord
{
    use RedirectsToIndex;

    protected static string $resource = BiayaResource::class;
}
