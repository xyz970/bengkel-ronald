<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TipeMobil extends Model
{
    use HasFactory;
    protected $table = 'tipe_mobil';
    protected $primaryKey = 'id';
    protected $keyType = 'string';

    public function kendaraan()
    {
        return $this->belongsTo(Kendaraan::class);
    }
}
