<x-filament::page>

    <div class="mb-6">
        <h2 class="text-xl font-bold">
            {{ $this->siswa->nama_siswa }}
        </h2>

        <p>
            Kelas: {{ match($this->siswa->id_tingkat_kelas) {
                1 => 'X',
                2 => 'XI',
                3 => 'XII',
                default => '-'
            } }}
        </p>

        <p>
            Jurusan: {{ $this->siswa->jurusan->jurusan ?? '-' }}
        </p>
    </div>

    @livewire(\App\Filament\Widgets\DetailKelas10Widget::class)
    @livewire(\App\Filament\Widgets\DetailKelas11Widget::class)
    @livewire(\App\Filament\Widgets\DetailKelas12Widget::class)

</x-filament::page>