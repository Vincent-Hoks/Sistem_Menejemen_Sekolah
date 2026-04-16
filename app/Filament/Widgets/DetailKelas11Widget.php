<?php

namespace App\Filament\Widgets;

use App\Models\Biaya;
use App\Models\Siswa;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget as BaseWidget;

class DetailKelas11Widget extends BaseWidget
{
    protected static ?string $heading = 'Detail Pembayaran Kelas 11 (XI)';

    protected static ?int $sort = 2;

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
                    ->whereHas('tingkatKelas', function ($query) {
                        $query->where('tingkat_kelas', 'XI');
                    })
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
            ])
            ->paginated(false)
            ->striped();
    }
}
