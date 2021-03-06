<?php
namespace App\QuocHai;
use App\Setting;
use Illuminate\Support\Facades\DB;
use Intervention\Image\Facades\Image;
class ToolFactory {

    public function setMetaTags($seo='',$lang='vi'){
        $setting = new Setting();
        $index = get_single('index',$lang);

        $default_seo = json_decode(@$index->meta_seo);
        $seodata['title'] = @$default_seo->title;
        $seodata['keywords'] = @$default_seo->keywords;
        $seodata['description'] = @$default_seo->description;
        $seodata['image'] = asset('public/uploads/photo/'.$setting->getValueByName('logo'));

        if(@$seo->title){
            $seodata['title'] = $seo->title;
        }
        if(@$seo->keywords){
            $seodata['keywords'] = $seo->keywords;
        }
        if(@$seo->description){
            $seodata['description'] = $seo->description;
        }

        return (object) $seodata;
    }

    public function setType($type=''){
        $data['type'] = $type;
        switch($type){
            case "san-pham":
                $data['page_title'] = "Sản phẩm";
                $data['template'] = "product";
                break;
            case "tin-tuc":
                $data['page_title'] = "Tin tức";
                $data['template'] = "post";
                break;
            case "gioi-thieu":
                $data['page_title'] = "Giới thiệu";
                $data['template'] = "single";
                break;
            case "gioi-thieu":
                $data['page_title'] = "Giới thiệu";
                $data['template'] = "single";
                break;
            default:
                $data['page_title'] = "Trang chủ";
                $data['template'] = "index";
                break;
        }
        if($type !=''){
            $data['breadcrumb'] = '<li> <a href="'.url('/').'"> Trang chủ </a> </li>';
            $data['breadcrumb'] .= '<li> <a href="'.url('/'.$type).'"> '.$data['page_title'].' </a> </li>';
        }
        return $data;
    }

    public function getThumbnail($filename, $suffix = '_small') {
        if ($filename) {
            return preg_replace("/(.*)\.(.*)/i", "$1{$suffix}.$2", $filename);
        }
        return '';
    }

    public function getCurrencyVN($number, $symbol = 'VND', $isPrefix = false) {
        if ($isPrefix) {
            return $symbol . number_format($number, 0, ',', '.');
        } else {
            return number_format($number, 0, ',', '.') . $symbol;
        }
    }

    public function saveImage($path,$image,$thumbs = ['_small' => ['width' => 300, 'height' => 200 ]]) {
        if ( !empty($image) ) {
            $folderName = date('Y-m');
            $fileName = $image->getClientOriginalName();
            $fileExtension = $image->getClientOriginalExtension();
            $fileNameSlug = str_slug( str_replace('.'.$fileExtension, '', $fileName) );

            $fileName = $fileNameSlug.'.'.$fileExtension;

            if ( !file_exists(public_path($path.'/'. $folderName)) ) {
                mkdir(public_path($path.'/'.$folderName), 0755, true);
            }

            if( file_exists(public_path($path.'/'. $folderName.'/'.$fileName)) ){
                $fileNameSlug = $fileNameSlug.'_'.time();
                $fileName = $fileNameSlug.'.'.$fileExtension;
            }
            // Di chuyển file vào folder Uploads
            $imageName = "$folderName/$fileName";
            $image->move( public_path($path.'/'.$folderName), $fileName );

            // Tạo các hình ảnh theo tỉ lệ giao diện
            $createImage = function($suffix = '_small', $width = 300, $height = 200) use($path, $folderName, $imageName, $fileNameSlug, $fileExtension) {
                $thumbnailFileName = $fileNameSlug . $suffix . '.' . $fileExtension;
                Image::make( public_path($path.'/'.$imageName) )
                    ->resize($width, $height, function ($c) {
                        $c->aspectRatio();
                        $c->upsize();
                    })
                    ->save( public_path($path.'/'.$folderName.'/'.$thumbnailFileName) )
                    ->destroy();
            };
            if($thumbs !== null){
                foreach($thumbs as $k => $v){
                    $createImage($k,$v['width'],$v['height']);
                }
            }
            return $imageName;
        }
    }

    public function deleteImage($path,$thumbs) {
        if (!is_dir(public_path($path)) && file_exists(public_path($path))) {
            unlink(public_path($path));
            $deleteAllImages = function($sizeArr) use($path) {
                foreach ($sizeArr as $size) {
                    if (!is_dir(public_path(get_thumbnail($path, $size))) && file_exists(public_path(get_thumbnail($path, $size)))) {
                        unlink(public_path(get_thumbnail($path, $size)));
                    }
                }
            };
            if($thumbs !== null)
                $deleteAllImages(array_keys($thumbs));
        }
    }

