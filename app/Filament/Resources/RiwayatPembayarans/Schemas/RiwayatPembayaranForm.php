<?php

namespace App\Filament\Resources\RiwayatPembayarans\Schemas;

use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class RiwayatPembayaranForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('id_tagihan')
                    ->required()
                    ->numeric(),
                TextInput::make('id_siswa')
                    ->required()
                    ->numeric(),
                TextInput::make('id_metode_pembayaran')
                    ->required()
                    ->numeric()
                    ->default(0),
                TextInput::make('nominal')
                    ->required()
                    ->numeric(),
                DatePicker::make('tanggal_bayar')
                    ->required(),
            ]);
    }
}
