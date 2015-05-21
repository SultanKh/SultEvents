using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class Users_ChangPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void chageit_Click(object sender, EventArgs e)
    {
        DataDal changing = new DataDal();
        if (!changing.ChangePass(Session["Name"].ToString(), oldpass.Value, password1.Value))
        {
            this.Label1.Visible = true;
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),"Confirm","alert('Password Changed!)');",true);
          
        }
    }
}