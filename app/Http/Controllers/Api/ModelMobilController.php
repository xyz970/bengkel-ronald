<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ModelMobil;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;

class ModelMobilController extends Controller
{
    use ApiResponse;
    public function index()
    {
        $modelMobil = ModelMobil::all();
        return $this->responseCollection("Data Model Mobil",$modelMobil);
    }
}
