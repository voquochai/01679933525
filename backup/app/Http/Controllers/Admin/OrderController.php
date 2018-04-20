<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
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
        // dd($request);
        $valid = Validator::make($request->all(), [
            'image'            => 'image|max:2048'
        ], [
            'image.image'               => 'Không đúng chuẩn hình ảnh cho phép',
            'image.max'                 => 'Dung lượng vượt quá giới hạn cho phép là :max KB'
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
            
            $order->priority       = (int)str_replace('.', '', $request->priority);
            $order->status         = ($request->status) ? implode(',',$request->status) : '';
            $order->type           = $this->_data['type'];
            $order->created_at     = new DateTime();
            $order->updated_at     = new DateTime();
            $order->save();
            return redirect()->route('order.index',['type'=>$this->_data['type']])->with('success','Thêm dữ liệu <b>'.$order->name.'</b> thành công');
        }
        
    }

    public function edit($id){
        $this->_data['item'] = Order::find($id);
        if ($this->_data['item'] !== null) {
            $this->_data['product_id'] = explode(',',$this->_data['item']['product_id']);
            $this->_data['product_code'] = explode(',',$this->_data['item']['product_code']);
            $this->_data['product_size'] = explode(',',$this->_data['item']['product_size']);
            $this->_data['product_color'] = explode(',',$this->_data['item']['product_color']);
            $this->_data['product_qty'] = explode(',',$this->_data['item']['product_qty']);
            $this->_data['product_price'] = explode(',',$this->_data['item']['product_price']);

            $this->_data['product_name'] = DB::table('product_languages')
                ->select('title','product_id')
                ->whereIn('product_id',$this->_data['product_id'])
                ->where('language',$this->_data['default_language'])
                ->orderBy(DB::raw('FIELD(product_id, '.$this->_data['item']['product_id'].')'))
                ->get()->toArray();

            return view('admin.orders.edit',$this->_data);
        }
        return redirect()->route('order.index',['type'=>$this->_data['type']])->with('danger', 'Dữ liệu không tồn tại');
    }

    public function update(Request $request, $id){
        // dd($request);
        $valid = Validator::make($request->all(), [
            'data.name' => 'required',
            'data.address' => 'required',
            'data.email' => 'required|email',
            'data.phone' => 'required',
        ], [
            'data.name.required' => 'Yêu cầu nhập Tên',
            'data.address.required' => 'Yêu cầu nhập Địa chỉ',
            'data.email.required' => 'Yêu cầu nhập Email',
            'data.email.email' => 'Không đúng định dạng Email',
            'data.phone.required' => 'Yêu cầu nhập Số điện thoại',
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
                $order->shipping       = (int)str_replace('.', '', $request->shipping);
                $order->total          = $order->subtotal - $order->shipping;
                $order->priority       = (int)str_replace('.', '', $request->priority);
                $order->type           = $this->_data['type'];
                $order->updated_at     = new DateTime();
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
                return redirect()->route('order.index',['type'=>$this->_data['type']])->with('success', 'Xóa dữ liệu <b>'.$deleted.'</b> thành công');
            }else{
                return redirect()->route('order.index',['type'=>$this->_data['type']])->with('danger', 'Xóa dữ liệu bị lỗi');
            }
        }
        return redirect()->route('order.index',['type'=>$this->_data['type']])->with('danger', 'Dữ liệu không tồn tại');
    }
}
