<?php

namespace App\Filament\Widgets;

use App\Models\Siswa;
use App\Models\SPP;
use App\Models\TrxSPP;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget as BaseWidget;
use Illuminate\Database\Eloquent\Builder;

class DetailSPPWidget extends BaseWidget
{
    protected static ?string $heading = 'Detail SPP';

    protected static ?int $sort = 6;

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
        $kelasIds = $this->getKelasIds();

        return $table
            ->query(function () use ($siswa, $kelasIds) {
                return SPP::whereIn('id_tingkat_kelas', $kelasIds)
                    ->where('id_jurusan', $siswa?->id_jurusan ?? 0);
            })
            ->columns([
                TextColumn::make('keterangan_spp')
                    ->label('Keterangan SPP')
                    ->formatStateUsing(function (SPP $record) {
                        return $this->getKeteranganSPPLengkap($record);
                    })
                    ->sortable(),
                TextColumn::make('spp')
                    ->label('SPP')
                    ->money('idr', locale: 'id')
                    ->sortable(),
                TextColumn::make('nominal_terbayar')
                    ->label('Terbayar')
                    ->money('idr', locale: 'id')
                    ->state(function (SPP $record) {
                        return $this->getNominalTerbayar($record->id_spp);
                    }),
                TextColumn::make('keterangan_status')
                    ->label('Keterangan')
                    ->state(function (SPP $record) {
                        return $this->getKeteranganStatus($record->id_spp, $record->spp);
                    })
                    ->sortable(),
                TextColumn::make('lebih_bayar')
                    ->label('Lebih Bayar')
                    ->money('idr', locale: 'id')
                    ->state(function (SPP $record) {
                        $nominalTerbayar = $this->getNominalTerbayar($record->id_spp);
                        // Gunakan modulus untuk menghitung lebih bayar
                        $lebih = $nominalTerbayar % $record->spp;
                        return $lebih;
                    }),
            ])
            ->paginationPageOptions([5, 10, 25, 50])
            ->defaultPaginationPageOption(10)
            ->striped();
    }

    /**
     * Ambil kelas IDs berdasarkan tingkat kelas siswa
     */
    private function getKelasIds(): array
    {
        if (!$this->siswa) {
            return [];
        }

        return match ($this->siswa->id_tingkat_kelas) {
            1 => [1], // Kelas 10 - hanya kelas 10
            2 => [1, 2], // Kelas 11 - kelas 10 dan 11
            3 => [1, 2, 3], // Kelas 12 - kelas 10, 11, dan 12
            default => []
        };
    }

    /**
     * Ambil nama kelas dari id tingkat kelas
     */
    private function getNamaKelas(int $idTingkatKelas): string
    {
        return match ($idTingkatKelas) {
            1 => 'X',
            2 => 'XI',
            3 => 'XII',
            default => '-'
        };
    }

    /**
     * Ambil keterangan SPP lengkap dengan nama kelas dan jurusan
     * Contoh: X-RPL, XI-AKL, XII-BDP
     */
    private function getKeteranganSPPLengkap(SPP $spp): string
    {
        $namaKelas = $this->getNamaKelas($spp->id_tingkat_kelas);
        $namaJurusan = $spp->jurusan?->jurusan ?? '-';
        
        return "{$namaKelas}-{$namaJurusan}";
    }

    /**
     * Hitung nominal terbayar untuk SPP tertentu
     */
    private function getNominalTerbayar(int $idSPP): int
    {
        return TrxSPP::where('id_siswa', $this->siswa?->id_siswa ?? 0)
            ->where('id_spp', $idSPP)
            ->sum('nominal_bayar');
    }

    /**
     * Ambil keterangan status pembayaran SPP
     * Logic: bulan ke = floor(nominal_terbayar / spp)
     * Contoh: 150/300 = 0 bulan, 300/300 = 1 bulan, 600/300 = 2 bulan
     */
    private function getKeteranganStatus(int $idSPP, int $nominalSPP): string
    {
        if ($nominalSPP <= 0) {
            return 'Nominal SPP tidak valid';
        }

        $nominalTerbayar = $this->getNominalTerbayar($idSPP);

        if ($nominalTerbayar <= 0) {
            return 'Belum bayar';
        }

        // Hitung bulan ke berapa (gunakan floor - pembulatan ke bawah)
        $bulanKe = (int) floor($nominalTerbayar / $nominalSPP);
        
        return "Lunas bulan ke {$bulanKe}";
    }
}
