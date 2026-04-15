<?php

namespace App\Filament\Resources\Jurusans\Pages;

use App\Filament\Resources\Concerns\RedirectsToIndex;
use App\Filament\Resources\Jurusans\JurusanResource;
use Filament\Resources\Pages\CreateRecord;

class CreateJurusan extends CreateRecord
{
    use RedirectsToIndex;

    protected static string $resource = JurusanResource::class;
}
