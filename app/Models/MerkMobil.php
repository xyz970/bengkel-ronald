<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MerkMobil extends Model
{
    use HasFactory;
    protected $table = 'merk';
    protected $guarded = '';
    public $timestamps = false;
}
