<?php
namespace App\QuocHai;
use Illuminate\Support\Facades\DB;
use Intervention\Image\Facades\Image;
class ToolFactory {

    public function setMetaTags($seo='',$lang='vi'){
        $index = get_pages('index',$lang);

        $default_seo = json_decode(@$index->meta_seo);
        $seodata['title'] = @$default_seo->title;
        $seodata['keywords'] = @$default_seo->keywords;
        $seodata['description'] = @$default_seo->description;
        $seodata['image'] = asset('public/uploads/photos/'.config('settings.logo'));

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
                $data['page_title'] = __('site.product');
                $data['template'] = "product";
                break;
            case "tin-tuc":
                $data['page_title'] = __('site.news');
                $data['template'] = "post";
                break;
            case "gioi-thieu":
                $data['page_title'] = __('site.about');
                $data['template'] = "page";
                break;
            default:
                $data['page_title'] = __('site.home');
                $data['template'] = "index";
                break;
        }
        if($type !=''){
            $data['breadcrumb'] = '<li> <a href="'.url('/').'">'.__('site.home').'</a> </li>';
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

    public function getCurrencyVN($number, $symbol = 'Đ', $isPrefix = false) {
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
                if($width <= 0) $width = 300;
                if($height <= 0) $height = 200;
                Image::make(public_path($path.'/'.$imageName))
                    ->resize($width, $height, function ($c) {
                        $c->aspectRatio();
                        $c->upsize();
                    })
                    ->save( public_path($path.'/'.$folderName.'/'.$thumbnailFileName) )
                    ->destroy();
            };
            if($thumbs !== null){
                foreach($thumbs as $k => $v){
                    if( $v['width'] !== null && $v['height'] !== null ){
                        $createImage($k,$v['width'],$v['height']);
                    }
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

    public function getPosts($type,$lang='vi'){
        return DB::table('posts as A')
            ->leftjoin('post_languages as B', 'A.id','=','B.post_id' )
            ->select('A.*','B.title','B.description')
            ->where('B.language',$lang)
            ->whereRaw('FIND_IN_SET(\'publish\',A.status)')
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

    public function getPages($type,$lang='vi'){
        return DB::table('pages as A')
            ->leftjoin('page_languages as B', 'A.id','=','B.page_id' )
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
            ->select('A.*','B.title','B.slug')
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

    public function niceTime($date){
        if(empty($date)) {
            return "No date provided";
        }
        
        $periods         = array("second", "minute", "hour", "day", "week", "month", "year", "decade");
        $lengths         = array("60","60","24","7","4.35","12","10");
        
        $now             = time();
        $unix_date         = strtotime($date);
        
           // check validity of date
        if(empty($unix_date)) {    
            return "Bad date";
        }

        // is it future date or past date
        if($now > $unix_date) {    
            $difference     = $now - $unix_date;
            $tense         = "ago";
            
        } else {
            $difference     = $unix_date - $now;
            $tense         = "from now";
        }
        
        for($j = 0; $difference >= $lengths[$j] && $j < count($lengths)-1; $j++) {
            $difference /= $lengths[$j];
        }
        
        $difference = round($difference);
        
        if($difference != 1) {
            $periods[$j].= "s";
        }
        
        return "$difference $periods[$j] {$tense}";
    }

    public function getComments($data,$parent=0,$lvl=0){
        $result = '';
        if( isset($data[$parent]) ){
            if( $parent==0 ) $result .= '<ul class="comment-list">';
            else $result .= '<ul>';
            foreach($data[$parent] as $k=>$v){
                $id=$v->id;
                $result .= '<li>';
                $result .= '
                    <div class="single-comment fix" data-lvl="'.$id.'"">
                        <div class="image float-left"><img src="'.asset('noimage/50x50').'" alt="" class="img-circle"></div>
                        <div class="content fix">
                            <div class="head fix">
                                <div class="author-time">
                                    <h4>'.$v->name.'</h4>
                                    <span>'.self::niceTime($v->created_at).'</span>
                                </div>
                                '.($lvl < 1 ? '<a href="#" class="replay" data-id="'.$id.'">Replay</a>' : '').'
                            </div>
                            <p>'.$v->description.'</p>
                        </div>
                    </div>
                ';
                $result .= self::getComments($data,$id,++$lvl);
                $result .= '</li>';
            }
            $result .= '</ul>';
        }
        return $result;
    }

    public function getProductInWarehouses($type = 'default'){
        $items = DB::table('wms_imports')
            ->select('product_id','product_code','product_size','product_color','product_qty')
            ->whereRaw('FIND_IN_SET(\'publish\',status)')
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
                foreach($product_id as $key => $id){
                    $code = $product_code[$key];
                    $color = $product_color[$key];
                    $size = $product_size[$key];
                    @$products[$code] = $id;
                    @$products[$id][$color][$size]['import'] += (int)$product_qty[$key];
                }
            }
        }

        $items = DB::table('wms_exports')
            ->select('product_id','product_code','product_size','product_color','product_qty')
            ->whereRaw('FIND_IN_SET(\'publish\',status)')
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