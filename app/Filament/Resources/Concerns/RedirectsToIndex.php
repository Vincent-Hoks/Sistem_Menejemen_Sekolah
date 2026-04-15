<?php

namespace App\Filament\Resources\Concerns;

trait RedirectsToIndex
{
    protected function getRedirectUrl(): string
    {
        return $this->getResourceUrl('index');
    }
}
