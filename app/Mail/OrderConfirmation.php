<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\DB;
use App\Order;

class OrderConfirmation extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    protected $order;

    public function __construct(Order $order)
    {
        $this->order = $order;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {

        $product['code']     =  $this->order['product_code'];
        $product['price']    =  $this->order['product_price'];
        $product['qty']      =  $this->order['product_qty'];
        $product['title']    =  DB::table('product_languages')
                                ->select('title')
                                ->where('product_id',$this->order['product_id'])
                                ->where('language', 'vi')
                                ->first()->title;
        $product['domain']   =  $this->order['product_size'];
        $product['hosting']  =  $this->order['product_color'];

        return $this->markdown('emails.order-confirmation',[
            'order' =>  $this->order,
            'product' =>  $product,
        ])->subject("Đơn hàng của bạn đã được xác nhận");
    }
}
