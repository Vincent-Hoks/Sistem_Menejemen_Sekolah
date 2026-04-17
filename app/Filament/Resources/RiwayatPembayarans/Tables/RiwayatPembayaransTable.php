<?php

namespace App\Filament\Resources\RiwayatPembayarans\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class RiwayatPembayaransTable
{

   public static function configure(Table $table): Table
{
    return $table
        ->columns([
            TextColumn::make('siswa.nama')->label('Nama Siswa'),
            TextColumn::make('tagihan.nama_tagihan')->label('Nama Tagihan'),
            TextColumn::make('nominal')->label('Total Pembayaran')->money('IDR', true),
            TextColumn::make('tanggal_bayar')->label('Tanggal Bayar')->date(),
        ])
        ->filters([
            //
        ])
        ->recordActions([
            ViewAction::make(),
            EditAction::make(),
        ])
        ->toolbarActions([
            BulkActionGroup::make([
                DeleteBulkAction::make(),
            ]),
        ]);
}
}
