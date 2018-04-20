<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Setting;
use App\Category;
use App\CategoryLanguage;
use App\Product;
use App\ProductLanguage;
use App\Post;
use App\PostLanguage;
use App\Photo;
use App\PhotoLanguage;
use App\MediaLibrary;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
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

    public function index(){
        $this->_data['new_products'] = DB::table('products as A')
            ->leftjoin('product_languages as B', 'A.id', '=', 'B.product_id')
            ->select('A.id','A.code','A.regular_price','A.sale_price','A.link','A.image','A.alt','A.category_id','A.user_id', 'B.title', 'B.slug')
            ->where('B.language',$this->_data['lang'])
            ->whereRaw('FIND_IN_SET(\'publish\',A.status) AND FIND_IN_SET(\'new\',A.status)')
            ->where('A.type','san-pham')
            ->orderBy('A.priority','asc')
            ->orderBy('A.id','desc')
            ->limit(8)
            ->get();

        $this->_data['customers'] = DB::table('posts as A')
            ->leftjoin('post_languages as B', 'A.id', '=', 'B.post_id')
            ->select('A.id','A.link','A.image','A.alt','B.title','B.description')
            ->where('B.language',$this->_data['lang'])
            ->whereRaw('FIND_IN_SET(\'publish\',A.status) and FIND_IN_SET(\'index\',A.status)')
            ->where('A.type','khach-hang')
            ->orderBy('A.priority','asc')
            ->orderBy('A.id','desc')
            ->limit(5)
            ->get();

        $this->_data['new_posts'] = DB::table('posts as A')
            ->leftjoin('post_languages as B', 'A.id', '=', 'B.post_id')
            ->select('A.id','A.link','A.image','A.alt','A.updated_at','B.title','B.slug','B.description')
            ->where('B.language',$this->_data['lang'])
            ->whereRaw('FIND_IN_SET(\'publish\',A.status) and FIND_IN_SET(\'new\',A.status)')
            ->where('A.type','tin-tuc')
            ->orderBy('A.priority','asc')
            ->orderBy('A.id','desc')
            ->limit(3)
            ->get();

        return view('frontend.default.index', $this->_data);
    }

    public function contact(){
        $this->_data['page_title'] = "Liên hệ";
        $this->_data['breadcrumb'] = '<li> <a href="'.url('/').'"> Trang chủ </a> </li>';
        $this->_data['breadcrumb'] .= '<li> <a href="'.url('/lien-he').'"> '.$this->_data['page_title'].' </a> </li>';
        return view('frontend.default.contact',$this->_data);
    }

    public function search(Request $request){
        $this->_data['page_title'] = "Tìm kiếm";
        $this->_data['breadcrumb'] = '<li> <a href="'.url('/').'"> Trang chủ </a> </li>';
        $this->_data['breadcrumb'] .= '<li> <a href="'.url('/tim-kiem').'"> '.$this->_data['page_title'].' </a> </li>';

        $this->_data['type'] = 'san-pham';
        $this->_data['keyword'] = $request->keyword;

        $this->_data['products'] = DB::table('products as A')
            ->leftjoin('product_languages as B', 'A.id', '=', 'B.product_id')
            ->select('A.id','A.code','A.regular_price','A.sale_price','A.link','A.image','A.alt','A.category_id','A.user_id', 'B.title', 'B.slug')
            ->where('B.language',$this->_data['lang'])
            ->where('B.title','like','%'.$this->_data['keyword'].'%')
            ->whereRaw('FIND_IN_SET(\'publish\',A.status)')
            ->where('A.type','san-pham')
            ->orderBy('A.priority','asc')
            ->orderBy('A.id','desc')
            ->paginate(15);
        $this->_data['products']->withPath( route('home.search', ['keyword'=>$this->_data['keyword']]) );
        return view('frontend.default.products',$this->_data);
    }

    public function category($type,$slug){
        $this->_data['category'] = DB::table('categories as A')
            ->leftjoin('category_languages as B', 'A.id','=','B.category_id')
            ->select('A.*', 'B.title', 'B.slug', 'B.meta_seo')
            ->where('B.language', $this->_data['lang'])
            ->where('B.slug',$slug)
            ->whereRaw('FIND_IN_SET(\'publish\',A.status)')
            ->where('A.type',$type)
            ->first();

        if( $this->_data['category'] ){
            $category_id = $this->_data['category']->id;

            $this->_data['breadcrumb'] .= '<li class="active"> '.$this->_data['category']->title.' </li>';
            if($this->_data['template'] == 'product'){
                $this->_data['products'] = DB::table('products as A')
                    ->leftjoin('product_languages as B', 'A.id', '=', 'B.product_id')
                    ->select('A.id','A.code','A.regular_price','A.sale_price','A.link','A.image','A.alt','A.category_id','A.user_id', 'B.title', 'B.slug')
                    ->where('B.language',$this->_data['lang'])
                    ->whereRaw('FIND_IN_SET(\'publish\',A.status)')
                    ->where('A.category_id',$category_id)
                    ->where('A.type',$type)
                    ->orderBy('A.priority','asc')
                    ->orderBy('A.id','desc')
                    ->paginate(15);
                return view('frontend.default.products',$this->_data);
            }elseif($this->_data['template'] == 'post'){
                $this->_data['posts'] = DB::table('posts as A')
                    ->leftjoin('post_languages as B', 'A.id', '=', 'B.post_id')
                    ->select('A.id','A.link','A.image','A.alt','A.updated_at','B.title','B.slug','B.description')
                    ->where('B.language',$this->_data['lang'])
                    ->whereRaw('FIND_IN_SET(\'publish\',A.status)')
                    ->where('A.category_id',$category_id)
                    ->where('A.type',$type)
                    ->orderBy('A.priority','asc')
                    ->orderBy('A.id','desc')
                    ->paginate(10);
                return view('frontend.default.posts',$this->_data);
            }
        }
        return redirect()->route('home.index');
    }

    public function archive($type){

        if($this->_data['template'] == 'product'){
            $this->_data['products'] = DB::table('products as A')
                ->leftjoin('product_languages as B', 'A.id', '=', 'B.product_id')
                ->select('A.id','A.code','A.regular_price','A.sale_price','A.link','A.image','A.alt','A.category_id','A.user_id', 'B.title', 'B.slug')
                ->where('B.language',$this->_data['lang'])
                ->whereRaw('FIND_IN_SET(\'publish\',A.status)')
                ->where('A.type',$type)
                ->orderBy('A.priority','asc')
                ->orderBy('A.id','desc')
                ->paginate(15);
            return view('frontend.default.products',$this->_data);
        }elseif($this->_data['template'] == 'post'){
            $this->_data['posts'] = DB::table('posts as A')
                ->leftjoin('post_languages as B', 'A.id', '=', 'B.post_id')
                ->select('A.id','A.link','A.image','A.alt','A.updated_at','B.title','B.slug','B.description')
                ->where('B.language',$this->_data['lang'])
                ->whereRaw('FIND_IN_SET(\'publish\',A.status)')
                ->where('A.type',$type)
                ->orderBy('A.priority','asc')
                ->orderBy('A.id','desc')
                ->paginate(10);
            return view('frontend.default.posts',$this->_data);
        }elseif($this->_data['template'] == 'single'){
            $this->_data['single'] = get_single($type);
            return view('frontend.default.single',$this->_data);
        }
        return redirect()->route('home.index');
    }

    public function single($type,$slug){
        if($this->_data['template'] == 'product'){
            $this->_data['product'] = DB::table('products as A')
                ->leftjoin('product_languages as B', 'A.id', '=', 'B.product_id')
                ->select('A.*','B.title','B.description','B.contents','B.attributes','B.meta_seo')
                ->where('B.language',$this->_data['lang'])
                ->where('B.slug',$slug)
                ->whereRaw('FIND_IN_SET(\'publish\',A.status)')
                ->where('A.type',$type)
                ->first();
            if( $this->_data['product'] ){
                DB::table('products')->where('id',$this->_data['product']->id)->increment('viewed',1);

                $this->_data['images'] = get_media($this->_data['product']->attachments);
                $this->_data['attributes'] = json_decode($this->_data['product']->attributes,true);
                $this->_data['product_colors'] = get_attributes('product_colors');

                $this->_data['products'] = DB::table('products as A')
                    ->leftjoin('product_languages as B', 'A.id', '=', 'B.product_id')
                    ->select('A.id','A.code','A.regular_price','A.sale_price','A.link','A.image','A.alt','A.category_id','A.user_id', 'B.title', 'B.slug')
                    ->where('B.language',$this->_data['lang'])
                    ->whereRaw('FIND_IN_SET(\'publish\',A.status)')
                    ->where('A.id','!=',$this->_data['product']->id)
                    ->where('A.category_id',$this->_data['product']->category_id)
                    ->where('A.type',$type)
                    ->orderBy('A.priority','asc')
                    ->orderBy('A.id','desc')
                    ->limit(15)
                    ->get();

                $this->_data['comments'] = DB::table('comments')->where('product_id',$this->_data['product']->id)->get();
                return view('frontend.default.single-product',$this->_data);
            }
        }elseif($this->_data['template'] == 'post'){
            $this->_data['post'] = DB::table('posts as A')
                ->leftjoin('post_languages as B', 'A.id', '=', 'B.post_id')
                ->select('A.*','B.title','B.description','B.contents','B.meta_seo')
                ->where('B.language',$this->_data['lang'])
                ->where('B.slug',$slug)
                ->whereRaw('FIND_IN_SET(\'publish\',A.status)')
                ->where('A.type',$type)
                ->first();
            if( $this->_data['post'] ){
                DB::table('posts')->where('id',$this->_data['post']->id)->increment('viewed',1);

                $this->_data['author'] = User::find( $this->_data['post']->user_id )->first()->name;
                $this->_data['category'] = CategoryLanguage::where('language',$this->_data['lang'])
                    ->where('category_id',$this->_data['post']->category_id )->first()->title;

                $this->_data['posts'] = DB::table('posts as A')
                    ->leftjoin('post_languages as B', 'A.id', '=', 'B.post_id')
                    ->select('A.id','A.link','A.image','A.alt','A.updated_at','B.title','B.slug','B.description')
                    ->where('B.language',$this->_data['lang'])
                    ->whereRaw('FIND_IN_SET(\'publish\',A.status)')
                    ->where('A.id','!=',$this->_data['post']->id)
                    ->where('A.category_id',$this->_data['post']->category_id)
                    ->where('A.type',$type)
                    ->orderBy('A.priority','asc')
                    ->orderBy('A.id','desc')
                    ->limit(15)
                    ->get();

                $this->_data['comments'] = DB::table('comments')->where('post_id',$this->_data['post']->id)->get();
                return view('frontend.default.single-post',$this->_data);
            }
        }

        return redirect()->route('home.index');
    }
    
}
