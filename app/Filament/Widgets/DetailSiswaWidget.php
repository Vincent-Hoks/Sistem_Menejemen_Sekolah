<?php

namespace App\Filament\Widgets;

use App\Models\Siswa;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget as BaseWidget;

class DetailSiswaWidget extends BaseWidget
{
    protected static ?string $heading = 'Informasi Siswa';

    protected static ?int $sort = 1;

    public ?Siswa $siswa = null;

    public function mount(?Siswa $siswa = null): void
    {
        $this->siswa = $siswa;
    }

    public static function canView(): bool
    {
        return request()->routeIs('filament.admin.resources.pembayarans.detail');
    }

    public function table(Table $table): Table
    {
        $siswa = $this->siswa;

        return $table
            ->query(
                Siswa::query()->where('id_siswa', $siswa?->id_siswa ?? 0)
            )
            ->columns([
                TextColumn::make('nipd')
                    ->label('NIPD'),
                TextColumn::make('nama_siswa')
                    ->label('Nama Siswa'),
                TextColumn::make('kelas.tingkat_kelas')
                    ->label('Kelas')
                    ->state(function (Siswa $record) {
                        return match($record->id_tingkat_kelas) {
                            1 => 'X',
                            2 => 'XI',
                            3 => 'XII',
                            default => '-'
                        };
                    }),
                TextColumn::make('jurusan.jurusan')
                    ->label('Jurusan'),
            ])
            ->paginated(false)
            ->striped();
    }
}
