<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Notifications\Notifiable;
use Illuminate\Queue\SerializesModels;

class Verfikasi extends Mailable
{
    use Queueable, SerializesModels,Notifiable;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public $email;
    public $id;
    public function __construct($email,$id)
    {
        $this->id = $id;
        $this->email = $email;
    }

     /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from('bengkel-ronald@noreply','Bengkel Ronald')
                    ->to($this->email)
                    ->subject('Verifikasi Email')
                    ->markdown('verifikasi-email')
                    ->with([
                        'id'=>$this->id,
                        'email'=> $this->email
                    ]);
    }

    /**
     * Get the attachments for the message.
     *
     * @return array
     */
    public function attachments()
    {
        return [];
    }
}
