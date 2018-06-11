<?php
	//LẤY THÔNG TIN WHOIS CỦA DOMAIN
	include 'api_config.php';
	$domain 	= 'pavietnam.com';//Domain cần lấy thông tin whois
	$result = file_get_contents(API_URL."?username=".USERNAME."&apikey=".API_KEY."&cmd=get_whois&domain=".$domain);//Gọi link thực thi thật
	echo $result;//Xuất kết quả
?>