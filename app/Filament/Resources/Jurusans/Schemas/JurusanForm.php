<?php

namespace App\Filament\Resources\Jurusans\Schemas;

use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class JurusanForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('jurusan')
                    ->label('Jurusan')
                    ->required(),
                TextInput::make('spp_pokok_jurusan')
                    ->label('SPP Pokok Jurusan')
                    ->numeric()
                    ->inputMode('decimal')
                    ->step('1')
                    ->required(),
            ]);
    }
}
