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
    private $_ext = [
        'vn'        =>  750000,
        'com'       =>  220000,
        'com.vn'    =>  630000,
        'net'       =>  310000,
        'net.vn'    =>  630000,
        'edu.vn'    =>  350000,
        'org'       =>  340000,
        'org.vn'    =>  400000,
        'info'      =>  340000,
        'info.vn'   =>  400000,
        'xyz'       =>  275000,
        'asia'      =>  316000,
        'top'       =>  250000,
        'online'    =>  735000,
        'company'   =>  180000,
        'store'     =>  1175000,
        'gift'      =>  410000,
        'name'      =>  340000,
        'tech'      =>  1040000,
        'space'     =>  203000,
    ];

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
        $this->_data['domain_search'] = [];
        $this->_data['domain_result'] = '';
        $valid = Validator::make($request->all(), [
            'domain' => 'required'
        ], [
            'domain.required' => __('validation.required', ['attribute'=>'Domain'])
        ]);

        if ($valid->fails()) {
            return view('frontend.default.domain',$this->_data)->withErrors($valid);
        }else{
            $domain = explode('.',$request->domain);
            $domain = $domain[0];
            foreach($this->_ext as $ext => $price){
            	$this->_data['domain_search'][] = $domain.".".$ext;
            	$this->_data['domain_result'] .= "<div class='note' data-domain='$domain.$ext'> <a href='http://$domain.$ext' target='_blank' class='btn'>$domain.$ext</a> <button class='btn btn-buy-domain float-right min-width-120' data-ajax='domain=$domain.$ext|price=$price'> <i class='fa fa-spinner fa-pulse'></i> </button> <span class='btn cursor-default float-right'>".get_currency_vn($price)."</span> </div>";
            }
        }
        return view('frontend.default.domain',$this->_data);
    }
}
