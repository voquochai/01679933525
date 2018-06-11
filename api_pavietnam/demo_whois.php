<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Simple Check Domain</title>
</head>
<body>
<strong>Kiểm tra tên miền</strong>
<form name="checkdomain" method="post">
  <input type="text" name="domain" value="<?=!empty($_POST['domain'])?trim($_POST['domain']):''?>"> 
  <span style="font-size:14pt; font-weight:bold">.</span>
  <select name="ext">
    <option value=".ac.vn">ac.vn</option>
    <option value=".angiang.vn">angiang.vn</option>
    <option value=".asia">asia</option>
    <option value=".bacgiang.vn">bacgiang.vn</option>
    <option value=".backan.vn">backan.vn</option>
    <option value=".baclieu.vn">baclieu.vn</option>
    <option value=".bacninh.vn">bacninh.vn</option>
    <option value=".baria-vungtau.vn">baria-vungtau.vn</option>
    <option value=".bentre.vn">bentre.vn</option>
    <option value=".binhdinh.vn">binhdinh.vn</option>
    <option value=".binhduong.vn">binhduong.vn</option>
    <option value=".binhphuoc.vn">binhphuoc.vn</option>
    <option value=".binhthuan.vn">binhthuan.vn</option>
    <option value=".biz">biz</option>
    <option value=".biz.vn">biz.vn</option>
    <option value=".bz">bz</option>
    <option value=".camau.vn">camau.vn</option>
    <option value=".cantho.vn">cantho.vn</option>
    <option value=".caobang.vn">caobang.vn</option>
    <option value=".cc">cc</option>
    <option value=".co">co</option>
    <option value=".co.uk">co.uk</option>
    <option value=".com" selected="selected">com</option>
    <option value=".com.co">com.co</option>
    <option value=".com.tw">com.tw</option>
    <option value=".com.vn">com.vn</option>
    <option value=".daklak.vn">daklak.vn</option>
    <option value=".daknong.vn">daknong.vn</option>
    <option value=".danang.vn">danang.vn</option>
    <option value=".dienbien.vn">dienbien.vn</option>
    <option value=".dongnai.vn">dongnai.vn</option>
    <option value=".dongthap.vn">dongthap.vn</option>
    <option value=".edu.vn">edu.vn</option>
    <option value=".eu">eu</option>
    <option value=".gialai.vn">gialai.vn</option>
    <option value=".gov.vn">gov.vn</option>
    <option value=".hagiang.vn">hagiang.vn</option>
    <option value=".haiduong.vn">haiduong.vn</option>
    <option value=".haiphong.vn">haiphong.vn</option>
    <option value=".hanam.vn">hanam.vn</option>
    <option value=".hanoi.vn">hanoi.vn</option>
    <option value=".hatinh.vn">hatinh.vn</option>
    <option value=".haugiang.vn">haugiang.vn</option>
    <option value=".health.vn">health.vn</option>
    <option value=".hoabinh.vn">hoabinh.vn</option>
    <option value=".hungyen.vn">hungyen.vn</option>
    <option value=".in">in</option>
    <option value=".info">info</option>
    <option value=".info.vn">info.vn</option>
    <option value=".int.vn">int.vn</option>
    <option value=".jp">jp</option>
    <option value=".khanhhoa.vn">khanhhoa.vn</option>
    <option value=".kiengiang.vn">kiengiang.vn</option>
    <option value=".kontum.vn">kontum.vn</option>
    <option value=".laichau.vn">laichau.vn</option>
    <option value=".lamdong.vn">lamdong.vn</option>
    <option value=".langson.vn">langson.vn</option>
    <option value=".laocai.vn">laocai.vn</option>
    <option value=".longan.vn">longan.vn</option>
    <option value=".me">me</option>
    <option value=".mobi">mobi</option>
    <option value=".namdinh.vn">namdinh.vn</option>
    <option value=".name">name</option>
    <option value=".name.vn">name.vn</option>
    <option value=".net">net</option>
    <option value=".net.co">net.co</option>
    <option value=".net.tw">net.tw</option>
    <option value=".net.vn">net.vn</option>
    <option value=".nghean.vn">nghean.vn</option>
    <option value=".ninhbinh.vn">ninhbinh.vn</option>
    <option value=".ninhthuan.vn">ninhthuan.vn</option>
    <option value=".nom.co">nom.co</option>
    <option value=".org">org</option>
    <option value=".org.tw">org.tw</option>
    <option value=".org.vn">org.vn</option>
    <option value=".phutho.vn">phutho.vn</option>
    <option value=".phuyen.vn">phuyen.vn</option>
    <option value=".pro.vn">pro.vn</option>
    <option value=".quangbinh.vn">quangbinh.vn</option>
    <option value=".quangnam.vn">quangnam.vn</option>
    <option value=".quangngai.vn">quangngai.vn</option>
    <option value=".quangninh.vn">quangninh.vn</option>
    <option value=".quangtri.vn">quangtri.vn</option>
    <option value=".soctrang.vn">soctrang.vn</option>
    <option value=".sonla.vn">sonla.vn</option>
    <option value=".tayninh.vn">tayninh.vn</option>
    <option value=".tel">tel</option>
    <option value=".thaibinh.vn">thaibinh.vn</option>
    <option value=".thainguyen.vn">thainguyen.vn</option>
    <option value=".thanhhoa.vn">thanhhoa.vn</option>
    <option value=".thanhphohochiminh.vn">thanhphohochiminh.vn</option>
    <option value=".thuathienhue.vn">thuathienhue.vn</option>
    <option value=".tiengiang.vn">tiengiang.vn</option>
    <option value=".travinh.vn">travinh.vn</option>
    <option value=".tuyenquang.vn">tuyenquang.vn</option>
    <option value=".tv">tv</option>
    <option value=".tw">tw</option>
    <option value=".us">us</option>
    <option value=".vinhlong.vn">vinhlong.vn</option>
    <option value=".vinhphuc.vn">vinhphuc.vn</option>
    <option value=".vn">vn</option>
    <option value=".ws">ws</option>
    <option value=".yenbai.vn">yenbai.vn</option>
  </select>
  <input type="submit" name="checkdomain" value="Check">
</form>
<p></p>
<?php
if(!empty($_POST['domain']))
{
	include 'api_config.php';
	$domain 	= trim($_POST['domain']).$_POST['ext'];
	$result 	= file_get_contents(API_URL."?cmd=check_whois&apikey=".API_KEY."&username=".USERNAME."&domain=".$domain);
	if($result == '0')//Tên miền đã được đăng ký
	{
		echo "Tên miền <a href='http://$domain' target='_blank'>$domain</a> đã đuợc đăng ký<br>";
		// Hien thi thong tin whois	
		echo "<strong>Thông tin whois</strong>";
		echo "<div style='border:1px solid #ccc'>";
		echo file_get_contents(API_URL."?cmd=get_whois&apikey=".API_KEY."&username=".USERNAME."&domain=".$domain);
		echo "</div>";	
	}
	elseif($result == '1')//Tên miền chưa đăng ký
	{
		echo "Tên miền <strong>$domain</strong> chưa đăng ký<br>";
	}
	else//Các trường hợp lỗi khi truy cập API
	{
		echo "<span style='color:#F00'>$result</span>";
	}
}
?> 
<script language="javascript">
	document.checkdomain.ext.value = '<?=!empty($_POST['ext'])?trim($_POST['ext']):''?>';
</script>
</body>
</html>