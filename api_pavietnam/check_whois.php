<?php
	//KIỂM TRA SỰ TỒN TẠI CỦA DOMAIN.
	include 'api_config.php';
	$domain 	= 'pavietnam.com';//Domain cần kiểm tra
	$result = file_get_contents(API_URL."?username=".USERNAME."&apikey=".API_KEY."&cmd=check_whois&domain=".$domain);//Gọi link thực thi thật
	if($result == '0')//Tên miền đã được đăng ký
	{
		echo "Tên miền <a href='http://$domain' target='_blank'>$domain</a> đã đuợc đăng ký<br>";
		// Hien thi thong tin whois	
		echo "<strong>Thông tin whois</strong>";
		echo "<div style='border:1px solid #ccc'>";
		echo file_get_contents(API_URL."?username=".USERNAME."&apikey=".API_KEY."&cmd=get_whois&domain=".$domain);
		echo "</div>";	
	}
	elseif($result == '1')//Tên miền chưa đăng ký
	{
		echo "Tên miền <strong>$domain</strong> chưa đăng ký<br>";
	}
	else//Các trường hợp lỗi
	{
		echo "<span style='color:#F00'>$result</span>";
	}
	
?>