<?php

namespace App\Traits;

use Illuminate\Support\Collection;

trait PrintKodeSurat {
    public function TA(Collection $surat, Collection $anggota)
    {
        return view('template-surat.'.$surat->kode_surat,compact('surat','anggota'));
    }
}