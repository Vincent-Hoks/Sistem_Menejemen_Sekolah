<?php

namespace App\Filament\Resources\Biayas\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class BiayasTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('jenis_biaya')
                    ->searchable(),
                TextColumn::make('nominal')
                    ->numeric()
                    ->sortable(),
            
                TextColumn::make('id_tingkat_kelas')
                    ->label('Untuk Kelas')
                    ->formatStateUsing(function ($state) {
                        return match ($state) {
                            1 => 'X',
                            2 => 'XI',
                            3 => 'XII',
                            default => $state,
                        };
                    })
                    ->badge(),
                TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->recordActions([
                EditAction::make(),
                DeleteAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
