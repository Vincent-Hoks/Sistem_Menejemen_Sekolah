<?php

namespace App\Filament\Resources\RiwayatPembayarans\Schemas;

use Filament\Infolists\Components\TextEntry;
use Filament\Schemas\Schema;

class RiwayatPembayaranInfolist
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextEntry::make('id_tagihan')
                    ->numeric(),
                TextEntry::make('id_siswa')
                    ->numeric(),
                TextEntry::make('id_metode_pembayaran')
                    ->numeric(),
                TextEntry::make('nominal')
                    ->numeric(),
                TextEntry::make('tanggal_bayar')
                    ->date(),
                TextEntry::make('created_at')
                    ->dateTime()
                    ->placeholder('-'),
                TextEntry::make('updated_at')
                    ->dateTime()
                    ->placeholder('-'),
            ]);
    }
}
