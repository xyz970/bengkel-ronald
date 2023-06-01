<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class InsertReservasiRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'kendaraan_id'=>'required',
            'detail_service'=>'required',
            'tanggal'=>'required|date',
            'jam'=>'required',
            'keluhan'=>'required',
        ];
    }
}
