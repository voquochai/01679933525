<?php
	//ĐĂNG KÝ HOSTING
	include 'api_config.php';
	$struct = array(
			'cmd' 				=> 'register_hosting',//Lệnh đăng ký hosting			
			'username'			=> USERNAME,//Username đại lý
			'apikey'			=> API_KEY,//API KEY
			'hosting'			=> '32507',//ID gói hosting (Dùng lệnh hosting_list để xem danh sách ID các gói hosting)
			'os'				=> '1',//Hệ điều hành (1: Linux, 2: Windows)
			'domain' 			=> 'hosting.com',//Tên miền
			'amount' 			=> '1',//Số lượng đăng ký:  [số lượng 2] x [chọn gói 6 tháng] = [đăng ký 12 tháng] 
			'pwd'				=> 'HTHF8529sqrd',//Password từ 8 đến 16 ký tự và phải bao gồm các ký tự chữ Hoa (A-Z), chữ Thường (a-z) và Số (0-9)
			
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
			
			/* THÔNG TIN CHỦ THỂ (Thông tin người sử dụng dịch vụ)*/
			'uiName' 			=> 'Ông Nguyễn Văn B',//Tên chủ thể (Cá nhân hoặc công ty)
			'uiID_Number'		=> '217259851',//Chứng minh nhân dân,Hộ chiếu, hoặc tên giao dịch quốc tế
			'uiAddress' 		=> '100 Bàu Tre, Bình An, Long Thành, Đồng Nai',//Địa chỉ chủ thể
			'uiProvince' 		=> 'Đồng Nai',//Tỉnh thành(Chú ý: Nhập đúng theo file "Tinh thanh pho Viet Nam.xls")
			'uiCountry' 		=> 'Viet Nam',//Quốc gia(Chú ý: Nhập đúng theo file "Quoc gia ISO3166.xls")
			'uiEmail' 			=> 'testapipa@gmail.com',//Email chủ thể
			'uiPhone' 			=> '0901111111',//Điện thoại chủ thể
			'uiFax' 			=> '0613111112',//Fax chủ thể
			'uiTaxCode'			=> '0314785299',//Mã số thuế của chủ thể
			
			'sendmail'			=> '1',//Gửi mail thông báo đến khách hàng: (1: Có gửi, 2: Không gửi)
			'responsetype'		=> 'json',//Dữ liệu trả về kiểu json
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