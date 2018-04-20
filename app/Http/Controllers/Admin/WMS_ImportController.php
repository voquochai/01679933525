<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use App\WMS_Import;

use DateTime;

class WMS_ImportController extends Controller
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
        $this->_data['siteconfig'] = config('siteconfig.wms.import');
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
        $this->_data['items'] = DB::table('wms_imports as A')
            ->leftjoin('users as B', 'A.user_id','=','B.id')
            ->select('A.*','B.name as username')
            ->where('A.type',$this->_data['type'])
            ->orderBy('A.priority','asc')
            ->orderBy('A.id','desc')
            ->paginate(25);

        $this->_data['total'] = DB::table('wms_imports')
            ->select(DB::raw('sum(quantity) as qty, sum(total) as price'))
            ->where('type',$this->_data['type'])->first();

        return view('admin.wms.imports.index',$this->_data);
    }

    public function ajax(Request $request){
        if($request->ajax()){
            $warehouses = get_product_in_warehouses();
            $code = strtoupper($request->q);
            
            if( count($warehouses) > 0 && isset($warehouses[$code]) ){
                $products = [];
                $id = $warehouses[$code];
                $product = DB::table('products as A')
                    ->leftjoin('product_languages as B', 'A.id','=','B.product_id')
                    ->select('A.regular_price as price','B.title')
                    ->where('A.id',$id)
                    ->where('B.language', $this->_data['default_language'])
                    ->first();
                foreach( $warehouses[$id] as $idColor => $sizes ){
                    $color = DB::table('attribute_languages')
                        ->select('title')
                        ->where('attribute_id',$idColor)
                        ->where('language',$this->_data['default_language'])
                        ->first();
                    foreach( $sizes as $idSize => $val){
                        $size = DB::table('attribute_languages')
                            ->select('title')
                            ->where('attribute_id',$idSize)
                            ->where('language',$this->_data['default_language'])
                            ->first();
                        $key = count($products);
                        $products[$key]['id']       =  time()+$key;
                        $products[$key]['pid']      =  $id;
                        $products[$key]['code']     =  $code;
                        $products[$key]['price']    =  @$product->price;
                        $products[$key]['qty']      =  1;
                        $products[$key]['color']    =  $idColor;
                        $products[$key]['size']     =  $idSize;
                        $products[$key]['title']    =  @$product->title.(@$color->title ? ' - '.@$color->title : '').(@$size->title ? ' - '.@$size->title : '');
                        $products[$key]['colors']   =  @$color->title;
                        $products[$key]['sizes']    =  @$size->title;
                        $products[$key]['store']    =  (int)@$val['import'] - (int)@$val['export'];
                    }
                }
                return response()->json(['items'=>$products]);
            }
            
        }
    }
    
    public function create(){
        return view('admin.wms.imports.create',$this->_data);
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
            $wms_import  = new WMS_Import;

            if($request->data){
                foreach($request->data as $field => $value){
                    $wms_import->$field = $value;
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
                            $product['code'][]  =   strtoupper($value['code']);
                            $product['price'][] =   $value['price'];
                            $product['qty'][]   =   $value['qty'];
                            
                            $sumPrice           += $value['price']*$value['qty'];
                            $sumQty             += $value['qty'];

                        }
                    }
                }
            }
            $wms_import->code          =    time();
            $wms_import->product_id    =    implode(',',$product['id']);
            $wms_import->product_code  =    implode(',',$product['code']);
            $wms_import->product_color =    implode(',',$product['color']);
            $wms_import->product_size  =    implode(',',$product['size']);
            $wms_import->product_price =    implode(',',$product['price']);
            $wms_import->product_qty   =    implode(',',$product['qty']);

            $wms_import->quantity      =    (int)$sumQty;
            $wms_import->total         =    (int)$sumPrice;
            $wms_import->user_id       =    Auth::id();
            $wms_import->priority      =    (int)str_replace('.', '', $request->priority);
            $wms_import->status        =    ($request->status) ? implode(',',$request->status) : '';
            $wms_import->type          =    $this->_data['type'];
            $wms_import->created_at    =    new DateTime();
            $wms_import->updated_at    =    new DateTime();
            $wms_import->save();
            $wms_import->code          =    update_code($wms_import->id,'PN');
            $wms_import->save();
            return redirect()->route('admin.wms_import.index',['type'=>$this->_data['type']])->with('success','Thêm dữ liệu <b>'.$wms_import->code.'</b> thành công');
        }
        
    }

    public function edit(Request $request, $id){
        $this->_data['item'] = WMS_Import::find($id);
        if ($this->_data['item'] !== null) {

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

                $colors = DB::table('attributes as A')
                            ->leftjoin('attribute_languages as B', 'A.id','=','B.attribute_id')
                            ->select('A.id','B.title')
                            ->whereIn('A.id', DB::table('product_attribute')->where('product_id',$id)->where('type','product_colors')->pluck('attribute_id') )
                            ->where('A.type','product_colors')
                            ->where('B.language', $this->_data['default_language'])
                            ->orderBy('A.priority','asc')
                            ->orderBy('A.id','desc')
                            ->get();
                $sizes = DB::table('attributes as A')
                            ->leftjoin('attribute_languages as B', 'A.id','=','B.attribute_id')
                            ->select('A.id','B.title')
                            ->whereIn('A.id', DB::table('product_attribute')->where('product_id',$id)->where('type','product_sizes')->pluck('attribute_id') )
                            ->where('A.type','product_sizes')
                            ->where('B.language', $this->_data['default_language'])
                            ->orderBy('A.priority','asc')
                            ->orderBy('A.id','desc')
                            ->get();

                $products[$key]['id']       =  $id;
                $products[$key]['code']     =  $product_code[$key];
                $products[$key]['price']    =  $product_price[$key];
                $products[$key]['qty']      =  $product_qty[$key];
                $products[$key]['color']    =  $product_color[$key];
                $products[$key]['size']     =  $product_size[$key];
                $products[$key]['title']    =  @$product->title;
                $products[$key]['colors']   =  $colors;
                $products[$key]['sizes']    =  $sizes;
            }
            $this->_data['products'] = $products;
            return view('admin.wms.imports.edit',$this->_data);
        }
        return redirect()->route('admin.wms_import.index',['type'=>$this->_data['type']])->with('danger', 'Dữ liệu không tồn tại');
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
            $wms_import = WMS_Import::find($id);
            if ($wms_import !== null) {
                if($request->data){
                    foreach($request->data as $field => $value){
                        $wms_import->$field = $value;
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
                                $product['code'][]  =   strtoupper($value['code']);
                                $product['price'][] =   $value['price'];
                                $product['qty'][]   =   $value['qty'];
                                
                                $sumPrice           += $value['price']*$value['qty'];
                                $sumQty             += $value['qty'];

                            }
                        }
                    }
                }
                
                $wms_import->product_id    =    implode(',',$product['id']);
                $wms_import->product_code  =    implode(',',$product['code']);
                $wms_import->product_color =    implode(',',$product['color']);
                $wms_import->product_size  =    implode(',',$product['size']);
                $wms_import->product_price =    implode(',',$product['price']);
                $wms_import->product_qty   =    implode(',',$product['qty']);
                
                $wms_import->quantity      =    (int)$sumQty;
                $wms_import->total         =    (int)$sumPrice;
                $wms_import->priority      = (int)str_replace('.', '', $request->priority);
                $wms_import->status        = ($request->status) ? implode(',',$request->status) : '';
                $wms_import->type          = $this->_data['type'];
                $wms_import->updated_at    = new DateTime();
                $wms_import->save();

                return redirect( $request->redirects_to )->with('success','Cập nhật dữ liệu <b>'.$wms_import->code.'</b> thành công');
            }
            return redirect( $request->redirects_to )->with('danger', 'Dữ liệu không tồn tại');
        }
    }

    public function delete(Request $request, $id){
        $wms_import = WMS_Import::find($id);
        if ($wms_import !== null) {
            if($request->data){
                foreach($request->data as $field => $value){
                    $wms_import->$field = $value;
                }
            }
            $wms_import->type          = $this->_data['type'];
            $wms_import->updated_at    = new DateTime();
            $wms_import->save();

            return redirect()->route('admin.wms_import.index',['type'=>$this->_data['type']])->with('success', 'Hủy phiếu <b>'.$wms_import->code.'</b> thành công');
        }
        return redirect()->route('admin.wms_import.index',['type'=>$this->_data['type']])->with('danger', 'Dữ liệu không tồn tại');
    }

    public function getWarehouses($type='default'){
        return DB::table('wms_stores')
            ->where('type',$type)
            ->orderBy('priority','asc')
            ->orderBy('id','desc')
            ->get();
    }
    
}