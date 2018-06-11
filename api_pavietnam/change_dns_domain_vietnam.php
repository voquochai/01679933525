<?php
	//THAY ĐỔI DNS DOMAIN VIỆT NAM
	include 'api_config.php';
	$struct = array(
			'cmd' 				=> 'change_dns_domain_vietnam',//Lệnh thay đổi DNS
			'username'			=> USERNAME,//Username đại lý
			'apikey'			=> API_KEY,//API KEY
			'domain' 			=> 'abc.vn',//domain cần thay đổi DNS
			'domainDNS1' 		=> 'ns1.pavietnam.vn',//Tên DNS Primary
			'domainIP1' 		=> '112.213.89.3',//Địa chỉ IP Primary
			'domainDNS2' 		=> 'ns2.pavietnam.vn',//Tên DNS Secondary 1
			'domainIP2' 		=> '222.255.89.247',//Địa chỉ IP Secondary 1
			'domainDNS3' 		=> '',//Tên DNS Secondary 2
			'domainIP3' 		=> '',//Địa chỉ IP Secondary 2
			'responsetype'		=> 'json'//Dữ liệu trả về kiểu json, nếu để rỗng thì trả về kiểu plan text
	);
	
	//Mã hoá url trước khi gọi link thực thi
	$param = '';
	foreach($struct as $k=>$v) $param .= $k.'='.urlencode($v).'&';
	
	$result = file_get_contents(API_URL."?$param");//Gọi link thực thi
	$result = json_decode($result);
	if($result->{'ReturnCode'} == 200)//Thành công
	{
		//Xử lý trường hợp đổi DNS thành công
		//...
		//Xem toàn bộ thông tin trả về
		echo "<pre>".print_r($result,true)."</pre>";
	}
	else//Thất bại
	{
		//Xử lý trường hợp đổi DNS thất bại
		//...
		//Xem toàn bộ thông tin trả về
		echo "<pre>".print_r($result,true)."</pre>";
	}
?>