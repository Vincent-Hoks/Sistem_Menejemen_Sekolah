<?php

namespace App\Filament\Widgets;

use App\Models\TrxPembayaran;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget as BaseWidget;

class RiwayatPembayaranWidget extends BaseWidget
{
    protected static ?string $heading = 'Riwayat Pembayaran';
    protected int | string | array $columnSpan = 'full';

    public function table(Table $table): Table
    {
        return $table
            ->query(
                TrxPembayaran::query()
                    ->selectRaw('
                        m_siswa.nama_siswa,
                        trx_pembayaran.nominal,
                        m_metode_pembayaran.metode_pembayaran,
                        trx_pembayaran.tanggal_bayar
                    ')
                    ->join('m_siswa', 'trx_pembayaran.id_siswa', '=', 'm_siswa.id_siswa')
                    ->join('m_metode_pembayaran', 'm_metode_pembayaran.id_metode_pembayaran', '=', 'trx_pembayaran.id_metode_pembayaran')
                    ->latest('trx_pembayaran.tanggal_bayar')
                    ->limit(2)
            )
            ->columns([
                Tables\Columns\TextColumn::make('nama_siswa')
                    ->label('Nama Siswa')
                    ->sortable(),
                Tables\Columns\TextColumn::make('nominal')
                    ->label('Nominal')
                    ->formatStateUsing(fn ($state) => 'Rp ' . number_format($state, 0, ',', '.'))
                    ->sortable(),
                Tables\Columns\TextColumn::make('metode_pembayaran')
                    ->label('Metode Pembayaran')
                    ->sortable(),
                Tables\Columns\TextColumn::make('tanggal_bayar')
                    ->label('Tanggal Bayar')
                    ->dateTime('d-m-Y H:i')
                    ->sortable(),
            ])
            ->paginated(false);
    }
}
