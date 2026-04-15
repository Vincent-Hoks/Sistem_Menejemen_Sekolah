<?php

namespace App\Filament\Resources\Siswas\Pages;

use App\Filament\Resources\Concerns\RedirectsToIndex;
use App\Filament\Resources\Siswas\SiswaResource;
use Filament\Resources\Pages\CreateRecord;

class CreateSiswa extends CreateRecord
{
    use RedirectsToIndex;

    protected static string $resource = SiswaResource::class;
}
