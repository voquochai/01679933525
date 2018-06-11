<?php
	//THAY ĐỔI PASSWORD HOSTING
	include 'api_config.php';
	$struct = array(
			'cmd' 				=> 'change_password_hosting',//Lệnh thay đổi password hosting
			'username'			=> USERNAME,//Username đại lý
			'apikey'			=> API_KEY,//API KEY
			'domain' 			=> 'hosting.com',//tên domain của dịch vụ hosting cần thay đổi password(Bao gồm cả phần tên domain và phần mở rộng)
			'pwd'				=> 'HMPT7569bmwv',//Password từ 8 đến 16 ký tự và phải bao gồm các ký tự chữ Hoa (A-Z), chữ Thường (a-z) và Số (0-9)
			'responsetype'		=> 'json'//Dữ liệu trả về kiểu json, nếu để rỗng thì trả về kiểu plan text
	);
	//Mã hoá url trước khi gọi link thực thi
	$param = '';
	foreach($struct as $k=>$v) $param .= $k.'='.urlencode($v).'&';
	$result = file_get_contents(API_URL."?$param");//Gọi link thực thi
	$result = json_decode($result);
	if($result->{'ReturnCode'} == 200)//Thành công
	{
		//Xử lý trường hợp đổi password thành công
		//...
		//Xem toàn bộ thông tin trả về
		echo "<pre>".print_r($result,true)."</pre>";
	}
	else//Thất bại
	{
		//Xử lý trường hợp đổi password thất bại
		//...
		//Xem toàn bộ thông tin trả về
		echo "<pre>".print_r($result,true)."</pre>";
	}
?>