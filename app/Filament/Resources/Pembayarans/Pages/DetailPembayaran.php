<?php

namespace App\Filament\Resources\Pembayarans\Pages;

use App\Models\Biaya;
use App\Models\Siswa;
use App\Models\TrxPembayaran;
use App\Models\MetodePembayaran;

use BackedEnum;
use Filament\Actions\Action;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Placeholder;
use Filament\Resources\Pages\Page;

use Illuminate\Support\Carbon;

use App\Filament\Resources\Pembayarans\PembayaranResource;

class DetailPembayaran extends Page
{
    protected static string $resource = PembayaranResource::class;
    protected static bool $shouldRegisterNavigation = false;

    protected static string | BackedEnum | null $navigationIcon = null;

    protected string $view = 'filament.pages.detail-pembayaran';

    public ?Siswa $record = null;
    public ?Siswa $siswa = null;

    public function mount(Siswa $record): void
    {
        $this->record = $record;
        $this->siswa = $record;
    }

    public function getTitle(): string
    {
        return 'Detail Pembayaran';
    }
        // Kode Tombol Pembayaran
    protected function getHeaderActions(): array
    {
        
        return [
            $this->createPembayaranAction(),
        ];
    }

    protected function createPembayaranAction(): Action
    {
        return Action::make('pembayaran')
            ->label('Pembayaran')
            ->color('primary')
            ->icon('heroicon-o-plus')
            ->form([

                Select::make('id_biaya')
                    ->label('Jenis Biaya')
                    ->options(fn () => $this->getBiayaOptions())
                    ->searchable()
                    ->preload()
                    ->live()
                    ->required(),

                Select::make('id_metode_pembayaran')
                    ->label('Metode Pembayaran')
                    ->options(
                        MetodePembayaran::pluck('metode_pembayaran', 'id_metode_pembayaran')
                    )
                    ->required(),

                TextInput::make('nominal_bayar')
                    ->label('Nominal Bayar')
                    ->numeric()
                    ->required(),

                Placeholder::make('tunggakan')
                    ->label('Tunggakan')
                    ->content(fn ($get) => $this->calculateTunggakan($get('id_biaya'))),
            ])
            ->action(fn (array $data) => $this->savePembayaran($data));
    }

    // 🔥 LOGIC BIAYA SESUAI KELAS
    public function getBiayaOptions()
    {
        $kelasIds = [];

        if ($this->siswa->id_tingkat_kelas == 1) {
            $kelasIds = [1];
        } elseif ($this->siswa->id_tingkat_kelas == 2) {
            $kelasIds = [1, 2];
        } elseif ($this->siswa->id_tingkat_kelas == 3) {
            $kelasIds = [1, 2, 3];
        }

        return Biaya::whereIn('id_tingkat_kelas', $kelasIds)
            ->orderBy('jenis_biaya', 'ASC')
            ->pluck('jenis_biaya', 'id_biaya')
            ->toArray();
    }

    // 🔥 HITUNG TUNGGAKAN
    public function calculateTunggakan($idBiaya)
    {
        if (!$idBiaya) {
            return '-';
        }

        $biaya = Biaya::find($idBiaya);

        if (!$biaya) {
            return '-';
        }

        $nominalTerbayar = TrxPembayaran::where('id_siswa', $this->siswa->id_siswa)
            ->where('id_biaya', $idBiaya)
            ->sum('nominal');

        $tunggakan = max($biaya->nominal - $nominalTerbayar, 0);

        return $tunggakan == 0
            ? 'Lunas'
            : 'Rp ' . number_format($tunggakan, 0, ',', '.');
    }

    // 🔥 SAVE KE DATABASE (INI YANG PENTING)
    public function savePembayaran(array $data): void
    {
        TrxPembayaran::create([
            'id_biaya' => $data['id_biaya'],
            'id_siswa' => $this->siswa->id_siswa,
            'id_metode_pembayaran' => $data['id_metode_pembayaran'],
            'nominal' => $data['nominal_bayar'],
            'tanggal_bayar' => Carbon::now()->format('Y-m-d'),
        ]);

        // refresh halaman
        $this->redirect(request()->header('Referer'));
    }

    // 🔥 SHOW DETAIL PEMBAYARAN BERDASARKAN KELAS
    public function shouldShowKelas10(): bool
    {
        // Tampil untuk kelas 10, 11, dan 12
        return $this->siswa && in_array($this->siswa->id_tingkat_kelas, [1, 2, 3]);
    }

    public function shouldShowKelas11(): bool
    {
        // Tampil untuk kelas 11 dan 12
        return $this->siswa && in_array($this->siswa->id_tingkat_kelas, [2, 3]);
    }

    public function shouldShowKelas12(): bool
    {
        // Tampil hanya untuk kelas 12
        return $this->siswa && $this->siswa->id_tingkat_kelas == 3;
    }
}