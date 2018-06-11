<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\DB;

class DomainController extends Controller
{
    //

    private $_data;
    private $_username = 'htglobal';
    private $_api_key = 'd54f6146b9f16e2f7686657adbc186a4';
    private $_api_url = 'https://daily.pavietnam.vn/interface.php';

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
        $struct = array(
            'cmd'           => 'check_whois',//Lệnh kiểm tra domain
            'username'      => $this->_username,//Username đại lý
            'apikey'        => $this->_api_key,//API KEY
            'domain'        => 'khowebonline.com'//domain cần kiểm tra(Bao gồm cả phần tên domain và phần mở rộng)
        );
        //Mã hoá url trước khi gọi link thực thi
        $param = '';
        foreach($struct as $k=>$v) $param .= $k.'='.urlencode($v).'&';
        
        $result = file_get_contents($this->_api_url."?$param");//Gọi link thực thi
        if($result == '0')//Tên miền đã được đăng ký
        {
            echo "Tên miền <a href='http://".$struct['domain']."' target='_blank'>".$struct['domain']."</a> đã đuợc đăng ký<br>";
            // Hien thi thong tin whois 
            echo "<strong>Thông tin whois</strong>";
            echo "<div style='border:1px solid #ccc'>";
            echo file_get_contents($this->_api_url."?username=".$this->_username."&apikey=".$this->_api_key."&cmd=get_whois&domain=".$struct['domain']);
            echo "</div>";  
        }
        elseif($result == '1')//Tên miền chưa đăng ký
        {
            echo "Tên miền <strong>".$struct['domain']."</strong> chưa đăng ký<br>";
        }
        else//Các trường hợp lỗi
        {
            echo "<span style='color:#F00'>$result</span>";
        }
    }
}
