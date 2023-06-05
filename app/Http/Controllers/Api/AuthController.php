<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterRequest;
use App\Jobs\SendEmail;
use App\Jobs\SendEmailTest;
use App\Mail\Verfikasi;
use App\Models\User;
use App\Traits\ApiResponse;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
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
        $user = User::create($input); 
        // Mail::to($input['email'])->send(new Verfikasi($input['email'], $user->uuid));
        // dispatch(new SendEmail($input['email'],$user->uuid));
        // dispatch(new SendEmail($input['email'],'123'));
        dispatch(new \App\Jobs\SendEmailTest($input['email'],$user->uuid));
        return $this->successResponse("Akun berhasil ditambahkan");
    }

    public function verifikasi($id)
    {
        $user = User::find($id);
        if ($user->verified == 'false') {
            $user->verified = 'true';
            $user->verified_at = Carbon::now();
            $user->update();

            echo "Akun berhasil diverifikasi.. sekarang anda bisa login lewat aplikasi";
        }else{
            echo "Akun sudah diverifikasi..";

        }
    }
}
