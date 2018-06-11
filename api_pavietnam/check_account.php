<?php
	/*
		KIỂM TRA SỐ TIỀN TRONG TÀI KHOẢN
		- Xem tài khoản còn lại: cmd truyen vào check_account_still
		- Kiểm tra tổng nạp: cmd truyen vào check_account_total
	*/
	include 'api_config.php';
	$struct = array(
			'cmd' 			=> 'check_account_still',//(check_account_still: Xem tài khoản còn lại, check_account_total: Kiểm tra tổng nạp)
			'username'		=> USERNAME,//Username đại lý
			'apikey'		=> API_KEY,//API KEY
			'responsetype'	=> 'json'//Dữ liệu trả về kiểu json, nếu để rỗng thì trả về kiểu plan text
	);
	//Mã hoá url trước khi gọi link thực thi
	$param = '';
	foreach($struct as $k=>$v) $param .= $k.'='.urlencode($v).'&';
	
	$result = file_get_contents(API_URL."?$param");//Gọi link thực thi
	$result = json_decode($result);
	if(!empty($result->{'Money'}))//Thành công
	{
		//Xử lý trường hợp thành công
		echo "<pre>".print_r($result,true)."</pre>";
	}
	else//Thất bại
	{
		//Xử lý trường hợp thất bại
		echo "<pre>".print_r($result,true)."</pre>";
	}
?>