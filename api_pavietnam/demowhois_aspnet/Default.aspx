<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Check Domain</title>
</head>
<body>
    <form id="form1" runat="server">
        <input type="text" class="domain" id="domain" placeholder="Nhập tên miền" runat="server" required="required"/> 
        <span style="font-weight:bold">.</span>
        <select class="ext" id="ext" runat="server" required="required">
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
        <input type="submit" id="checkdomain" value="Check" runat="server"/>
    </form>   
    <p>
        <%
            if(result == "0")
	        {
                // Tên miền đã được đăng ký
                Response.Write("<div style='color:#f00'>Tên miền <strong>" + DomainName + "</strong> đã đuợc đăng ký!</div>");
		        // Thông tin whois
                Response.Write("<hr size='1' style='border:0px;border-bottom:1px solid #bbb' />");	                
		        Response.Write(GetWhois(DomainName));
	        }
	        else if(result == "1")
	        {
                // Tên miền chưa đăng ký
                Response.Write("<div style='color:#00f'>Tên miền <strong>" + DomainName + "</strong> chưa đăng ký!</div>");
	        }
	        else
	        {
                // Các trường hợp lỗi khi truy cập API
                Response.Write("<div style='color:#f00'>"+result+"</div>");
	        }
        %>
    </p>
</body>
</html>
