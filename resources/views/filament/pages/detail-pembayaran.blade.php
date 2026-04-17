<x-filament::page>

    @livewire(\App\Filament\Widgets\DetailSiswaWidget::class, ['siswa' => $this->siswa])

    @if($this->shouldShowKelas10())
        @livewire(\App\Filament\Widgets\DetailKelas10Widget::class, ['siswa' => $this->siswa])
    @endif

    @if($this->shouldShowKelas11())
        @livewire(\App\Filament\Widgets\DetailKelas11Widget::class, ['siswa' => $this->siswa])
    @endif

    @if($this->shouldShowKelas12())
        @livewire(\App\Filament\Widgets\DetailKelas12Widget::class, ['siswa' => $this->siswa])
    @endif

    @livewire(\App\Filament\Widgets\DetailSPPWidget::class, ['siswa' => $this->siswa])

</x-filament::page>