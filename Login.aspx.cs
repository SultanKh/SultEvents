using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LOogin_Click(object sender, EventArgs e)
    {
        DataDal logging = new DataDal();
        if (logging.LoginCheckInUsers(this.input_name.Value, this.input_pass.Value))
        {
            
            Session["Name"]=this.input_name.Value;
            Session["Pass"] = this.input_pass.Value;
            if (Check1.Checked)//impelementing remember me
            {

                HttpCookie cookie = new HttpCookie("Login.aspx");
                cookie.Values.Add("username", this.input_name.Value);
                cookie.Expires = DateTime.Now.AddMinutes(15);
                Response.Cookies.Add(cookie);
            }

            Response.Redirect("~/Users/calender.aspx");
        }

        else
        {
            MessageBox.Show("MatherFucker you dont exit,try me again");
        }
        
        
    }
}