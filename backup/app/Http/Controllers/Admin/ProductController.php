<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\DB;
use App\Product;
use App\ProductLanguage;
use App\Category;
use App\Attribute;
use App\MediaLibrary;

use DateTime;

class ProductController extends Controller
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
        $this->_data['siteconfig'] = config('siteconfig.product');
        $this->_data['default_language'] = config('siteconfig.general.language');
        $this->_data['languages'] = config('siteconfig.languages');
        $this->_data['path'] = $this->_data['siteconfig']['path'];
        $this->_data['thumbs'] = $this->_data['siteconfig'][$this->_data['type']]['thumbs'];
        $this->_data['pageTitle'] = $this->_data['siteconfig'][$this->_data['type']]['page-title'];
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function index(){

        $this->_data['items'] = DB::table('products as A')
            ->leftjoin('product_languages as B', 'A.id','=','B.product_id')
            ->leftjoin('category_languages as C', 'A.category_id','=','C.category_id')
            ->select('A.*','B.title','C.title as category')
            ->where('A.type',$this->_data['type'])
            ->where('B.language', $this->_data['default_language'])
            ->where('C.language', $this->_data['default_language'])
            ->orderBy('A.priority','asc')
            ->orderBy('A.id','desc')
            ->paginate(25);
        return view('admin.products.index',$this->_data);
    }
    
    public function ajax(Request $request){
        if($request->ajax()){
            $data['items'] = DB::table('products as A')
                ->leftjoin('product_languages as B', 'A.id','=','B.product_id')
                ->select('A.id','A.code','A.original_price as price','B.title')
                ->where('A.type',$request->type)
                ->where('A.code','like', "%$request->q%")
                ->orWhere('B.title','like', "%$request->q%")
                ->where('B.language', $this->_data['default_language'])
                ->orderBy('A.priority','asc')
                ->orderBy('A.id','desc')
                ->get();

            if( $data['items'] !== null ){
                foreach( $data['items'] as $key => $item ){
                    $colors = DB::table('attributes as A')
                                ->leftjoin('attribute_languages as B', 'A.id','=','B.attribute_id')
                                ->select('A.id','B.title')
                                ->whereIn('A.id', DB::table('product_attribute')->where('product_id', $item->id)->where('type','product_colors')->pluck('attribute_id') )
                                ->where('A.type','product_colors')
                                ->where('B.language', $this->_data['default_language'])
                                ->orderBy('A.priority','asc')
                                ->orderBy('A.id','desc')
                                ->get();
                    $sizes = DB::table('attributes as A')
                                ->leftjoin('attribute_languages as B', 'A.id','=','B.attribute_id')
                                ->select('A.id','B.title')
                                ->whereIn('A.id', DB::table('product_attribute')->where('product_id', $item->id)->where('type','product_sizes')->pluck('attribute_id') )
                                ->where('A.type','product_sizes')
                                ->where('B.language', $this->_data['default_language'])
                                ->orderBy('A.priority','asc')
                                ->orderBy('A.id','desc')
                                ->get();
                    $data['items'][$key]->qty = 1;
                    $data['items'][$key]->colors = $colors;
                    $data['items'][$key]->sizes = $sizes;
                }
            }
            return response()->json($data);
        }
    }
    
    public function create(){
        $this->_data['suppliers'] = $this->getSupplier();
        $this->_data['categories'] = $this->getCategory($this->_data['type']);
        $this->_data['colors'] = $this->getAttribute('product_colors');
        $this->_data['sizes'] = $this->getAttribute('product_sizes');
        $this->_data['tags'] = $this->getAttribute('product_tags');
    	return view('admin.products.create',$this->_data);
    }

    public function store(Request $request){
        // dd($request);
        $valid = Validator::make($request->all(), [
            'dataL.vi.title'   => 'required',
            'data.code'        => 'unique:products,code',
            'image'            => 'image|max:2048',
            'data.category_id' => 'exists:categories,id'
        ], [
            'dataL.vi.title.required'   => 'Vui lòng nhập Tên Sản Phẩm',
            'data.code.unique'          => 'Mã sản phẩm đã trùng, vui lòng chọn mã khác',
            'image.image'               => 'Không đúng chuẩn hình ảnh cho phép',
            'image.max'                 => 'Dung lượng vượt quá giới hạn cho phép là :max KB',
            'data.category_id.exists'   => 'Vui lòng chọn Danh mục',
        ]);
        if ($valid->fails()) {
            return redirect()->back()->withErrors($valid)->withInput();
        } else {
            $product  = new Product;

            if($request->data){
                foreach($request->data as $field => $value){
                    $product->$field = $value;
                }
            }

            if($request->hasFile('image')){
                $product->image = save_image( $this->_data['path'],$request->file('image'),$this->_data['thumbs'] );
            }

            if($request->hasFile('files')){
                $fileuploader = json_decode($request->input('fileuploader-list-files'),true);
                foreach($request->file('files') as $file){
                    $fileName  = $file->getClientOriginalName();
                    if( false !== $key = array_search($fileName, $request->attachment['name']) ){
                        $fileMime  = $file->getClientMimeType();
                        $fileSize      = $file->getClientSize();
                        $imageName = save_image( $this->_data['path'],$file, null);
                        
                        if( isset($fileuploader[$key]['editor']) ){
                            $newImg  = Image::make( public_path($this->_data['path'].'/'.$imageName) );
                            if( @$fileuploader[$key]['editor']['rotation'] ){
                                $rotation = -(int)$fileuploader[$key]['editor']['rotation'];
                                $newImg->rotate($rotation);
                            }
                            if( @$fileuploader[$key]['editor']['crop'] ){
                                $width  = round($fileuploader[$key]['editor']['crop']['width']);
                                $height = round($fileuploader[$key]['editor']['crop']['height']);
                                $left   = round($fileuploader[$key]['editor']['crop']['left']);
                                $top    = round($fileuploader[$key]['editor']['crop']['top']);
                                $newImg->crop($width,$height,$left,$top);
                            }
                            $newImg->save( public_path($this->_data['path'].'/'.$imageName) );
                        }

                        $media = MediaLibrary::create([
                            'image' => $imageName,
                            'alt'   => $request->attachment['alt'][$key],
                            'editor' => isset($fileuploader[$key]['editor']) ? $fileuploader[$key]['editor'] : '',
                            'mime_type' => $fileMime,
                            'type' => $this->_data['type'],
                            'size' => $fileSize,
                            'priority'   => $request->attachment['priority'][$key],
                        ]);
                        $media_list_id[] = $media->id;
                        unset($fileuploader[$key]);
                    }
                }
                $product->attachments = implode(',',$media_list_id);
            }
            
            $product->original_price = (int)str_replace('.', '', $request->original_price);
            $product->regular_price  = (int)str_replace('.', '', $request->regular_price);
            $product->sale_price     = (int)str_replace('.', '', $request->sale_price);
            $product->weight         = (int)str_replace('.', '', $request->weight);
            
            $product->priority       = (int)str_replace('.', '', $request->priority);
            $product->status         = ($request->status) ? implode(',',$request->status) : '';
            $product->user_id        = Auth::id();
            $product->type           = $this->_data['type'];
            $product->created_at     = new DateTime();
            $product->updated_at     = new DateTime();
            $product->save();

            $dataL = [];
            $dataInsert = [];
            foreach($this->_data['languages'] as $lang => $val){
                if($request->dataL[$lang]){
                    foreach($request->dataL[$lang] as $fieldL => $valueL){
                        $dataL[$fieldL] = $valueL;
                    }
                }

                if( !isset($request->dataL[$this->_data['default_language']]['slug']) || $request->dataL[$this->_data['default_language']]['slug'] == ''){
                    $dataL['slug']       = str_slug($request->dataL[$this->_data['default_language']]['title']);
                }else{
                    $dataL['slug']       = str_slug($request->dataL[$this->_data['default_language']]['slug']);
                }
                $dataL['attributes'] = $request->input('attributes.'.$lang);
                $dataL['language']   = $lang;
                $dataInsert[]        = new ProductLanguage($dataL);
            }
            $product->languages()->saveMany($dataInsert);

            $attrs = [];
            // Add Colors
            if ($request->has('colors') && is_array($request->colors) && count($request->colors) > 0) {
                foreach ($request->colors as $color) {
                    $attrs[$color] = ['type' => 'product_colors'];
                }
            }

            // Add Sizes
            if ($request->has('sizes') && is_array($request->sizes) && count($request->sizes) > 0) {
                foreach ($request->sizes as $size) {
                    $attrs[$size] = ['type' => 'product_sizes'];
                }
            }
            // Add Tags
            if ($request->has('tags') && is_array($request->tags) && count($request->tags) > 0) {
                foreach ($request->tags as $tag) {
                    $attrs[$tag] = ['type' => 'product_tags'];
                }
            }
            $product->attribute()->sync($attrs);

            return redirect()->route('product.index',['type'=>$this->_data['type']])->with('success','Thêm dữ liệu <b>'.$product->languages[0]->title.'</b> thành công');
        }
        
    }

    public function edit($id){
        $this->_data['item'] = Product::find($id);
        if ($this->_data['item'] !== null) {
            $this->_data['suppliers'] = $this->getSupplier();
            $this->_data['categories'] = $this->getCategory($this->_data['type']);
            $this->_data['colors'] = $this->getAttribute('product_colors');
            $this->_data['sizes'] = $this->getAttribute('product_sizes');
            $this->_data['tags'] = $this->getAttribute('product_tags');
            $this->_data['images'] = $this->getMediaLibrary($this->_data['item']['attachments']);
            return view('admin.products.edit',$this->_data);
        }
        return redirect()->route('product.index',['type'=>$this->_data['type']])->with('danger', 'Dữ liệu không tồn tại');
    }

    public function update(Request $request, $id){
        // dd($request);
        $valid = Validator::make($request->all(), [
            'dataL.vi.title' => 'required',
            'data.code' => 'unique:products,code,'.$id,
            'image' => 'image|max:2048',
            'data.category_id' => 'exists:categories,id'
        ], [
            'dataL.vi.title.required'    => 'Vui lòng nhập Tên Sản Phẩm',
            'data.code.unique' => 'Mã sản phẩm đã trùng, vui lòng chọn mã khác',
            'image.image' => 'Không đúng chuẩn hình ảnh cho phép',
            'image.max' => 'Dung lượng vượt quá giới hạn cho phép là :max KB',
            'data.category_id.exists' => 'Vui lòng chọn Danh mục',
        ]);
        if ($valid->fails()) {
            return redirect()->back()->withErrors($valid)->withInput();
        } else {
            $product = Product::find($id);
            if ($product !== null) {
                if($request->data){
                	foreach($request->data as $field => $value){
                        $product->$field = $value;
                    }
                }

                if($request->hasFile('image')){
                    delete_image( $this->_data['path'].'/'.$product->image, $this->_data['thumbs'] );
                    $product->image = save_image( $this->_data['path'], $request->file('image'), $this->_data['thumbs'] );
                }

                $fileuploader = json_decode($request->input('fileuploader-list-files'),true);
                $media_list_id = [];
                
                if($request->media){
                    foreach($request->media['id'] as $key => $media_id){
                        $media = MediaLibrary::find($media_id);
                        if( isset($fileuploader[$key]['editor']) ){
                            $newImg = Image::make( public_path($this->_data['path'].'/'. $media->image) );
                            if( @$fileuploader[$key]['editor']['rotation'] ){
                                $rotation = -(int)$fileuploader[$key]['editor']['rotation'];
                                $newImg->rotate($rotation);
                            }
                            if( @$fileuploader[$key]['editor']['crop'] ){
                                $width = round($fileuploader[$key]['editor']['crop']['width']);
                                $height = round($fileuploader[$key]['editor']['crop']['height']);
                                $left = round($fileuploader[$key]['editor']['crop']['left']);
                                $top = round($fileuploader[$key]['editor']['crop']['top']);
                                $newImg->crop($width,$height,$left,$top);
                            }
                            $newImg->save( public_path($this->_data['path'].'/'. $media->image) );
                            $media->editor = $fileuploader[$key]['editor'];
                            
                        }
                        $media->priority = $request->media['priority'][$key];
                        $media->save();
                        $media_list_id[] = $media_id;
                        unset($fileuploader[$key]);
                    }
                    $fileuploader = array_values($fileuploader);
                }

                if($request->hasFile('files')){
                    
                    foreach($request->file('files') as $file){
                        $fileName  = $file->getClientOriginalName();
                        if( false !== $key = array_search($fileName, $request->attachment['name']) ){

                            $fileMime  = $file->getClientMimeType();
                            $fileSize      = $file->getClientSize();
                            $imageName = save_image( $this->_data['path'],$file, null);

                            if( isset($fileuploader[$key]['editor']) ){
                                $newImg  = Image::make( public_path($this->_data['path'].'/'.$imageName) );
                                if( @$fileuploader[$key]['editor']['rotation'] ){
                                    $rotation = -(int)$fileuploader[$key]['editor']['rotation'];
                                    $newImg->rotate($rotation);
                                }
                                if( @$fileuploader[$key]['editor']['crop'] ){
                                    $width  = round($fileuploader[$key]['editor']['crop']['width']);
                                    $height = round($fileuploader[$key]['editor']['crop']['height']);
                                    $left   = round($fileuploader[$key]['editor']['crop']['left']);
                                    $top    = round($fileuploader[$key]['editor']['crop']['top']);
                                    $newImg->crop($width,$height,$left,$top);
                                }
                                $newImg->save( public_path($this->_data['path'].'/'.$imageName) );
                            }

                            $media = MediaLibrary::create([
                                'image' => $imageName,
                                'alt'   => $request->attachment['alt'][$key],
                                'editor' => isset($fileuploader[$key]['editor']) ? $fileuploader[$key]['editor'] : '',
                                'mime_type' => $fileMime,
                                'type' => $this->_data['type'],
                                'size' => $fileSize,
                                'priority'   => $request->attachment['priority'][$key],
                            ]);
                            $media_list_id[] = $media->id;
                            unset($fileuploader[$key]);
                        }
                    }
                    
                }

                $product->attachments    = implode(',',$media_list_id);
                $product->original_price = (int)str_replace('.', '', $request->original_price);
                $product->regular_price  = (int)str_replace('.', '', $request->regular_price);
                $product->sale_price     = (int)str_replace('.', '', $request->sale_price);
                $product->weight         = (int)str_replace('.', '', $request->weight);
                
                $product->priority       = (int)str_replace('.', '', $request->priority);
                $product->status         = ($request->status) ? implode(',',$request->status) : '';
                $product->type           = $this->_data['type'];
                $product->updated_at     = new DateTime();
                $product->save();
                $i = 0;
                foreach($this->_data['languages'] as $lang => $val){
                    $productLang = ProductLanguage::find($product->languages[$i]['id']);
                    if($request->dataL[$lang]){
                        foreach($request->dataL[$lang] as $fieldL => $valueL){
                            $productLang->$fieldL = $valueL;
                        }
                    }
                    if( !isset($request->dataL[$this->_data['default_language']]['slug']) || $request->dataL[$this->_data['default_language']]['slug'] == '' ){
                        $productLang->slug       = str_slug($request->dataL[$this->_data['default_language']]['title']);
                    }else{
                        $productLang->slug       = str_slug($request->dataL[$this->_data['default_language']]['slug']);
                    }
                    $productLang->attributes = $request->input('attributes.'.$lang);
                    $productLang->language   = $lang;
                    $productLang->save();
                    $i++;
                }
                $attrs = [];
                // Add Colors
                if ($request->has('colors') && is_array($request->colors) && count($request->colors) > 0) {
                    foreach ($request->colors as $color) {
                        $attrs[$color] = ['type' => 'product_colors'];
                    }
                }

                // Add Sizes
                if ($request->has('sizes') && is_array($request->sizes) && count($request->sizes) > 0) {
                    foreach ($request->sizes as $size) {
                        $attrs[$size] = ['type' => 'product_sizes'];
                    }
                }

                // Add Tags
                if ($request->has('tags') && is_array($request->tags) && count($request->tags) > 0) {
                    foreach ($request->tags as $tag) {
                        $attrs[$tag] = ['type' => 'product_tags'];
                    }
                }
                $product->attribute()->sync($attrs);
                
            
                return redirect( $request->redirects_to )->with('success','Cập nhật dữ liệu <b>'.$product->languages[0]->title.'</b> thành công');
            }
            return redirect( $request->redirects_to )->with('danger', 'Dữ liệu không tồn tại');
        }
    }

    public function delete($id){
    	$product = Product::find($id);
        $deleted = $product->languages[0]->title;
        if ($product !== null) {
            delete_image($this->_data['path'].'/'.$product->image,$this->_data['thumbs']);
            if( $product->attachments ){
                $arrID = explode(',',$product->attachments);
                $medias = MediaLibrary::select('*')->whereIn('id',$arrID)->get();
                if( $medias !== null ){
                    foreach( $medias as $media ){
                        delete_image($this->_data['path'].'/'.$media->image,$this->_data['thumbs']);
                    }
                    MediaLibrary::destroy($arrID);
                }
            }
            if( $product->delete() ){
                return redirect()->route('product.index',['type'=>$this->_data['type']])->with('success', 'Xóa dữ liệu <b>'.$deleted.'</b> thành công');
            }else{
                return redirect()->route('product.index',['type'=>$this->_data['type']])->with('danger', 'Xóa dữ liệu bị lỗi');
            }
        }
        return redirect()->route('product.index',['type'=>$this->_data['type']])->with('danger', 'Dữ liệu không tồn tại');
    }

    public function getSupplier($type='default'){
        return DB::table('suppliers')
            ->where('type',$type)
            ->orderBy('priority','asc')
            ->orderBy('id','desc')
            ->get();
    }

    public function getCategory($type){
        return DB::table('categories as A')
            ->leftjoin('category_languages as B', 'A.id','=','B.category_id')
            ->select('A.id', 'A.parent', 'B.title')
            ->whereRaw('(A.type = \''.$type.'\' or A.type = \'default\')')
            ->where('B.language', $this->_data['default_language'])
            ->orderBy('A.priority','asc')
            ->orderBy('A.id','desc')
            ->get();
    }

    public function getAttribute($type){
        return DB::table('attributes as A')
            ->leftjoin('attribute_languages as B', 'A.id','=','B.attribute_id')
            ->select('A.*','B.title')
            ->where('A.type',$type)
            ->where('B.language', $this->_data['default_language'])
            ->orderBy('A.priority','asc')
            ->orderBy('A.id','desc')
            ->get();
    }

    public function getMediaLibrary($attachments){
        $arrID = explode(',',$attachments);
        return MediaLibrary::select('*')->whereIn('id',$arrID)->orderBy('priority','asc')->orderBy('id','desc')->get();
    }
}
