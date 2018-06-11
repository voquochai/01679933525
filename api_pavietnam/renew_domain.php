<?php
	//GIA HẠN DOMAIN VIỆT NAM + DOMAIN QUỐC TẾ
	include 'api_config.php';
	$struct = array(
			'cmd' 				=> 'renew_domain',//Lệnh gia hạn domain
			'username'			=> USERNAME,//Username đại lý
			'apikey'			=> API_KEY,//API KEY
			'domain' 			=> 'abc.vn',//domain cần gia hạn(Bao gồm cả phần tên domain và phần mở rộng)
			'year' 				=> '1',//Số năm gia hạn
			'sendmail'			=> '1',//Gửi mail thông báo đến khách hàng: (1: Có gửi, 2: Không gửi)
			'responsetype'		=> 'json'//Dữ liệu trả về kiểu json, nếu để rỗng thì trả về kiểu plan text
	);
	
	//Mã hoá url trước khi gọi link thực thi
	$param = '';
	foreach($struct as $k=>$v) $param .= $k.'='.urlencode($v).'&';
	
	$result = file_get_contents(API_URL."?$param");//Gọi link thực thi
	$result = json_decode($result);
	if($result->{'ReturnCode'} == 200)//Thành công
	{
		//Xử lý trường hợp gia hạn domain thành công
		//...
		//Xem toàn bộ thông tin trả về
		echo "<pre>".print_r($result,true)."</pre>";
	}
	else//Thất bại
	{
		//Xử lý trường hợp gia hạn domain thất bại
		//...
		//Xem toàn bộ thông tin trả về
		echo "<pre>".print_r($result,true)."</pre>";
	}
?>