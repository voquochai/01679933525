<?php
	//ĐĂNG KÝ DOMAIN QUỐC TẾ
	include 'api_config.php';
	$struct = array(
			'cmd' 				=> 'register_domain_quocte',//Lệnh đăng ký domain Quốc tế			
			'username'			=> USERNAME,//Username đại lý
			'apikey'			=> API_KEY,//API KEY
			'domainName' 		=> 'abc',//Tên domain(Chỉ nhập phần tên, không nhập phần đuôi.Ví dụ: abc.com thì chỉ nhập abc)
			'domainExt' 		=> 'com',//Nhập phần đuôi của domain
			'domainYear' 		=> '1',//Số năm đăng ký
			'passwordDomain'	=> '1a2b3c4d5e',//Password domain phải có độ dài từ 8 đến 15 ký tự (phải bao gồm cả số và chữ)
			
			/* NAMESERVER */
			'domainDNS1' 		=> 'ns1.pavietnam.vn',//Tên DNS Primary
			'domainDNS2' 		=> 'ns2.pavietnam.vn',//Tên DNS Secondary
			
			/* THÔNG TIN KHÁCH HÀNG(Thông tin dùng để tạo mã support PA-xxx) */			
			'ownerName'			=> 'Ông Nguyễn Văn A',//Tên cá nhân hoặc công ty
			'ownerID_Number'	=> '217159852',//Chứng minh nhân dân: bắt buộc đối với cá nhân
			'ownerTaxCode'		=> '0314785258',//Mã số thuế: bắt buộc đối với công ty
			'ownerAddress'		=> '254A Nguyễn Đình Chiểu, Phường 6, Quận 3, TP HCM',//Địa chỉ liên hệ
			'ownerEmail1'		=> 'email1@gmail.com',//Email chính của khách hàng
			'ownerEmail2'		=> 'email2@gmail.com',//Email phụ của khách hàng
			'ownerPhone'		=> '0987654321',//Điện thoại di động
			'ownerPhone2' 		=> '0831111111',//Điện thoại bàn 
			'ownerFax'			=> '0831111112',//Fax
			
			/* THÔNG TIN CHỦ THỂ (Thông tin này sẽ được hiện thị khi whois dịch vụ)*/
			'uiName' 			=> 'Ông Nguyễn Quốc Tuấn',//Tên chủ thể (Cá nhân hoặc công ty)
			'uiID_Number'		=> '217259851',//Chứng minh nhân dân,Hộ chiếu, hoặc tên giao dịch quốc tế
			'uiAddress' 		=> '100 Bàu Tre, Bình An, Long Thành, Đồng Nai',//Địa chỉ chủ thể
			'uiProvince' 		=> 'Đồng Nai',//Tỉnh thành(Chú ý: Nhập đúng theo file "Tinh thanh pho Viet Nam.xls")
			'uiCountry' 		=> 'Viet Nam',//Quốc gia(Chú ý: Nhập đúng theo file "Quoc gia ISO3166.xls")
			'uiEmail' 			=> 'testapipa@gmail.com',//Email chủ thể
			'uiPhone' 			=> '0901111111',//Điện thoại chủ thể
			'uiFax' 			=> '0613111112',//Fax chủ thể
			'uiTaxCode'			=> '0314785299',//Mã số thuế của chủ thể
			
			'sendmail'			=> '1',//Gửi mail thông báo đến khách hàng: (1: Có gửi, 2: Không gửi)
			'responsetype'		=> 'json'//Dữ liệu trả về kiểu json
	);
	//Mã hoá url trước khi gọi link thực thi
	$param = '';
	foreach($struct as $k=>$v) $param .= $k.'='.urlencode($v).'&';
	
	$result = file_get_contents(API_URL."?$param");//Gọi link đăng ký
	$result = json_decode($result);
	if($result->{'ReturnCode'} == 200)//Thành công
	{
		//Xử lý trường hợp đăng ký domain thành công
		//...
		//Xem toàn bộ thông tin trả về
		echo "<pre>".print_r($result,true)."</pre>";
	}
	else//Thất bại
	{
		//Xử lý trường hợp đăng ký domain thất bại
		//...
		//Xem toàn bộ thông tin trả về
		echo "<pre>".print_r($result,true)."</pre>";
	}
?>