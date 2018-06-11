<?php
    //LẤY DANH SÁCH HOSTING
	include 'api_config.php';
	$struct = array(
			'cmd' 				=> 'hosting_list',//Lệnh lấy danh sách hosting			
			'username'			=> USERNAME,//Username đại lý
			'apikey'			=> API_KEY,//API KEY
			'responsetype'		=> 'json',//Dữ liệu trả về kiểu json
			'flag'				=> 1
	);
	//Mã hoá url trước khi gọi link thực thi
	$param = '';
	foreach($struct as $k=>$v) $param .= $k.'='.urlencode($v).'&';
	$result = file_get_contents(API_URL."?$param");//Gọi link lấy danh sách hosting
	$result = json_decode($result);
	if($result->{'ReturnCode'} == 200)//Thành công
	{
		//Xử lý trường hợp lấy danh sách hosting thành công
		//...
		//Xem toàn bộ thông tin trả về
		echo "<pre>".print_r($result,true)."</pre>";
	}
	else//Thất bại
	{
		//Xử lý trường hợp lấy danh sách hosting thất bại
		//...
		//Xem toàn bộ thông tin trả về
		echo "<pre>".print_r($result,true)."</pre>";
	}
?>