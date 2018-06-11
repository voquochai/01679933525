<?php
	//ĐĂNG KÝ DOMAIN VIỆT NAM
	include 'api_config.php';
	$struct = array(
			'cmd' 				=> 'register_domain_vietnam',//Lệnh đăng ký domain
			'username'			=> USERNAME,//Username đại lý
			'apikey'			=> API_KEY,//API KEY
			'domainName' 		=> 'google',//Tên domain(Chỉ nhập phần tên, không nhập phần đuôi.Ví dụ: abc.vn thì chỉ nhập abc)
			'domainExt' 		=> 'vn',//Nhập phần đuôi của domain
			'domainYear' 		=> '1',//Số năm đăng ký
			'passwordDomain' 	=> '1a2b3c4d5e',//Password domain phải có độ dài từ 8 đến 15 ký tự (phải bao gồm cả số và chữ)
			'for' 				=> 'canhan',//Đăng ký cho cá nhân hay công ty(canhan/congty)
			'domainDNS1' 		=> 'ns1.pavietnam.vn',//Tên DNS Primary
			'domainDNS2' 		=> 'ns2.pavietnam.vn',//Tên DNS Secondary 
			'domainDNS3' 		=> 'nsbak.pavietnam.net',//Tên DNS Secondary2 
						
			/* THÔNG TIN KHÁCH HÀNG(Thông tin dùng để tạo mã support PA-xxx) */
			'ownerName'	  		=> 'Nguyễn Văn A',//Tên cá nhân hoặc công ty
			'ownerID_Number'	=> '217159852',//Chứng minh nhân dân: bắt buộc đối với cá nhân
			'ownerTaxCode'		=> '0314785258',//Mã số thuế: bắt buộc đối với công ty
			'ownerAddress'		=> '254A Nguyễn Đình Chiểu, Phường 6, Quận 3, TP HCM',//Địa chỉ liên hệ
			'ownerEmail1'		=> 'email1@gmail.com',//Email chính của khách hàng
			'ownerEmail2'		=> 'email2@gmail.com',//Email phụ của khách hàng
			'ownerPhone'		=> '0987654321',//Điện thoại di động
			'ownerPhone2' 		=> '0831111111',//Điện thoại bàn 
			'ownerFax'			=> '0831111112',//Fax
			
			/* THÔNG TIN CHỦ THỂ (Bắt buộc nhập đúng thông tin cá nhân, hoặc tổ chức)*/
			'uiName' 			=> 'Nguyễn Thị B',//Họ tên cá nhân hoặc tên công ty
			'uiID_Number'		=> '217259851',//Số chứng minh nhân dân của chủ thể (Nếu là cá nhân)
			'uiAddress' 		=> '100 Nguyễn Đình Chiểu, Phường 6, Quận 3',//Địa chỉ chủ thể
			'uiProvince' 		=> 'TP HCM',//Tỉnh thành(Chú ý: Nhập đúng theo file "Tinh thanh pho Viet Nam.xls") 
			'uiCountry' 		=> 'Viet Nam',//Quốc gia(Chú ý: Nhập đúng theo file "Quoc gia ISO3166.xls")
			'uiEmail' 			=> 'testapipa@gmail.com',//Email chủ thể
			'uiPhone' 			=> '+84-901111111',//Điện thoại di động chủ thể
			'uiFax' 			=> '+84-613111111',//Fax chủ thể
			'uiGender'			=> 'Nữ',//Giới tính: Nam/Nữ
			'uiBirthdate'		=> '1987-10-20',//Ngày sinh (format YYYY-mm-dd)
			'uiCompany'			=> 'Công ty Cổ phần ABC',//Tên tổ chức của chủ thể(Nếu có)
			'uiPosition' 		=> 'Nhân viên',//Chức vụ
			
			/* THÔNG TIN NGƯỜI QUẢN LÝ (Bắt buộc nhập đúng thông tin cá nhân)*/
			'adminName' 		=> 'Nguyễn Văn A',//Họ tên người quản lý
			'adminID_Number'	=> '217159852',//Số chứng minh nhân dân của người quản lý
			'adminAddress' 		=> '30 Bàu Tre, Bình An, Long Thành',//Địa chỉ người quản lý
			'adminProvince' 	=> 'Đồng Nai',//Tỉnh thành (Chú ý: Nhập đúng theo file "Tinh thanh pho Viet Nam.xls")
			'adminCountry' 		=> 'Viet Nam',//Quốc gia  (Chú ý: Nhập đúng theo file "Quoc gia ISO3166.xls")
			'adminEmail' 		=> 'testapipa@gmail.com',//Email người quản lý
			'adminPhone' 		=> '+84-987654321',//Điện thoại người quản lý
			'adminFax' 			=> '+84-831111112',//Fax người quản lý
			'adminGender'		=> 'Nam',//Giới tính: Nam/Nữ
			'adminBirthdate'	=> '1985-11-27',//Ngày sinh (format YYYY-mm-dd)
			'adminCompany'		=> 'Công ty TNHH P.A Việt Nam',//Tên tổ chức (Nếu có)
			'adminPosition' 	=> 'Nhân viên',//Chức vụ người quản lý
			
			'sendmail'			=> '1',//Gửi mail thông báo đến khách hàng: (1: Có gửi, 0: Không gửi)
			'responsetype'		=> 'json'//Dữ liệu trả về kiểu json, nếu để rỗng thì trả về kiểu plan text
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