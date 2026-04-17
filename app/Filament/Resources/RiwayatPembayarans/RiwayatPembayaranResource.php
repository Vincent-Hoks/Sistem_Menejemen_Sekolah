<?php

namespace App\Filament\Resources\RiwayatPembayarans;

use App\Filament\Resources\RiwayatPembayarans\Pages\CreateRiwayatPembayaran;
use App\Filament\Resources\RiwayatPembayarans\Pages\EditRiwayatPembayaran;
use App\Filament\Resources\RiwayatPembayarans\Pages\ListRiwayatPembayarans;
use App\Filament\Resources\RiwayatPembayarans\Pages\ViewRiwayatPembayaran;
// use App\Filament\Resources\RiwayatPembayarans\Tables\RiwayatPembayaransTable;
use App\Models\RiwayatPembayaran;
use BackedEnum;
use Filament\Resources\Resource;
// use Filament\Tables\Table;
use Filament\Support\Icons\Heroicon;
// use Illuminate\Database\Eloquent\Builder;
// use Illuminate\Support\Facades\DB;

class RiwayatPembayaranResource extends Resource
{
    protected static ?string $navigationLabel = 'Riwayat Pembayaran';
    protected static ?string $model = RiwayatPembayaran::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    // public static function table(Table $table): Table
    // {
    //     return RiwayatPembayaransTable::configure($table);
    // }

    // 🔥 QUERY SISWA LUNAS (FINAL)
// public static function getEloquentQuery(): Builder
// {
//     $sub = DB::table('trx_pembayaran') // SESUAIKAN NAMA TABEL
//         ->select(
//             'id_siswa',
//             'id_tagihan',
//             DB::raw('SUM(nominal) as total_bayar')
//         )
//         ->groupBy('id_siswa', 'id_tagihan');

//     return parent::getEloquentQuery()
//         ->joinSub($sub, 'p', function ($join) {
//             $join->on('trx_pembayaran.id_siswa', '=', 'p.id_siswa')
//                  ->on('trx_pembayaran.id_tagihan', '=', 'p.id_tagihan');
//         })
//         ->join('t_tagihan', 'p.id_tagihan', '=', 't_tagihan.id_tagihan')
//         ->whereColumn('p.total_bayar', '>=', 't_tagihan.jumlah_tagihan')
//         ->select('pembayaran.*');
// }

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index' => ListRiwayatPembayarans::route('/'),
            'create' => CreateRiwayatPembayaran::route('/create'),
            'view' => ViewRiwayatPembayaran::route('/{record}'),
            'edit' => EditRiwayatPembayaran::route('/{record}/edit'),
        ];
    }

    // 🔒 READ ONLY
    public static function canCreate(): bool { return false; }
    public static function canEdit($record): bool { return false; }
    public static function canDelete($record): bool { return false; }
}