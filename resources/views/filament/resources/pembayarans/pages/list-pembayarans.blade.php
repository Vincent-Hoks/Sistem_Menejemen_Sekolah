<x-filament::page>
    <div class="grid gap-6">
        <x-filament::card>
            <div class="space-y-4">
                <div>
                    <x-filament::label for="selectedSiswa">Pilih Siswa</x-filament::label>
                    <select wire:model="selectedSiswa" id="selectedSiswa" class="block w-full rounded-lg border-gray-300 shadow-sm focus:border-primary-500 focus:ring-primary-500 sm:text-sm">
                        <option value="">Pilih siswa...</option>
                        @foreach ($this->getSiswaOptions() as $id => $label)
                            <option value="{{ $id }}">{{ $label }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
        </x-filament::card>

        @if ($selectedSiswa)
            <x-filament::card>
                <div class="flex items-center justify-between gap-4">
                    <div>
                        <h2 class="text-lg font-semibold">Daftar Biaya untuk Kelas: {{ $this->selectedKelasName ?? '-' }}</h2>
                        <p class="text-sm text-gray-500">Data biaya diambil dari kelas siswa yang dipilih.</p>
                    </div>
                </div>

                @if ($this->biayaRows->isEmpty())
                    <div class="mt-4 text-sm text-gray-600">Tidak ada data biaya untuk siswa terpilih.</div>
                @else
                    <div class="mt-4 overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200 text-sm">
                            <thead class="bg-gray-50 text-left text-xs uppercase tracking-wider text-gray-600">
                                <tr>
                                    <th class="px-4 py-3">Kelas</th>
                                    <th class="px-4 py-3">Jenis Biaya</th>
                                    <th class="px-4 py-3">Nominal</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-200 bg-white">
                                @foreach ($this->biayaRows as $row)
                                    <tr>
                                        <td class="px-4 py-3">{{ $row->nama_kelas }}</td>
                                        <td class="px-4 py-3">{{ $row->nama_biaya }}</td>
                                        <td class="px-4 py-3">{{ number_format($row->nominal, 0, ',', '.') }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                @endif
            </x-filament::card>
        @endif
    </div>
</x-filament::page>
