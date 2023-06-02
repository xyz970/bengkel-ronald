<?php

namespace App\Models;

use App\Traits\UUID;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory, UUID;
    protected $table = 'service';
    protected $primaryKey = 'uuid';
    protected $keyType = 'string';
    protected $guarded = '';

    protected function tanggal(): Attribute
    {
        return Attribute::make(
            #get: fn ($value) => ucfirst($value), 
            get: fn ($value) => Carbon::createFromFormat('Y-m-d',  $value)->translatedFormat('d F Y'),
        );
    }
}
