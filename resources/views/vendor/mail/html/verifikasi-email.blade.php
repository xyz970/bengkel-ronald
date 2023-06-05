@component('mail::message')
# Verifikasi email

Halo {{$email}},<br>
Verifikasi email anda sekarang.. <br>
Link dibawah ini akan expired dalam satu jam kedepan


@component('mail::button', ['url' => route('verifikasi.email',['id'=>$id])])
Verifikasi
@endcomponent

Thanks,<br>
Bengkel Ronald
<br>
Jika tombol tidak bisa di klik maka copy link dibawah ini ke kolom pencarian browser anda
{{ route('verifikasi.email',['id'=>$id]) }}
@endcomponent