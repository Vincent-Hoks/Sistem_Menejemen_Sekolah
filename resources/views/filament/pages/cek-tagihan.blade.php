<x-filament::page>

    <form wire:submit.prevent>
        {{ $this->form }}
    </form>

    <br>

    @if($data)
        <table class="w-full border mt-4">
            <thead>
                <tr>
                    <th class="border p-2">Kelas</th>
                    <th class="border p-2">Biaya</th>
                    <th class="border p-2">Nominal</th>
                </tr>
            </thead>
            <tbody>
                @foreach($data as $item)
                    <tr>
                        <td class="border p-2">{{ $item->nama_kelas }}</td>
                        <td class="border p-2">{{ $item->nama_biaya }}</td>
                        <td class="border p-2">{{ $item->nominal_biaya }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    @else
        <p class="text-gray-500 mt-4">Pilih siswa untuk melihat tagihan</p>
    @endif

</x-filament::page>