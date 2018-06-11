<?php
	//Kiem tra domain co thuoc quyen quan ly qua dai ly khong
	include 'api_config.php';
	$struct = array(
			'cmd' 			=> 'check_domain',//Lệnh kiểm tra domain
			'username'		=> USERNAME,//Username đại lý
			'apikey'		=> API_KEY,//API KEY
			'domain' 		=> 'abc.com',//domain cần kiểm tra(Bao gồm cả phần tên domain và phần mở rộng)
			'responsetype'	=> 'json'//Dữ liệu trả về kiểu json, nếu để rỗng thì trả về kiểu plan text
	);
	//Mã hoá url trước khi gọi link thực thi
	$param = '';
	foreach($struct as $k=>$v) $param .= $k.'='.urlencode($v).'&';
	
	$result = file_get_contents(API_URL."?$param");//Gọi link thực thi
	$result = json_decode($result);
	if($result->{'ReturnCode'} == 1)//Domain thuộc quyền quản lý của bạn
	{
		//Xử lý trường hợp domain con han va thuong quyen quan ly cua minh
		//...
		//Xem toàn bộ thông tin trả về
		echo "<pre>".print_r($result,true)."</pre>";
	}
	elseif($result->{'ReturnCode'} == 2)//Domain đã quá hạn
	{
		//Xử lý trường hợp domain da qua han khong the gia han duoc nua
		//...
		//Xem toàn bộ thông tin trả về
		echo "<pre>".print_r($result,true)."</pre>";
	}
	else//Domain không tồn tại trong hệ thống
	{
		//Xử lý trường hợp domain không tồn tại trong hệ thống
		//...
		//Xem toàn bộ thông tin trả về
		echo "<pre>".print_r($result,true)."</pre>";
	}
?>