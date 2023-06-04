<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\InsertKendaraanRequest;
use App\Models\Kendaraan;
use App\Models\MerkMobil;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class KendaraanController extends Controller
{
    use ApiResponse;
    public function insert(InsertKendaraanRequest $request)
    {
        $input = $request->validated();
        Kendaraan::create($input);
        return $this->successResponse("Data kendaraan berhasil didata");
    }

    public function index()
    {
        $auth = Auth::user();
        $kendaraan = Kendaraan::where('user_id','=',$auth->uuid)->get();
        return $this->responseCollection("Data kendaraan",$kendaraan);
    }

    public function edit($no_rangka)
    {
        $kendaraan = Kendaraan::where('nomor_rangka','=',$no_rangka)->first();
        if ($kendaraan == '') {
            return $this->internalErrorResponse("Data tidak ditemukan",404);
        } else {
            return $this->successResponseData("Detail",$kendaraan);
        }
    }

    public function merk_mobil()
    {
        $merk = MerkMobil::all();
        return $this->responseCollection("Data Merk",$merk);
    }
    
}
