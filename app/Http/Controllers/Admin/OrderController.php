<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use App\Order;

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
            $warehouses = get_product_in_warehouses();

            if($request->data){
                foreach($request->data as $field => $value){
                    $order->$field = $value;
                }
            }
            $products = [];
            $product  = [];
            $sumPrice = 0;
            $sumQty   = 0;
            if($request->products){

                foreach($request->products as $key => $value){
                    $id    = (int)$value['id'];
                    $color = (int)@$value['color'];
                    $size  = (int)@$value['size'];
                    $products[$id][$color][$size]['code']  =  $value['code'];
                    $products[$id][$color][$size]['price'] =  $value['price'];
                    @$products[$id][$color][$size]['qty']  +=  $value['qty'];
                }

                foreach($products as $id => $colors){
                    foreach($colors as $color => $sizes){
                        foreach($sizes as $size => $value){
                            $product['id'][]    =   $id;
                            $product['color'][] =   $color;
                            $product['size'][]  =   $size;
                            $product['code'][]  =   $value['code'];
                            $product['price'][] =   $value['price'];
                            $product['qty'][]   =   $value['qty'];
                            
                            $sumPrice           += $value['price']*$value['qty'];
                            $sumQty             += $value['qty'];
                            $store = (int)@$warehouses[$id][$color][$size]['import'] - (int)@$warehouses[$id][$color][$size]['export']; 
                            if( $store <=0 || $value['qty'] > $store ){
                                return redirect()->route('admin.order.index',['type'=>$this->_data['type']])->with('danger','Số lượng tồn kho đã có thay đổi vui lòng kiểm tra lại');
                            }
                        }
                    }
                }
            }
            // $sumPrice -= (int)$order->coupon_amount;
            
            $order->code          =    time();
            $order->product_id    =    implode(',',$product['id']);
            $order->product_code  =    implode(',',$product['code']);
            $order->product_color =    implode(',',$product['color']);
            $order->product_size  =    implode(',',$product['size']);
            $order->product_price =    implode(',',$product['price']);
            $order->product_qty   =    implode(',',$product['qty']);

            $order->quantity      =    (int)$sumQty;
            $order->subtotal      =    (int)$sumPrice;
            $order->shipping      =    (int)str_replace('.', '', $request->shipping);
            $order->total         =    $order->subtotal + $order->shipping;
            $order->user_id       =    Auth::id();
            $order->priority      =    (int)str_replace('.', '', $request->priority);
            $order->type          =    $this->_data['type'];
            $order->created_at    =    new DateTime();
            $order->updated_at    =    new DateTime();
            $order->save();
            $order->code          =    update_code($order->id,'DH');
            $order->save();
            return redirect()->route('admin.order.index',['type'=>$this->_data['type']])->with('success','Thêm dữ liệu <b>'.$order->code.'</b> thành công');
        }
        
    }

    public function edit($id){
        $this->_data['item'] = Order::find($id);
        if ($this->_data['item'] !== null) {
            $warehouses = get_product_in_warehouses();

            $product_id    = explode(',',$this->_data['item']['product_id']);
            $product_code  = explode(',',$this->_data['item']['product_code']);
            $product_size  = explode(',',$this->_data['item']['product_size']);
            $product_color = explode(',',$this->_data['item']['product_color']);
            $product_qty   = explode(',',$this->_data['item']['product_qty']);
            $product_price = explode(',',$this->_data['item']['product_price']);
            $products = [];
            foreach($product_id as $key => $id){
                $product = DB::table('product_languages')
                    ->select('title')
                    ->where('product_id',$id)
                    ->where('language',$this->_data['default_language'])
                    ->first();

                $color = DB::table('attribute_languages')
                            ->select('title')
                            ->where('attribute_id',$product_color[$key])
                            ->where('language',$this->_data['default_language'])
                            ->first();

                $size = DB::table('attribute_languages')
                            ->select('title')
                            ->where('attribute_id',$product_size[$key])
                            ->where('language',$this->_data['default_language'])
                            ->first();
                $products[$key]['id']     =  $id;
                $products[$key]['code']   =  $product_code[$key];
                $products[$key]['price']  =  $product_price[$key];
                $products[$key]['qty']    =  $product_qty[$key];
                $products[$key]['color']  =  $product_color[$key];
                $products[$key]['size']   =  $product_size[$key];
                $products[$key]['title']  =  @$product->title;
                $products[$key]['colors'] =  @$color->title;
                $products[$key]['sizes']  =  @$size->title;
                $products[$key]['store']    =  (int)@$warehouses[$id][$product_color[$key]][$product_size[$key]]['import'] - (int)@$warehouses[$id][$product_color[$key]][$product_size[$key]]['export'];
            }
            $this->_data['products'] = $products;
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
                $products = [];
                $product  = [];
                $sumPrice = 0;
                $sumQty   = 0;
                if($request->products){

                    foreach($request->products as $key => $value){
                        $id    = (int)$value['id'];
                        $color = (int)@$value['color'];
                        $size  = (int)@$value['size'];
                        $products[$id][$color][$size]['code']  =  $value['code'];
                        $products[$id][$color][$size]['price'] =  $value['price'];
                        @$products[$id][$color][$size]['qty']  +=  $value['qty'];
                    }

                    foreach($products as $id => $colors){
                        foreach($colors as $color => $sizes){
                            foreach($sizes as $size => $value){
                                $product['id'][]    =   $id;
                                $product['color'][] =   $color;
                                $product['size'][]  =   $size;
                                $product['code'][]  =   $value['code'];
                                $product['price'][] =   $value['price'];
                                $product['qty'][]   =   $value['qty'];
                                
                                $sumPrice           += $value['price']*$value['qty'];
                                $sumQty             += $value['qty'];
                            }
                        }
                    }
                }
                $sumPrice -= (int)$order->coupon_amount;
                $order->product_id    =    implode(',',$product['id']);
                $order->product_code  =    implode(',',$product['code']);
                $order->product_color =    implode(',',$product['color']);
                $order->product_size  =    implode(',',$product['size']);
                $order->product_price =    implode(',',$product['price']);
                $order->product_qty   =    implode(',',$product['qty']);
                
                $order->quantity      =    (int)$sumQty;
                $order->subtotal      =    (int)$sumPrice;
                $order->shipping      =    (int)str_replace('.', '', $request->shipping);
                $order->total         =    $order->subtotal + $order->shipping;
                $order->priority      =    (int)str_replace('.', '', $request->priority);
                $order->type          =    $this->_data['type'];
                $order->updated_at    =    new DateTime();
                $order->save();
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
                return redirect()->route('admin.order.index',['type'=>$this->_data['type']])->with('success', 'Xóa dữ liệu <b>'.$deleted.'</b> thành công');
            }else{
                return redirect()->route('admin.order.index',['type'=>$this->_data['type']])->with('danger', 'Xóa dữ liệu bị lỗi');
            }
        }
        return redirect()->route('admin.order.index',['type'=>$this->_data['type']])->with('danger', 'Dữ liệu không tồn tại');
    }
}
