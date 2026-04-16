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
                Select::make('id_tingkat_kelas')
                    ->label('Untuk Kelas')
                    ->options([
                        1 => 'X',
                        2 => 'XI',
                        3 => 'XII',
                    ])
                    ->required()
            ]);
    }
}
