<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\InsertReservasiRequest;
use App\Models\Reservasi;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;

class ReservasiController extends Controller
{
    use ApiResponse;
    public function insert(InsertReservasiRequest $request)
    {
        $input = $request->validated();
        Reservasi::create($input);
        return $this->successResponse("Reservasi berhasil didata");
    }
}
