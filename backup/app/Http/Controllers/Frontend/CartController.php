<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Setting;
use App\Product;
use App\ProductLanguage;
use App\User;
use App\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use DateTime;

class CartController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    private $_data;

    public function __construct(Request $request){
        $this->_data = set_type($request->type);
        $this->middleware(function($request,$next){
            $this->_data['lang'] = (session('lang')) ? session('lang') : 'vi';
            App::setLocale($this->_data['lang']);
            $this->_data['meta_seo'] = set_meta_tags('',$this->_data['lang']);
            View::share('siteconfig', config('siteconfig'));
            return $next($request);
        });
    }

    public function index(Request $request){
        $this->_data['page_title'] = "Giỏ hàng";
        $this->_data['breadcrumb'] = '<li> <a href="'.url('/').'"> Trang chủ </a> </li>';
        $this->_data['breadcrumb'] .= '<li> <a href="'.url('/gio-hang').'"> '.$this->_data['page_title'].' </a> </li>';
        
        $cart = is_array($cart = json_decode($request->cookie('cart'), true)) ? $cart : [];
        if (count($cart) > 0) {
            $sumPrice = 0;
            foreach ($cart as $key => $value) {
                $sumPrice += $value['sum'];
                $cart[$key]['price'] = number_format($value['price'], 0, ',', '.');
                $cart[$key]['sum'] = number_format($value['sum'], 0, ',', '.');
            }
            $this->_data['total'] = count($cart);
            $this->_data['sumPrice'] = number_format($sumPrice, 0, ',', '.');
            $this->_data['cart'] = $cart;
            
        }else{
            $this->_data['total'] = 0;
            $this->_data['sumPrice'] = 0;
            $this->_data['cart'] = $cart;
        }
        return view('frontend.default.cart', $this->_data);
    }

    public function checkout(Request $request){
        $this->_data['page_title'] = "Thanh toán";
        $this->_data['breadcrumb'] = '<li> <a href="'.url('/').'"> Trang chủ </a> </li>';
        $this->_data['breadcrumb'] .= '<li> <a href="'.url('/thanh-toan').'"> '.$this->_data['page_title'].' </a> </li>';
        
        $cart = is_array($cart = json_decode($request->cookie('cart'), true)) ? $cart : [];
        if (count($cart) > 0) {
            $sumPrice = 0;
            foreach ($cart as $key => $value) {
                $sumPrice += $value['sum'];
                $cart[$key]['price'] = number_format($value['price'], 0, ',', '.');
                $cart[$key]['sum'] = number_format($value['sum'], 0, ',', '.');
            }
            $this->_data['total'] = count($cart);
            $this->_data['sumPrice'] = number_format($sumPrice, 0, ',', '.');
            $this->_data['cart'] = $cart;
            return view('frontend.default.checkout', $this->_data);
        }
        return redirect()->route('home.index');
        
    }

    public function placeOrder(Request $request){
        $cart = is_array($cart = json_decode($request->cookie('cart'), true)) ? $cart : [];
        if (count($cart) > 0) {

            $valid = Validator::make($request->all(), [
                'name' => 'required',
                'address' => 'required',
                'email' => 'required|email',
                'phone' => 'required',
            ], [
                'name.required' => 'Yêu cầu nhập Tên',
                'address.required' => 'Yêu cầu nhập Địa chỉ',
                'email.required' => 'Yêu cầu nhập Email',
                'email.email' => 'Không đúng định dạng Email',
                'phone.required' => 'Yêu cầu nhập Số điện thoại',
            ]);

            if ($valid->fails()) {
                return redirect()->back()->withErrors($valid)->withInput();
            } else {

                $shipping = $request->shipping ? $request->shipping : 0;
                $sumPrice = 0;
                $sumQty = 0;
                $product = [];
                foreach ($cart as $key => $value) {
                    $sumPrice += $value['sum'];
                    $sumQty += $value['qty'];
                    $product['id'][] = $key;
                    $product['code'][] = $value['code'];
                    $product['price'][] = $value['price'];
                    $product['qty'][] = $value['qty'];
                }
                $order = Order::create([
                    'name'  =>  $request->name,
                    'address'  =>  $request->address,
                    'email'  =>  $request->email,
                    'phone'  =>  $request->phone,
                    'province_id'  =>  (int)$request->province_id,
                    'district_id'  =>  (int)$request->district_id,
                    'note'  =>  $request->order_note,
                    'quantity'  =>  (int)$sumQty,
                    'shipping'  =>  (int)$shipping,
                    'subtotal'  =>  (int)$sumPrice,
                    'total'  =>  (int)($sumPrice - $shipping),
                    'product_id'  =>  implode(',',$product['id']),
                    'product_code'  =>  implode(',',$product['code']),
                    'product_qty'  =>  implode(',',$product['qty']),
                    'product_price'  =>  implode(',',$product['price']),
                    'user_id'  =>  auth()->check() ? auth()->id() : null,
                    'status_id'  =>  1,
                    'type'  =>  'online',
                    'created_at'    => new DateTime(),
                    'updated_at'    => new DateTime(),
                ]);
                $order->code = update_code($order->id,'DH');
                $order->save();
                $cookie = cookie('cart', '', 720);
                return redirect()->route('cart.thankyou')->with('orderCode', $order->code)->withCookie($cookie);
            }
        }else{
            return redirect()->route('home.index');
        }
    }

    public function thankYou(){
        $this->_data['page_title'] = "Tiếp tục mua sắm";
        $this->_data['breadcrumb'] = '<li> <a href="'.url('/').'"> Trang chủ </a> </li>';
        $this->_data['breadcrumb'] .= '<li> <a href="'.url('/san-pham').'"> '.$this->_data['page_title'].' </a> </li>';
        return view('frontend.default.thankyou',$this->_data);
    }

    public function addToCart(Request $request){
        $id = $request->id;
        if ($request->ajax() && is_numeric($id)) {
            $product = Product::find($id);
            if ($product !== null) {
                $cart = is_array($cart = json_decode($request->cookie('cart'), true)) ? $cart : [];
                if (!array_key_exists($id, $cart)) {
                    $cart[$id] = [
                        'name' => $product->languages[0]->title,
                        'code' => $product->code,
                        'price' => $product->sale_price > 0 ? $product->sale_price : $product->regular_price,
                        'image' => $product->image ? asset('public/uploads/product/'.get_thumbnail($product->image)) : asset('public/images/noimage/275x400.jpg'),
                        'qty' => is_numeric($request->qty) && $request->qty > 0 ? $request->qty : 1
                    ];
                } else {
                    $cart[$id]['qty'] += is_numeric($request->qty) && $request->qty > 0 ? $request->qty : 1;
                }
                $cart[$id]['sum'] = $cart[$id]['qty'] * $cart[$id]['price'];

                $sumPrice = 0;
                $cartTemp = $cart;
                foreach ($cart as $key => $value) {
                    $sumPrice += $value['sum'];
                    $cart[$key]['price'] = number_format($value['price'], 0, ',', '.');
                    $cart[$key]['sum'] = number_format($value['sum'], 0, ',', '.');
                }
                $cookie = cookie('cart', json_encode($cartTemp), 720);
                return response()->json([
                    'type'    =>  'success',
                    'title' =>  '',
                    'message' => 'Đã thêm vào giỏ hàng thành công',
                    'total' => count($cart),
                    'sumPrice' => number_format($sumPrice, 0, ',', '.'),
                    'cart' => $cart
                ])->withCookie($cookie);
            }else{
                return response()->json([
                    'type'    =>  'warning',
                    'title' =>  '',
                    'message' => 'Thêm sản phẩm thất bại'
                ]);
            }
        }else{
            return response()->json([
                'type'    =>  'warning',
                'title' =>  '',
                'message' => 'Thêm sản phẩm thất bại'
            ]);
        }
    }

    public function updateCart(Request $request){
        $id = $request->id;
        $qty = $request->qty;
        if ($request->ajax() && is_numeric($id) && is_numeric($qty)) {
            $cart = is_array($cart = json_decode($request->cookie('cart'), true)) ? $cart : [];
            if (isset($cart[$id]) && $qty > 0) {
                $cart[$id]['qty'] = $qty;
                $cart[$id]['sum'] = $cart[$id]['qty'] * $cart[$id]['price'];
            } elseif (isset($cart[$id])) {
                unset($cart[$id]);
            }
            $sumPrice = 0;
            $cartTemp = $cart;
            foreach ($cart as $key => $value) {
                $sumPrice += $value['sum'];
                $cart[$key]['price'] = number_format($value['price'], 0, ',', '.');
                $cart[$key]['sum'] = number_format($value['sum'], 0, ',', '.');
            }
            $cookie = cookie('cart', json_encode($cartTemp), 720);
            return response()->json([
                'type'    =>  'success',
                'title' =>  '',
                'message' => 'Cập nhật giỏ hàng thành công',
                'total' => count($cart),
                'sumPrice' => number_format($sumPrice, 0, ',', '.'),
                'cart' => $cart,
                'update_id' => $id
            ])->withCookie($cookie);
        }
    }

    public function deleteCart(Request $request){
        $id = $request->id;
        if ($request->ajax() && is_numeric($id)) {
            $cart = is_array($cart = json_decode($request->cookie('cart'), true)) ? $cart : [];
            if (isset($cart[$id])) {
                unset($cart[$id]);
            }
            $sumPrice = 0;
            $cartTemp = $cart;
            foreach ($cart as $key => $value) {
                $sumPrice += $value['sum'];
                $cart[$key]['price'] = number_format($value['price'], 0, ',', '.');
                $cart[$key]['sum'] = number_format($value['sum'], 0, ',', '.');
            }
            $cookie = cookie('cart', json_encode($cartTemp), 720);
            return response()->json([
                'type'    =>  'success',
                'title' =>  '',
                'message' => 'Đã xóa sản phẩm khỏi giỏ hàng',
                'total' => count($cart),
                'sumPrice' => number_format($sumPrice, 0, ',', '.'),
                'cart' => $cart,
                'delete_id' => $id
            ])->withCookie($cookie);
        }else{
            return response()->json([
                'type'    =>  'error',
                'title' =>  '',
                'message' => 'Sản phẩm không tồn tại trong giỏ hàng'
            ]);
        }
    }

    public function deleteAll(Request $request){
        $cookie = cookie('cart', '', 720);
        return redirect()->route('cart.index')->withCookie($cookie);
    }

    
}
