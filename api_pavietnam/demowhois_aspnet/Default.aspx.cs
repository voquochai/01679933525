using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;


public partial class _Default : System.Web.UI.Page 
{
    public string DomainName;// Tên domain đầy đủ
    public string Ext;// Phần mở rộng: .com,.vn,...
    public string result = "";// Kết quả trả về
    /*
     * username: Username của Quý khách dùng để đăng nhập vào trang https://daily.pavietnam.vn
	 * apikey: API KEY (Truy cập vào https://daily.pavietnam.vn/loaddata.php?param=api để lấy API KEY)
     */    
    public static string username	= "pavntest";// Nhập username của đại lý
	public static string apikey   	= "9380b9fb3dfe36635b4d039ca4c13e03";// API KEY 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DomainName = "";
            Ext = "";
        }else
        {
            Ext = ext.Value.Trim();
            DomainName = domain.Value.Trim() + Ext;
            result = CheckWhois(DomainName);
        }
    }
    /*
     * Kiểm tra Tên miền
     * 1: Available | 0: Unavailable
     */
    protected string CheckWhois(string domain)
    {
        String sURL = "https://daily.pavietnam.vn/interface.php?cmd=check_whois&username=" + username + "&apikey=" + apikey + "&domain=" + domain;
        
        String strResponse = "";
        try
        {
            WebRequest myWebRequest = WebRequest.Create(sURL);
            WebResponse myWebResponse = myWebRequest.GetResponse();
            Stream ReceiveStream = myWebResponse.GetResponseStream();
            StreamReader readStream = new StreamReader(ReceiveStream);
            strResponse = readStream.ReadToEnd().Trim();
            readStream.Close();
            myWebResponse.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
        return strResponse;
    }
    /*
     * Lấy thông tin whois của Tên miền
     */
    protected string GetWhois(string domain)
    {
        String sURL = "https://daily.pavietnam.vn/interface.php?cmd=get_whois&username=" + username + "&apikey=" + apikey + "&domain=" + domain;
        
        String strResponse = "";
        try
        {
            WebRequest myWebRequest = WebRequest.Create(sURL);
            WebResponse myWebResponse = myWebRequest.GetResponse();
            Stream ReceiveStream = myWebResponse.GetResponseStream();
            StreamReader readStream = new StreamReader(ReceiveStream);
            strResponse = readStream.ReadToEnd();
            readStream.Close();
            myWebResponse.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
        return strResponse;
    }
}
/*
	//Gọi hàm kiểm tra sự tồn tại của Tên miền
	String result = CheckWhois('pavietnam.vn');
	if(result == "0") Response.Write("Tên miền pavietnam.vn đã có người đăng ký!");
	else if(result == "1") Response.Write("Tiên miền pavietnam.vn chưa đăng ký!");
	else Response.Write("Lỗi truy cập API: "+result);

	//Gọi hàm lấy thông tin whois của Tên miền
	String content = GetWhois('pavietnam.vn');
	Response.Write(content);
*/