    public function getCategories($type,$lang='vi'){
        return DB::table('categories as A')
            ->leftjoin('category_languages as B', 'A.id','=','B.category_id')
            ->select('A.id', 'A.parent', 'A.icon', 'B.title', 'B.slug')
            ->where('B.language', $lang)
            ->whereRaw('FIND_IN_SET(\'publish\',A.status)')
            ->where('A.priority','>',0)
            ->where('A.type',$type)
            ->orderBy('A.priority','asc')
            ->orderBy('A.id','desc')
            ->get();
    }

    public function getPhotos($type,$lang='vi'){
        return DB::table('photos as A')
            ->leftjoin('photo_languages as B', 'A.id','=','B.photo_id' )
            ->select('A.*','B.title','B.description')
            ->where('B.language',$lang)
            ->whereRaw('FIND_IN_SET(\'publish\',A.status)')
            ->where('A.type',$type)
            ->orderBy('A.priority','asc')
            ->orderBy('A.id','desc')
            ->get();
    }

    public function getLinks($type,$lang='vi'){
        return DB::table('links as A')
            ->leftjoin('link_languages as B', 'A.id','=','B.link_id' )
            ->select('A.*','B.title','B.description')
            ->where('B.language',$lang)
            ->whereRaw('FIND_IN_SET(\'publish\',A.status)')
            ->where('A.type',$type)
            ->orderBy('A.priority','asc')
            ->orderBy('A.id','desc')
            ->get();
    }

    public function getSingle($type,$lang='vi'){
        return DB::table('single as A')
            ->leftjoin('single_languages as B', 'A.id','=','B.single_id' )
            ->select('A.*','B.title','B.description','B.contents','B.meta_seo')
            ->where('B.language',$lang)
            ->whereRaw('FIND_IN_SET(\'publish\',A.status)')
            ->where('A.type',$type)
            ->orderBy('A.priority','asc')
            ->orderBy('A.id','desc')
            ->first();
    }

    public function getAttributes($type,$lang='vi'){
        return DB::table('attributes as A')
            ->leftjoin('attribute_languages as B', 'A.id','=','B.attribute_id')
            ->select('A.*','B.title')
            ->where('B.language', $lang)
            ->where('A.type',$type)
            ->orderBy('A.priority','asc')
            ->orderBy('A.id','desc')
            ->get();
    }

    public function getMediaLibrary($attachments){
        $arrID = explode(',',$attachments);
        return DB::table('media_libraries')
            ->select('*')
            ->whereIn('id',$arrID)
            ->orderBy('priority','asc')
            ->orderBy('id','desc')
            ->get();
    }

    public function updateCode($id,$prefix){
        $strlen = strlen($id);
        if($strlen==1){ $code = $prefix."0000".$id;
        } else if($strlen==2){ $code = $prefix."000".$id;
        } else if($strlen==3){ $code = $prefix."00".$id;
        } else if($strlen==4){ $code = $prefix."0".$id;
        } else{ $code = $prefix.$id; }
        return $code;
    }

    public function getProductInWarehouses($type = 'default'){
        $items = DB::table('wms_imports')
            ->where('type',$type)
            ->orderBy('priority','asc')
            ->orderBy('id','desc')
            ->get();
        $products = [];
        if( $items !== null ){
            foreach( $items as $item ){
                $product_id    = explode(',',$item->product_id);
                $product_code  = explode(',',$item->product_code);
                $product_size  = explode(',',$item->product_size);
                $product_color = explode(',',$item->product_color);
                $product_qty   = explode(',',$item->product_qty);
                $product_price = explode(',',$item->product_price);

                foreach($product_id as $key => $id){
                    $color = $product_color[$key];
                    $size = $product_size[$key];
                    @$products[$id][$color][$size]['import'] += (int)$product_qty[$key];
                }
            }
        }

        $items = DB::table('wms_exports')
            ->where('type',$type)
            ->orderBy('priority','asc')
            ->orderBy('id','desc')
            ->get();
        if( $items !== null ){
            foreach( $items as $item ){
                $product_id    = explode(',',$item->product_id);
                $product_code  = explode(',',$item->product_code);
                $product_size  = explode(',',$item->product_size);
                $product_color = explode(',',$item->product_color);
                $product_qty   = explode(',',$item->product_qty);
                $product_price = explode(',',$item->product_price);
                foreach($product_id as $key => $id){
                    $color = $product_color[$key];
                    $size = $product_size[$key];
                    @$products[$id][$color][$size]['export'] += (int)$product_qty[$key];
                }
            }
        }

        return $products;
    }
}