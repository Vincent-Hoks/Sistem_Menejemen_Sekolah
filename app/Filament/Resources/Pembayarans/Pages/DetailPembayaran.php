<?php

namespace App\Filament\Resources\Pembayarans\Pages;
use App\Models\Siswa;
use BackedEnum;
use Filament\Resources\Pages\Page;
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

    public function getBreadcrumb(): ?string
    {
        return 'Detail Pembayaran';
    }
}
