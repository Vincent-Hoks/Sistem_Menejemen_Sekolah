<?php

namespace App\Filament\Resources\Pembayarans;

use App\Filament\Resources\Pembayarans\Pages\DetailPembayaran;
use App\Filament\Resources\Pembayarans\Pages\ListPembayarans;
use App\Filament\Resources\Pembayarans\Tables\PembayaransTable;
use App\Models\Siswa;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;
use BackedEnum;
use UnitEnum;

class PembayaranResource extends Resource
{
    protected static ?string $model = Siswa::class;

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-banknotes';

    protected static ?string $pluralLabel = 'Pembayaran';

    protected static string | UnitEnum | null $navigationGroup = 'Transaksi';

    protected static ?string $recordTitleAttribute = 'nama_siswa';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->schema([
                // Form fields can be added here if needed
            ]);
    }

    public static function table(Table $table): Table
    {
        return PembayaransTable::configure($table)
            ->recordUrl(
                fn (Siswa $record): string => static::getUrl('detail', ['record' => $record->id_siswa])
            );
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => ListPembayarans::route('/'),
            'detail' => DetailPembayaran::route('/{record}/detail'),
        ];
    }
}
