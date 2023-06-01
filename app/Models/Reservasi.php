<?php

namespace App\Models;

use App\Traits\UUID;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reservasi extends Model
{
    use HasFactory,UUID;
    protected $table = 'reservasi';
    protected $primaryKey = 'id';
    protected $keyType = 'string';
    protected $guarded = '';
}
