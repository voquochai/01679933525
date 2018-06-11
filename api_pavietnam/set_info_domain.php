<?php
	//Cap nhat thong tin domain
	include 'api_config.php';
	$struct = array(
			'cmd' 				=> 'set_info_domain',//Cap nhat thong tin domain
			'username'			=> USERNAME,//Username đại lý
			'apikey'			=> API_KEY,//API KEY
			'domain' 			=> 'abc.com',//domain(Bao gồm cả phần tên domain và phần mở rộng)
			
			/* Thông tin chủ thể */
			'owner_name' 		=> 'Cong ty TNHH ABC',//Tên chủ thể (Giá trị '-' là không cập nhật thông tin này)
			'owner_company' 	=> 'Cong ty TNHH ABC',//Công ty chủ thể (Giá trị '-' là không cập nhật thông tin này)
			'owner_email' 		=> 'abc@gmail.com',//Email chủ thể (Giá trị '-' là không cập nhật thông tin này)
			'owner_address' 	=> '254A Nguyen Dinh Chieu, Phuong 6, Quan 3',//Địa chỉ chủ thể (Giá trị '-' là không cập nhật thông tin này)
			'owner_city' 		=> 'TP HCM',//Tỉnh thành chủ thể (Giá trị '-' là không cập nhật thông tin này)
			'owner_country' 	=> 'VN',//Quốc gia chủ thể (Giá trị '-' là không cập nhật thông tin này)
			'owner_zipcode' 	=> '700000',//Zipcode chủ thể (Giá trị '-' là không cập nhật thông tin này)
			'owner_phone' 		=> '0909999999',//Số điện thoại chủ thể (Giá trị '-' là không cập nhật thông tin này)
			'owner_fax' 		=> '0831111112',//Số fax chủ thể (Giá trị '-' là không cập nhật thông tin này)
			
			/* Thông tin người quản lý */
			'admin_name' 		=> '-',//Tên người quản lý (Giá trị '-' là không cập nhật thông tin này)
			'admin_company' 	=> '-',//Công ty người quản lý (Giá trị '-' là không cập nhật thông tin này)
			'admin_email' 		=> '-',//Email người quản lý (Giá trị '-' là không cập nhật thông tin này)
			'admin_address' 	=> '-',//Địa chỉ người quản lý (Giá trị '-' là không cập nhật thông tin này)
			'admin_city' 		=> '-',//Tỉnh thành người quản lý (Giá trị '-' là không cập nhật thông tin này)
			'admin_country' 	=> '-',//Quốc gia người quản lý (Giá trị '-' là không cập nhật thông tin này)
			'admin_zipcode' 	=> '-',//Zipcode của người quản lý (Giá trị '-' là không cập nhật thông tin này)
			'admin_phone' 		=> '-',//Số điện thoại của người quản lý (Giá trị '-' là không cập nhật thông tin này)
			'admin_fax' 		=> '-',//Số fax của người quản lý (Giá trị '-' là không cập nhật thông tin này)
			
			/* Thông tin kỹ thuật */
			'tech_name' 		=> '-',//Tên kỹ thuật (Giá trị '-' là không cập nhật thông tin này)
			'tech_company' 		=> '-',//Công ty của kỹ thuật (Giá trị '-' là không cập nhật thông tin này)
			'tech_email' 		=> '-',//Email kỹ thuật (Giá trị '-' là không cập nhật thông tin này)
			'tech_address' 		=> '-',//Địa chỉ kỹ thuật (Giá trị '-' là không cập nhật thông tin này)
			'tech_city' 		=> '-',//Tỉnh thành của kỹ thuật (Giá trị '-' là không cập nhật thông tin này)
			'tech_country' 		=> '-',//Quốc gia của kỹ thuật (Giá trị '-' là không cập nhật thông tin này)
			'tech_zipcode' 		=> '-',//Zipcode của kỹ thuật (Giá trị '-' là không cập nhật thông tin này)
			'tech_phone' 		=> '-',//Số điện thoại của kỹ thuật (Giá trị '-' là không cập nhật thông tin này)
			'tech_fax' 			=> '-',//Số fax của kỹ thuật (Giá trị '-' là không cập nhật thông tin này)
			
			/* Thông tin thanh toán */
			'billing_name' 		=> '-',//Tên người thanh toán (Giá trị '-' là không cập nhật thông tin này)
			'billing_company' 	=> '-',//Công ty của người thanh toán (Giá trị '-' là không cập nhật thông tin này)
			'billing_email' 	=> '-',//Email của người thanh toán (Giá trị '-' là không cập nhật thông tin này)
			'billing_address' 	=> '-',//Địa chỉ của người thanh toán (Giá trị '-' là không cập nhật thông tin này)
			'billing_city' 		=> '-',//Tỉnh thành của người thanh toán (Giá trị '-' là không cập nhật thông tin này)
			'billing_country' 	=> '-',//Quốc gia của người thanh toán (Giá trị '-' là không cập nhật thông tin này)
			'billing_zipcode' 	=> '-',//Zipcode của người thanh toán (Giá trị '-' là không cập nhật thông tin này)
			'billing_phone' 	=> '-',//Số điện thoại của người thanh toán (Giá trị '-' là không cập nhật thông tin này)
			'billing_fax' 		=> '-',//Số fax của người thanh toán (Giá trị '-' là không cập nhật thông tin này)
			
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