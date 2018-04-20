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
        $product_id    = explode(',',$this->order['product_id']);
        $product_code  = explode(',',$this->order['product_code']);
        $product_size  = explode(',',$this->order['product_size']);
        $product_color = explode(',',$this->order['product_color']);
        $product_qty   = explode(',',$this->order['product_qty']);
        $product_price = explode(',',$this->order['product_price']);
        $products = [];
        foreach($product_id as $key => $id){
            $product = DB::table('product_languages')
                ->select('title')
                ->where('product_id',$id)
                ->where('language', 'vi')
                ->first();

            $color = DB::table('attribute_languages')
                        ->select('title')
                        ->where('attribute_id',$product_color[$key])
                        ->where('language','vi')
                        ->first();

            $size = DB::table('attribute_languages')
                        ->select('title')
                        ->where('attribute_id',$product_size[$key])
                        ->where('language','vi')
                        ->first();
            $products[$key]['code']     =  $product_code[$key];
            $products[$key]['price']    =  $product_price[$key];
            $products[$key]['qty']      =  $product_qty[$key];
            $products[$key]['title']    =  @$product->title.(@$color->title ? ' - '.$color->title : '').(@$size->title ? ' - '.$size->title : '');
        }

        return $this->markdown('emails.order-confirmation',[
            'order' =>  $this->order,
            'products' =>  $products,
        ])->subject("Đơn hàng của bạn đã được xác nhận");
    }
}
