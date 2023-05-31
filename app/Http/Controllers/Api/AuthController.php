<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterRequest;
use App\Models\User;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Facades\JWTAuth;

class AuthController extends Controller
{
    use ApiResponse;
    public function login(LoginRequest $request)
    {
        $input = $request->validated();
        try {
            if (!$token = JWTAuth::attempt($input)) return $this->internalErrorResponse("Cek kembali password atau email anda",);
        } catch (JWTException $e) {
            return $this->internalErrorResponse("Ada yang salah :(");
        }

        //Token created, return with success response and jwt token
        $data = array(
            'user' => Auth::user(),
            'success' => true,
            'token' => $token,
        );
        return $this->successResponseData("Berhasil Login", $data);
    }

    public function register(RegisterRequest $request)
    {
        $input = $request->validated();
        User::create($input);
        return $this->successResponse("Akun berhasil ditambahkan");

    }
}
