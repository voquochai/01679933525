<?php
	//LẤY NGÀY ĐĂNG KÝ VÀ NGÀY HẾT HẠN CỦA DOMAIN
	include 'api_config.php';
	$struct = array(
			'cmd' 			=> 'get_date_domain',//Lệnh lấy thời gian sử dụng domain
			'username'		=> USERNAME,//Username đại lý
			'apikey'		=> API_KEY,//API KEY
			'domain' 		=> 'abc.vn',//domain cần gia hạn(Bao gồm cả phần tên domain và phần mở rộng)
			'responsetype'	=> 'json'//Dữ liệu trả về kiểu json, nếu để rỗng thì trả về kiểu plan text
	);
	//Mã hoá url trước khi gọi link thực thi
	$param = '';
	foreach($struct as $k=>$v) $param .= $k.'='.urlencode($v).'&';
	
	$result = file_get_contents(API_URL."?$param");//Gọi link thực thi
	$result = json_decode($result);
	if(!empty($result->{'Date'}))//Thành công
	{
		//Xử lý trường hợp lấy ngày thành công
		//...
		//Xem toàn bộ thông tin trả về
		echo "<pre>".print_r($result,true)."</pre>";
	}
	else//Thất bại
	{
		//Xử lý trường hợp lấy ngày thất bại
		//...
		//Xem toàn bộ thông tin trả về
		echo "<pre>".print_r($result,true)."</pre>";
	}
?>