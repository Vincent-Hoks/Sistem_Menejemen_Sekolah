<?php

namespace App\Filament\Resources\Siswas\Schemas;

use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;
use Filament\Schemas\Schema;
use Illuminate\Validation\Rules\Unique;

class SiswaForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('nipd')
                    ->label('NIPD (Nomor Induk Siswa)')
                    ->required()
                    ->unique('m_siswa', 'nipd', ignoreRecord: true)
                    ->validationMessages([
                        'unique' => 'NIPD sudah terdaftar di database. Gunakan NIPD lain.',
                    ]),

                TextInput::make('nama_siswa')
                    ->label('Nama Siswa')
                    ->required(),
                
                Select::make('id_jurusan')
                    ->label('Jurusan')
                    ->relationship('jurusan', 'jurusan')
                    ->searchable()
                    ->preload()
                    ->live()
                    ->required(),

                Select::make('id_tingkat_kelas')
                    ->label('Tingkat Kelas')
                    ->relationship('kelas', 'tingkat_kelas')
                    ->searchable()
                    ->preload()
                    ->live()
                    ->required(),

                TextInput::make('nama_ayah')
                    ->label('Nama Ayah')
                    ->required()
                    ->rules(['regex:/^[a-zA-Z\s]+$/']),

                TextInput::make('nama_ibu')
                    ->label('Nama Ibu')
                    ->required()
                    ->rules(['regex:/^[a-zA-Z\s]+$/']),
                TextInput::make('alamat')
                    ->label('Alamat')
                    ->required()
                    ->rules(['regex:/^[a-zA-Z\s]+$/']),
            ]);
    }
}