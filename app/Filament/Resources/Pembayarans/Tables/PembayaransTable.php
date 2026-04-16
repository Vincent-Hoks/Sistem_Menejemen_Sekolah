<?php

namespace App\Filament\Resources\Pembayarans\Tables;

use Filament\Actions\Action;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class PembayaransTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('nipd'),
                TextColumn::make('nama_siswa')->searchable(),
                TextColumn::make('jurusan.jurusan'),
                TextColumn::make('kelas.tingkat_kelas'),
            ])
            ->filters([
            ])
            ->recordActions([
                Action::make('customButton')
                    ->label('Detail')
                    ->icon('heroicon-o-star')
                    ->action(function ($record) {
                        dd($record);
                    }),
            ]);
    }
}