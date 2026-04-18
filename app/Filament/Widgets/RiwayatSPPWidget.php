<?php

namespace App\Filament\Widgets;

use App\Models\TrxSPP;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget as BaseWidget;

class RiwayatSPPWidget extends BaseWidget
{
    protected static ?string $heading = 'Riwayat Pembayaran SPP';
    protected int | string | array $columnSpan = 'full';

    public function table(Table $table): Table
    {
        return $table
            ->query(
                TrxSPP::query()
                    ->selectRaw('
                        m_siswa.nama_siswa,
                        m_spp.keterangan_spp,
                        m_metode_pembayaran.metode_pembayaran,
                        trx_spp.created_at
                    ')
                    ->join('m_siswa', 'm_siswa.id_siswa', '=', 'trx_spp.id_siswa')
                    ->join('m_metode_pembayaran', 'm_metode_pembayaran.id_metode_pembayaran', '=', 'trx_spp.id_metode_pembayaran')
                    ->join('m_spp', 'm_spp.id_spp', '=', 'trx_spp.id_spp')
                    ->latest('trx_spp.created_at')
                    ->limit(2)
            )
            ->columns([
                Tables\Columns\TextColumn::make('nama_siswa')
                    ->label('Nama Siswa')
                    ->sortable(),
                Tables\Columns\TextColumn::make('keterangan_spp')
                    ->label('Keterangan SPP')
                    ->sortable(),
                Tables\Columns\TextColumn::make('metode_pembayaran')
                    ->label('Metode Pembayaran')
                    ->sortable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Tanggal')
                    ->dateTime('d-m-Y H:i')
                    ->sortable(),
            ])
            ->paginated(false);
    }
}
