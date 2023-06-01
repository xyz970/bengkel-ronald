<?php

namespace App\Models;

use App\Traits\UUID;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kendaraan extends Model
{
    use HasFactory,UUID;

    protected $table = 'kendaraan';
    protected $primaryKey = 'uuid';
    protected $keyType = 'string';
    protected $guarded = '';

    public function tipe_mobil()
    {
        return $this->hasOne(TipeMobil::class,'tipe_id');
    }
}
