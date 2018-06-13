<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class DomainController extends Controller
{
    //

    private $_data;
    private $_username = 'htglobal';
    private $_api_key = 'd54f6146b9f16e2f7686657adbc186a4';
    private $_api_url = 'https://daily.pavietnam.vn/interface.php';
    private $_ext = ['vn','com','com.vn','net','org','info','xyz','asia','top','online'];

    public function __construct(Request $request){
        $this->_data = set_type($request->type);
        $this->middleware(function($request,$next){
            $this->_data['lang'] = (session('lang')) ? session('lang') : config('settings.language');
            App::setLocale($this->_data['lang']);
            $this->_data['meta_seo'] = set_meta_tags('',$this->_data['lang']);
            View::share('siteconfig', config('siteconfig'));

            $cart = is_array($cart = json_decode($request->cookie('cart'), true)) ? $cart : [];
            if (count($cart) > 0) {
                $this->_data['countCart'] = count($cart);
            }else{
                $this->_data['countCart'] = 0;
            }
            return $next($request);
        });
    }

    public function checkWhoIs(Request $request){

        $this->_data['page_title'] = 'Kiểm tra tên miền';
        $this->_data['breadcrumb'] = '<li> <a href="'.url('/').'">'.__('site.home').'</a> </li>';
        $this->_data['breadcrumb'] .= '<li> <a href="'.url('/lien-he').'"> '.$this->_data['page_title'].' </a> </li>';
        $this->_data['check_who_is'] = [];
        $valid = Validator::make($request->all(), [
            'domain' => 'required'
        ], [
            'domain.required' => __('validation.required', ['attribute'=>'Domain'])
        ]);

        if ($valid->fails()) {
            return view('frontend.default.domain',$this->_data)->withErrors($valid);
        }else{
            $domain = $request->domain;
            foreach($this->_ext as $ext){
                $result = file_get_contents($this->_api_url."?username=".$this->_username."&apikey=".$this->_api_key."&cmd=check_whois&domain=".$domain.".".$ext);
                if($result == '0'){
                    $this->_data['check_who_is'][] = "Tên miền <a href='http://$domain.$ext' target='_blank'>$domain.$ext</a> đã đuợc đăng ký<br>";
                }elseif($result == '1'){
                    $this->_data['check_who_is'][] = "Tên miền <strong>$domain.$ext</strong> chưa đăng ký<br>";
                }else{
                    $this->_data['check_who_is'][] = "<span style='color:#F00'>$result</span>";
                }
            }
        }
        return view('frontend.default.domain',$this->_data);
    }
}
