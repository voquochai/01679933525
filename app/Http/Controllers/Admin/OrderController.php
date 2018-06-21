<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use App\Order;
use App\OrderDetail;

use DateTime;

class OrderController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    private $_data;

    public function __construct(Request $request)
    {
        $this->_data['type'] = (isset($request->type) && $request->type !='') ? $request->type : 'default';
        $this->_data['siteconfig'] = config('siteconfig.order');
        $this->_data['default_language'] = config('siteconfig.general.language');
        $this->_data['languages'] = config('siteconfig.languages');
        $this->_data['pageTitle'] = $this->_data['siteconfig'][$this->_data['type']]['page-title'];
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function index(){

        $this->_data['items'] = DB::table('orders as A')
            ->where('A.type',$this->_data['type'])
            ->orderBy('A.priority','asc')
            ->orderBy('A.id','desc')
            ->paginate(25);

        $this->_data['total'] = DB::table('orders')
            ->select(DB::raw('sum(order_qty) as qty, sum(order_price) as price'))
            ->where('status_id', '<' , 4)
            ->where('type',$this->_data['type'])->first();

        return view('admin.orders.index',$this->_data);
    }
    
    public function create(){
        return view('admin.orders.create',$this->_data);
    }

    public function store(Request $request){
        $valid = Validator::make($request->all(), [
            'products'          => 'required',
            ], [
            'products.required' => 'Vui lòng chọn sản phẩm',
        ]);
        if ($valid->fails()) {
            return redirect()->back()->withErrors($valid)->withInput();
        } else {
            $order  = new Order;

            if($request->data){
                foreach($request->data as $field => $value){
                    $order->$field = $value;
                }
            }

            $inputProduct = $request->products;
            $products = [];
            $product  = [];
            $sumPrice = 0;
            $sumQty   = 0;
            $dataInsert = [];
            foreach($inputProduct as $key => $value){
                $id    = (int)$value['id'];
                $color = (int)@$value['color_id'];
                $size  = (int)@$value['size_id'];
                if( !isset($products[$id][$color][$size]) ){
                    $products[$id][$color][$size]['title']  =  $value['title'];
                    $products[$id][$color][$size]['code']  =  strtoupper($value['code']);
                    $products[$id][$color][$size]['price'] =  $value['price'];
                    @$products[$id][$color][$size]['qty']  +=  $value['qty'];
                    @$products[$id][$color][$size]['color_title']  =  $value['color_title'];
                    @$products[$id][$color][$size]['size_title']  =  $value['size_title'];
                }else{
                    unset($inputProduct[$key]);
                }
            }
            array_values($inputProduct);
            foreach($inputProduct as $key => $value){
                $id    = (int)$value['id'];
                $color = (int)@$value['color_id'];
                $size  = (int)@$value['size_id'];
                if( isset($products[$id][$color][$size]) ){
                    $product['product_id']    =   $id;
                    $product['product_code']  =   $products[$id][$color][$size]['code'];
                    $product['product_title'] =   $products[$id][$color][$size]['title'];
                    $product['product_qty']   =   $products[$id][$color][$size]['qty'];
                    $product['product_price'] =   $products[$id][$color][$size]['price'];
                    $product['color_id']      =   $color;
                    $product['size_id']       =   $size;
                    $product['color_title']   =   $products[$id][$color][$size]['color_title'];
                    $product['size_title']    =   $products[$id][$color][$size]['size_title'];
                    
                    $sumPrice       += $products[$id][$color][$size]['price']*$products[$id][$color][$size]['qty'];
                    $sumQty         += $products[$id][$color][$size]['qty'];
                    $dataInsert[]   = new OrderDetail($product);
                    unset($products[$id][$color][$size]);
                }
            }
            

            $order->code          =    time();
            $order->order_qty     =    (int)$sumQty;
            $order->subtotal      =    (int)$sumPrice;
            $order->coupon_amount =    (int)$request->coupon_amount;
            $order->shipping      =    (int)str_replace('.', '', $request->shipping);
            $order->order_price   =    ($order->subtotal + $order->shipping)-$order->coupon_amount;
            $order->user_id       =    Auth::id();
            $order->priority      =    (int)str_replace('.', '', $request->priority);
            $order->type          =    $this->_data['type'];
            $order->created_at    =    new DateTime();
            $order->updated_at    =    new DateTime();
            $order->save();
            $order->code          =    update_code($order->id,'DH');
            $order->save();
            $order->details()->saveMany($dataInsert);
            return redirect()->route('admin.order.index',['type'=>$this->_data['type']])->with('success','Thêm dữ liệu <b>'.$order->code.'</b> thành công');
        }
        
    }

    public function edit($id){
        $this->_data['item'] = Order::find($id);
        if ($this->_data['item'] !== null) {
            $this->_data['products'] = $this->_data['item']->details()->get();
            return view('admin.orders.edit',$this->_data);
        }
        return redirect()->route('admin.order.index',['type'=>$this->_data['type']])->with('danger', 'Dữ liệu không tồn tại');
    }

    public function update(Request $request, $id){
        $valid = Validator::make($request->all(), [
            'products'          => 'required',
            ], [
            'products.required' => 'Vui lòng chọn sản phẩm',
        ]);
        if ($valid->fails()) {
            return redirect()->back()->withErrors($valid)->withInput();
        } else {
            $order = Order::find($id);

            if ($order !== null) {
                if($request->data){
                    foreach($request->data as $field => $value){
                        $order->$field = $value;
                    }
                }
                
                $inputProduct = $request->products;
                $products = [];
                $product  = [];
                $sumPrice = 0;
                $sumQty   = 0;
                $dataInsert = [];
                foreach($inputProduct as $key => $value){
                    $id    = (int)$value['id'];
                    $color = (int)@$value['color_id'];
                    $size  = (int)@$value['size_id'];
                    if( !isset($products[$id][$color][$size]) ){
                        $products[$id][$color][$size]['title']  =  $value['title'];
                        $products[$id][$color][$size]['code']  =  strtoupper($value['code']);
                        $products[$id][$color][$size]['price'] =  $value['price'];
                        @$products[$id][$color][$size]['qty']  +=  $value['qty'];
                        @$products[$id][$color][$size]['color_title']  =  $value['color_title'];
                        @$products[$id][$color][$size]['size_title']  =  $value['size_title'];
                    }else{
                        unset($inputProduct[$key]);
                    }
                }
                array_values($inputProduct);
                foreach($inputProduct as $key => $value){
                    $id    = (int)$value['id'];
                    $color = (int)@$value['color_id'];
                    $size  = (int)@$value['size_id'];
                    if( isset($products[$id][$color][$size]) ){
                        $product['product_id']    =   $id;
                        $product['product_code']  =   $products[$id][$color][$size]['code'];
                        $product['product_title'] =   $products[$id][$color][$size]['title'];
                        $product['product_qty']   =   $products[$id][$color][$size]['qty'];
                        $product['product_price'] =   $products[$id][$color][$size]['price'];
                        $product['color_id']      =   $color;
                        $product['size_id']       =   $size;
                        $product['color_title']   =   $products[$id][$color][$size]['color_title'];
                        $product['size_title']    =   $products[$id][$color][$size]['size_title'];
                        
                        $sumPrice       += $products[$id][$color][$size]['price']*$products[$id][$color][$size]['qty'];
                        $sumQty         += $products[$id][$color][$size]['qty'];
                        $dataInsert[]   = new OrderDetail($product);
                        unset($products[$id][$color][$size]);
                    }
                }
                $order->order_qty     =    (int)$sumQty;
                $order->subtotal      =    (int)$sumPrice;
                $order->coupon_amount =    (int)$request->coupon_amount;
                $order->shipping      =    (int)str_replace('.', '', $request->shipping);
                $order->order_price   =    ($order->subtotal + $order->shipping)-$order->coupon_amount;
                $order->priority      =    (int)str_replace('.', '', $request->priority);
                $order->type          =    $this->_data['type'];
                $order->updated_at    =    new DateTime();
                $order->save();
                OrderDetail::whereIn('id',$order->details()->pluck('id')->toArray())->delete();
                $order->details()->saveMany($dataInsert);
                return redirect( $request->redirects_to )->with('success','Cập nhật dữ liệu <b>'.$order->name.'</b> thành công');
            }
            return redirect( $request->redirects_to )->with('danger', 'Dữ liệu không tồn tại');
        }
    }

    public function delete($id){
        $order = Order::find($id);
        $deleted = $order->name;
        if ($order !== null) {
            if( $order->delete() ){
                OrderDetail::whereIn('id',$order->details()->pluck('id')->toArray())->delete();
                return redirect()->route('admin.order.index',['type'=>$this->_data['type']])->with('success', 'Xóa dữ liệu <b>'.$deleted.'</b> thành công');
            }else{
                return redirect()->route('admin.order.index',['type'=>$this->_data['type']])->with('danger', 'Xóa dữ liệu bị lỗi');
            }
        }
        return redirect()->route('admin.order.index',['type'=>$this->_data['type']])->with('danger', 'Dữ liệu không tồn tại');
    }
}
