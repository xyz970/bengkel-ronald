<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class InsertKendaraanRequest extends FormRequest
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
            'merk'=>'required',
            'tipe_mobil'=>'required',
            'nomor_rangka'=>'required',
            'user_id'=>'required',
            'model'=>'required',
            'tahun_produksi'=>'required',
            'warna'=>'required',
            'nopol'=>'required',
            'nomor_stnk'=>'required',
            'masa_stnk'=>'required|date'
        ];
    }
}
