<?php

namespace App\Filament\Resources\MetodePembayarans\Pages;

use App\Filament\Resources\Concerns\RedirectsToIndex;
use App\Filament\Resources\MetodePembayarans\MetodePembayaranResource;
use Filament\Resources\Pages\CreateRecord;

class CreateMetodePembayaran extends CreateRecord
{
    use RedirectsToIndex;

    protected static string $resource = MetodePembayaranResource::class;
}
