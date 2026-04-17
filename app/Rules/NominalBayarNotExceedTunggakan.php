<?php

namespace App\Rules;

use Closure;
use App\Models\Biaya;
use App\Models\TrxPembayaran;
use Illuminate\Contracts\Validation\ValidationRule;

class NominalBayarNotExceedTunggakan implements ValidationRule
{
    protected $siswaId;
    protected $biayaId;

    public function __construct($siswaId, $biayaId)
    {
        $this->siswaId = $siswaId;
        $this->biayaId = $biayaId;
    }

    public function validate(string $attribute, mixed $value, Closure $fail): void
    {
        if (!$this->biayaId) {
            return;
        }

        $biaya = Biaya::find($this->biayaId);

        if (!$biaya) {
            $fail('Biaya tidak ditemukan.');
            return;
        }

        $nominalTerbayar = TrxPembayaran::where('id_siswa', $this->siswaId)
            ->where('id_biaya', $this->biayaId)
            ->sum('nominal');

        $tunggakan = max($biaya->nominal - $nominalTerbayar, 0);

        if ($value > $tunggakan) {
            $fail('Nominal pembayaran tidak boleh melebihi tunggakan. Tunggakan: Rp ' . number_format($tunggakan, 0, ',', '.'));
        }
    }
}
