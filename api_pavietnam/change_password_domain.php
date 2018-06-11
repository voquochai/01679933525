<?php
	//THAY ĐỔI PASSWORD DOMAIN VIỆT NAM + DOMAIN QUỐC TẾ
	include 'api_config.php';
	$struct = array(
			'cmd' 				=> 'change_password_domain',//Lệnh thay đổi mật khẩu domain
			'username'			=> USERNAME,//Username đại lý
			'apikey'			=> API_KEY,//API KEY
			'domain' 			=> 'abc.vn',//domain cần thay đổi password(Bao gồm cả phần tên domain và phần mở rộng)
			'passwordDomain'	=> '11aa22bb33cc',//Độ dài password từ 8 đến 15 ký tự (phải bao gồm cả số và chữ)
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