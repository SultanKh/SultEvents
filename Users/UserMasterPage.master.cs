using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class UserMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Name"] != null)
        {
            this.welcome.Text = "Welcome " + Session["Name"].ToString();
        }
        else this.welcome.Text = "Welcome";

        

    }
    protected void log_out_Click(object sender, EventArgs e)
    {
        Session["Name"]=null;
        Session["Pass"] = null;

        if (Request.Cookies.Get("Login.aspx") != null)
        {
        string cooks_name = Request.Cookies["Login.aspx"].Name;
        HttpCookie htt_cookie = new HttpCookie(cooks_name);
        htt_cookie.Expires = DateTime.Now.AddDays(-1);
        Response.Cookies.Add(htt_cookie);

       
        
        }
       Response.Redirect("~/OpinningPage.aspx");
    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        
        if (e.Day.Date < DateTime.Now.Date)
        {
            e.Day.IsSelectable = false;
            e.Cell.ForeColor = System.Drawing.Color.Gray;
        }

        DataDal dates = new DataDal();
        List<DateTime> times = dates.AllTimes();
        foreach (DateTime n in times)
        {
            if (e.Day.Date == n)
            {
                e.Day.IsSelectable = false;
                e.Cell.ForeColor = System.Drawing.Color.Gray;
            }
        }
    }
}
