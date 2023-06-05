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

    protected $hidden = [
        'created_at',
        'updated_at',
    ];

    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }
    public function reservasi()
    {
        return $this->hasOne(Reservasi::class);
    }

    public function service()
    {
        return $this->hasOne(Service::class);
    }

}
