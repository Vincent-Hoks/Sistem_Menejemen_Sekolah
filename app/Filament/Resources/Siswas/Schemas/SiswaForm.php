<?php

namespace App\Filament\Resources\Siswas\Schemas;

use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;
use Filament\Schemas\Schema;

class SiswaForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('nipd'),

                TextInput::make('nama_siswa'),
                
                Select::make('id_jurusan')
                    ->label('Jurusan')
                    ->relationship('jurusan', 'jurusan')
                    ->searchable()
                    ->preload()
                    ->live()
                    ->required(),

                Select::make('Tingkat Kelas')
                ->relationship('kelas', 'tingkat_kelas')
                ->options([
                        '1' => 'X',
                        '2' => 'XI',
                        '3' => 'XII',
                        ]),

                TextInput::make('nama_ayah')
                    ->label('Nama Ayah')
                    ->required(),

                TextInput::make('nama_ibu')
                    ->label('Nama Ibu')
                    ->required(),
                TextInput::make('alamat')
                    ->label('Alamat')
                    ->required(),
            ]);
    }
}