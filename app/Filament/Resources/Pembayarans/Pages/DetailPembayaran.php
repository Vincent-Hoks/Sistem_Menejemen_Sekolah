<?php

namespace App\Filament\Resources\Pembayarans\Pages;

use App\Models\Biaya;
use App\Models\Siswa;
use App\Models\TrxPembayaran;
use App\Models\MetodePembayaran;
use App\Models\SPP;
use App\Models\TrxSPP;

use BackedEnum;
use Filament\Actions\Action;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Placeholder;
use Filament\Notifications\Notification;
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
            $this->createSPPAction(),
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
                    ->live()
                    ->required(),

                Select::make('id_metode_pembayaran')
                    ->label('Metode Pembayaran')
                    ->options(MetodePembayaran::pluck('metode_pembayaran', 'id_metode_pembayaran'))
                    ->required(),

                TextInput::make('nominal_bayar')
                    ->label('Nominal Bayar')
                    ->numeric()
                    ->required(),

                Placeholder::make('tunggakan')
                    ->label('Tunggakan')
                    ->content(fn ($get) => $this->calculateTunggakan($get('id_biaya'))),
            ])
            ->action(fn (array $data) => $this->savePembayaran($data))
            ->modalSubmitActionLabel('Tambah')
            ->modalCancelActionLabel('Batalkan');
    }

    // 🔥 LOGIC BIAYA SESUAI KELAS (EXCLUDE BIAYA YANG LUNAS)
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

        $biayaList = Biaya::whereIn('id_tingkat_kelas', $kelasIds)
            ->orderBy('jenis_biaya', 'ASC')
            ->get();

        $options = [];

        foreach ($biayaList as $biaya) {
            // Hitung nominalTerbayar untuk biaya ini
            $nominalTerbayar = TrxPembayaran::where('id_siswa', $this->siswa->id_siswa)
                ->where('id_biaya', $biaya->id_biaya)
                ->sum('nominal');

            // Hitung tunggakan
            $tunggakan = max($biaya->nominal - $nominalTerbayar, 0);

            // Hanya include biaya yang belum lunas (tunggakan > 0)
            if ($tunggakan > 0) {
                $options[$biaya->id_biaya] = $biaya->jenis_biaya;
            }
        }

        return $options;
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

    // 🔥 HITUNG TUNGGAKAN (RETURN NUMERIC VALUE)
    public function calculateTunggakanValue($idBiaya)
    {
        if (!$idBiaya) {
            return 0;
        }

        $biaya = Biaya::find($idBiaya);

        if (!$biaya) {
            return 0;
        }

        $nominalTerbayar = TrxPembayaran::where('id_siswa', $this->siswa->id_siswa)
            ->where('id_biaya', $idBiaya)
            ->sum('nominal');

        $tunggakan = max($biaya->nominal - $nominalTerbayar, 0);

        return (float) $tunggakan;
    }

    // 🔥 SAVE KE DATABASE (INI YANG PENTING)
    public function savePembayaran(array $data): void
    {
        // Validasi nominal tidak melebihi tunggakan
        $tunggakan = $this->calculateTunggakanValue($data['id_biaya']);
        
        if ($data['nominal_bayar'] > $tunggakan) {
            Notification::make()
                ->title('Validasi Gagal!')
                ->body('Nominal pembayaran tidak boleh melebihi tunggakan. Tunggakan: Rp ' . number_format($tunggakan, 0, ',', '.'))
                ->danger()
                ->send();
            return;
        }

        $trx = TrxPembayaran::create([
            'id_biaya' => $data['id_biaya'],
            'id_siswa' => $this->siswa->id_siswa,
            'id_metode_pembayaran' => $data['id_metode_pembayaran'],
            'nominal' => $data['nominal_bayar'],
            'tanggal_bayar' => Carbon::now()->format('Y-m-d'),
        ]);

        Notification::make()
            ->title('Pembayaran Berhasil!')
            ->body('Data pembayaran telah tersimpan. Invoice sedang diunduh...')
            ->success()
            ->send();

        // Redirect ke download invoice PDF
        $this->redirect(route('invoice.pembayaran', ['idTrxPembayaran' => $trx->id_trx_pembayaran]));
    }

    //  TOMBOL PEMBAYARAN SPP
    protected function createSPPAction(): Action
    {
        return Action::make('pembayaran_spp')
            ->label('Pembayaran SPP')
            ->color('warning')
            ->icon('heroicon-o-plus')
            ->form([
                Select::make('id_spp')
                    ->label('Keterangan SPP')
                    ->options(fn () => $this->getSPPOptions())
                    ->searchable()
                    ->preload()
                    ->live()
                    ->required(),

                Select::make('id_metode_pembayaran')
                    ->label('Metode Pembayaran')
                    ->options(MetodePembayaran::pluck('metode_pembayaran', 'id_metode_pembayaran'))
                    ->required(),

                TextInput::make('nominal_bayar')
                    ->label('Nominal Bayar')
                    ->numeric()
                    ->required(),
            ])
            ->action(fn (array $data) => $this->saveSPP($data))
            ->modalSubmitActionLabel('Tambah')
            ->modalCancelActionLabel('Batalkan');
    }

    // LOGIC SPP SESUAI KELAS DAN JURUSAN
    public function getSPPOptions()
    {
        $kelasIds = [];

        if ($this->siswa->id_tingkat_kelas == 1) {
            $kelasIds = [1];
        } elseif ($this->siswa->id_tingkat_kelas == 2) {
            $kelasIds = [1, 2];
        } elseif ($this->siswa->id_tingkat_kelas == 3) {
            $kelasIds = [1, 2, 3];
        }

        return SPP::whereIn('id_tingkat_kelas', $kelasIds)
            ->where('id_jurusan', $this->siswa->id_jurusan)
            ->get()
            ->mapWithKeys(function (SPP $spp) {
                $namaKelas = $this->getNamaKelas($spp->id_tingkat_kelas);
                $namaJurusan = $spp->jurusan?->jurusan ?? '-';
                $keterangan = "{$namaKelas}-{$namaJurusan}";
                return [$spp->id_spp => $keterangan];
            })
            ->toArray();
    }

    // HELPER NAMA KELAS
    private function getNamaKelas(int $idTingkatKelas): string
    {
        return match ($idTingkatKelas) {
            1 => 'X',
            2 => 'XI',
            3 => 'XII',
            default => '-'
        };
    }

    // SAVE TRANSAKSI SPP
    public function saveSPP(array $data): void
    {
        // Validasi jika sudah lunas bulan ke 12
        $spp = SPP::find($data['id_spp']);
        if (!$spp) {
            Notification::make()
                ->title('Validasi Gagal!')
                ->body('SPP tidak ditemukan.')
                ->danger()
                ->send();
            return;
        }

        // Hitung nominal terbayar saat ini
        $nominalTerbayarSaat = $this->getNominalTerbayarSPP($data['id_spp']);
        
        // Hitung nominal terbayar setelah transaksi baru
        $nominalTerbayarSetelah = $nominalTerbayarSaat + $data['nominal_bayar'];
        
        // Hitung bulan ke setelah transaksi
        $bulanKeSetelah = (int) floor($nominalTerbayarSetelah / $spp->spp);

        // Jika melebihi bulan ke 12, berikan warning
        if ($bulanKeSetelah > 12) {
            Notification::make()
                ->title('Peringatan!')
                ->body("Pembayaran ini akan melebihi bulan ke 12. Total akan menjadi bulan ke {$bulanKeSetelah}. Pastikan nominal benar sebelum melanjutkan.")
                ->warning()
                ->send();
            return;
        }

        $trx = TrxSPP::create([
            'id_spp' => $data['id_spp'],
            'id_siswa' => $this->siswa->id_siswa,
            'id_metode_pembayaran' => $data['id_metode_pembayaran'],
            'nominal_bayar' => $data['nominal_bayar'],
        ]);

        Notification::make()
            ->title('Pembayaran SPP Berhasil!')
            ->body('Data pembayaran SPP telah tersimpan. Invoice sedang diunduh...')
            ->success()
            ->send();

        // Redirect ke download invoice PDF
        $this->redirect(route('invoice.spp', ['idTrxSPP' => $trx->id_trx_spp]));
    }

    // HELPER: Hitung nominal terbayar SPP
    private function getNominalTerbayarSPP(int $idSPP): int
    {
        return TrxSPP::where('id_siswa', $this->siswa->id_siswa)
            ->where('id_spp', $idSPP)
            ->sum('nominal_bayar');
    }

    // SHOW DETAIL PEMBAYARAN BERDASARKAN KELAS
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