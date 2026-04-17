<?php

namespace App\Filament\Widgets;

use App\Models\Biaya;
use App\Models\Siswa;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget as BaseWidget;

class DetailKelas10Widget extends BaseWidget
{
    protected static ?string $heading = 'Detail Pembayaran Kelas 10 (X)';

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
        return $table
            ->query(
                Biaya::query()
                    ->where('id_tingkat_kelas', 1)
                    ->orderBy('jenis_biaya', 'ASC')
            )
            ->columns([
                TextColumn::make('jenis_biaya')
                    ->label('Jenis Biaya')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('nominal')
                    ->label('Nominal')
                    ->numeric(
                        decimalPlaces: 0,
                        decimalSeparator: ',',
                        thousandsSeparator: '.'
                    )
                    ->sortable()
                    ->formatStateUsing(fn ($state) => 'Rp ' . number_format($state, 0, ',', '.')),
                TextColumn::make('nominal_terbayar')
                    ->label('Nominal Terbayar')
                    ->state(function (Biaya $record) {
                        if (!$this->siswa) {
                            return 0;
                        }
                        return $record->getNominalTerbayar($this->siswa->id_siswa);
                    })
                    ->numeric(
                        decimalPlaces: 0,
                        decimalSeparator: ',',
                        thousandsSeparator: '.'
                    )
                    ->formatStateUsing(fn ($state) => 'Rp ' . number_format($state ?? 0, 0, ',', '.')),
                TextColumn::make('Tunggakan')
                    ->label('Tunggakan')
                    ->state(function (Biaya $record) {
                        if (!$this->siswa) {
                            return 0;
                        }
                        $nominalTerbayar = $record->getNominalTerbayar($this->siswa->id_siswa);
                        $tunggakan = $record->nominal - $nominalTerbayar;
                        return max($tunggakan, 0);
                    })
                    ->numeric(
                        decimalPlaces: 0,
                        decimalSeparator: ',',
                        thousandsSeparator: '.'
                    )
                    ->formatStateUsing(fn ($state) => 'Rp ' . number_format($state ?? 0, 0, ',', '.')),
            ])
            ->paginated(false)
            ->striped();
    }
}
