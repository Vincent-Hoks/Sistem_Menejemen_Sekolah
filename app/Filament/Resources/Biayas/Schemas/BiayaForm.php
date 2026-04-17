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
                    ->required()
                    ->label('Jenis Biaya')
                    ->maxLength(100)
                    ->rules(['regex:/^[a-zA-Z\s]+$/']),

                TextInput::make('nominal')
                    ->required()
                    ->numeric()
                    ->minValue(0)
                    ->label('Nominal')
                    ->rules(['integer', 'min:0']),
                    
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
