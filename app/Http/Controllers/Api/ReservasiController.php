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
        $reservasi = Reservasi::where('user_id','=',$input['user_id'])->where('status','=','pending')->count();
        if ($reservasi != 3) {
            Reservasi::create($input);
            return $this->successResponse("Reservasi berhasil didata");
        }else{
            return $this->internalErrorResponse("Reservasi hanya dibatasi 3 kali untuk setiap user",422);

        }
    }
}
