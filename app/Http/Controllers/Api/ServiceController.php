<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Service;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;

class ServiceController extends Controller
{
    use ApiResponse;
    public function index($id_kendaraan)
    {
        $service = Service::where('id_kendaraan','=',$id_kendaraan)->get();
        return $this->responseCollection("Data service",$service);
    }
}
