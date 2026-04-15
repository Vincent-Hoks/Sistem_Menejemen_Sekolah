<?php

namespace App\Filament\Resources\MetodePembayarans\Schemas;

use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class MetodePembayaranForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('metode_pembayaran')
                    ->label('Metode Pembayaran')
                    ->required(),
            ]);
    }
}
