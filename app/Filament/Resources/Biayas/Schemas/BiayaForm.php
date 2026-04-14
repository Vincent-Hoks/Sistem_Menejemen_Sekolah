<?php

namespace App\Filament\Resources\Biayas\Schemas;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class BiayaForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('jenis_biaya')
                    ->required(),
                TextInput::make('nominal')
                    ->required()
                    ->numeric(),
                Select::make('periode')
                    ->options(['bulanan' => 'Bulanan', 'tahunan' => 'Tahunan', 'sekali' => 'Sekali'])
                    ->required(),
            ]);
    }
}
