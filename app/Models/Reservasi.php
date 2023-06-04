<?php

namespace App\Models;

use App\Traits\UUID;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reservasi extends Model
{
    use HasFactory,UUID;
    protected $table = 'reservasi';
    protected $primaryKey = 'id';
    protected $keyType = 'string';
    protected $guarded = '';

    protected $hidden = [
        'created_at',
        'kendaraan_id',
        'user_id',
        'updated_at',
    ];

    public function kendaraan()
    {
        return $this->belongsTo(Kendaraan::class,'kendaraan_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }
    
    protected function tanggal(): Attribute
    {
        return Attribute::make(
            #get: fn ($value) => ucfirst($value), 
            get: fn ($value) => Carbon::createFromFormat('Y-m-d',  $value)->translatedFormat('d F Y'),
        );
    }
}
