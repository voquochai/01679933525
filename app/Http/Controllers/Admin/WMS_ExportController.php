<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use App\WMS_Export;

use DateTime;

class WMS_ExportController extends Controller
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
        $this->_data['siteconfig'] = config('siteconfig.wms.export');
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
        $this->_data['items'] = DB::table('wms_exports as A')
            ->leftjoin('users as B', 'A.user_id','=','B.id')
            ->select('A.*','B.name as username')
            ->where('A.type',$this->_data['type'])
            ->orderBy('A.priority','asc')
            ->orderBy('A.id','desc')
            ->paginate(25);

        $this->_data['total'] = DB::table('wms_exports')
            ->select(DB::raw('sum(quantity) as qty, sum(total) as price'))
            ->where('type',$this->_data['type'])->first();

        return view('admin.wms.exports.index',$this->_data);
    }
    
    public function create(){
        return view('admin.wms.exports.create',$this->_data);
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
            $wms_export  = new WMS_Export;
            $warehouses = get_product_in_warehouses();

            if($request->data){
                foreach($request->data as $field => $value){
                    $wms_export->$field = $value;
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
                                return redirect()->route('admin.wms_export.index',['type'=>$this->_data['type']])->with('danger','Số lượng tồn kho đã có thay đổi vui lòng kiểm tra lại');
                            }
                        }
                    }
                }
            }
            $wms_export->code          =    time();
            $wms_export->product_id    =    implode(',',$product['id']);
            $wms_export->product_code  =    implode(',',$product['code']);
            $wms_export->product_color =    implode(',',$product['color']);
            $wms_export->product_size  =    implode(',',$product['size']);
            $wms_export->product_price =    implode(',',$product['price']);
            $wms_export->product_qty   =    implode(',',$product['qty']);
            
            $wms_export->quantity      =    (int)$sumQty;
            $wms_export->total         =    (int)$sumPrice;
            $wms_export->user_id       =    Auth::id();
            $wms_export->priority      =    (int)str_replace('.', '', $request->priority);
            $wms_export->status        =    ($request->status) ? implode(',',$request->status) : '';
            $wms_export->type          =    $this->_data['type'];
            $wms_export->created_at    =    new DateTime();
            $wms_export->updated_at    =    new DateTime();
            $wms_export->save();
            $wms_export->code          =    update_code($wms_export->id,'PX');
            $wms_export->save();
            return redirect()->route('admin.wms_export.index',['type'=>$this->_data['type']])->with('success','Thêm dữ liệu <b>'.$wms_export->code.'</b> thành công');
        }
        
    }

    public function edit($id){
        $this->_data['item'] = WMS_Export::find($id);
        if ($this->_data['item'] !== null) {

            $product_id    = explode(',',$this->_data['item']['product_id']);
            $product_code  = explode(',',$this->_data['item']['product_code']);
            $product_size  = explode(',',$this->_data['item']['product_size']);
            $product_color = explode(',',$this->_data['item']['product_color']);
            $product_qty   = explode(',',$this->_data['item']['product_qty']);
            $product_price = explode(',',$this->_data['item']['product_price']);

            $products = [];
            
            foreach($product_id as $key => $id){

                $product = DB::table('products as A')
                    ->leftjoin('product_languages as B', 'A.id','=','B.product_id')
                    ->select('A.regular_price as price','B.title')
                    ->where('A.id',$id)
                    ->where('B.language', $this->_data['default_language'])
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

                $products[$key]['key']       =  $key+1;
                $products[$key]['id']      =  $id;
                $products[$key]['code']     =  $product_code[$key];
                $products[$key]['price']    =  @$product->price;
                $products[$key]['qty']      =  $product_qty[$key];
                $products[$key]['color']    =  $product_color[$key];
                $products[$key]['size']     =  $product_size[$key];
                $products[$key]['title']    =  @$product->title;
                $products[$key]['colors']   =  @$color->title;
                $products[$key]['sizes']    =  @$size->title;
            }
            $this->_data['products'] = $products;
            return view('admin.wms.exports.edit',$this->_data);
        }
        return redirect()->route('admin.wms_export.index',['type'=>$this->_data['type']])->with('danger', 'Dữ liệu không tồn tại');
    }

    public function update(Request $request, $id){
        // dd($request);
        $valid = Validator::make($request->all(), [
            'products'          => 'required',
            ], [
            'products.required' => 'Vui lòng chọn sản phẩm',
        ]);
        if ($valid->fails()) {
            return redirect()->back()->withErrors($valid)->withInput();
        } else {
            $wms_export = WMS_Export::find($id);
            if ($wms_export !== null) {
                if($request->data){
                    foreach($request->data as $field => $value){
                        $wms_export->$field = $value;
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
                
                $wms_export->product_id    =    implode(',',$product['id']);
                $wms_export->product_code  =    implode(',',$product['code']);
                $wms_export->product_color =    implode(',',$product['color']);
                $wms_export->product_size  =    implode(',',$product['size']);
                $wms_export->product_price =    implode(',',$product['price']);
                $wms_export->product_qty   =    implode(',',$product['qty']);

                $wms_export->quantity      =    (int)$sumQty;
                $wms_export->total         =    (int)$sumPrice;
                $wms_export->priority      = (int)str_replace('.', '', $request->priority);
                $wms_export->status        = ($request->status) ? implode(',',$request->status) : '';
                $wms_export->type          = $this->_data['type'];
                $wms_export->updated_at    = new DateTime();
                $wms_export->save();

                return redirect( $request->redirects_to )->with('success','Cập nhật dữ liệu <b>'.$wms_export->code.'</b> thành công');
            }
            return redirect( $request->redirects_to )->with('danger', 'Dữ liệu không tồn tại');
        }
    }

    public function delete(Request $request, $id){
        $wms_export = WMS_Export::find($id);
        if ($wms_export !== null) {
            if($request->data){
                foreach($request->data as $field => $value){
                    $wms_export->$field = $value;
                }
            }
            $wms_export->type          = $this->_data['type'];
            $wms_export->updated_at    = new DateTime();
            $wms_export->save();

            return redirect()->route('admin.wms_export.index',['type'=>$this->_data['type']])->with('success', 'Hủy phiếu <b>'.$wms_export->code.'</b> thành công');
        }
        return redirect()->route('admin.wms_export.index',['type'=>$this->_data['type']])->with('danger', 'Dữ liệu không tồn tại');

        // $wms_export = WMS_Export::find($id);
        // $deleted = $wms_export->code;
        // if ($wms_export !== null) {
        //     if( $wms_export->delete() ){
        //         return redirect()->route('admin.wms_export.index',['type'=>$this->_data['type']])->with('success', 'Xóa dữ liệu <b>'.$deleted.'</b> thành công');
        //     }else{
        //         return redirect()->route('admin.wms_export.index',['type'=>$this->_data['type']])->with('danger', 'Xóa dữ liệu bị lỗi');
        //     }
        // }
        // return redirect()->route('admin.wms_export.index',['type'=>$this->_data['type']])->with('danger', 'Dữ liệu không tồn tại');
    }

    public function getWarehouses($type='default'){
        return DB::table('wms_stores')
            ->where('type',$type)
            ->orderBy('priority','asc')
            ->orderBy('id','desc')
            ->get();
    }
    
}