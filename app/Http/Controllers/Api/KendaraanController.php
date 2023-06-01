<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\InsertKendaraanRequest;
use App\Models\Kendaraan;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;

class KendaraanController extends Controller
{
    use ApiResponse;
    public function insert(InsertKendaraanRequest $request)
    {
        $input = $request->validated();
        Kendaraan::create($input);
        return $this->successResponse("Data kendaraan berhasil didata");
    }
    
}
