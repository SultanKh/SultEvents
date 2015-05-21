using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Services;
using System.Windows.Forms;

public partial class InvitingScale : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
       
    }
     
    protected void findlike_Click(object sender, EventArgs e)
    {
        



    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataDal invite = new DataDal();
        if (Session["Name"] == null)
        {
            Session["Name"] = "a";
            Session["Pass"] = "a";
        }
        string email = invite.GiveMeEmail(Session["Name"].ToString(), Session["Pass"].ToString());
        
        invite.Inviting(Session["Name"].ToString(), email, name1.Value, email1.Value, this.tt.Value);
        this.Label1.Text = "Invitation send succesfuly";
        this.Label1.Visible = true;
        
    }
}