using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
public partial class AdminLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.name.Value = "";
        this.id.Value = "";
    }


    protected void HelloMotherFucker_Click(object sender, EventArgs e)
    {

        DataDal boss = new DataDal();
        int ID=Convert.ToInt16( this.id.Value );


        if ( boss.CheckAdmin(ID , this.name.Value) )
        {

            Session["Boss"] = this.name.Value;
            Response.Redirect("~/Admin/AdminFirstPage.aspx");
            
        }
        else
        {
            this.Label1.Text = "incorrect code/ name";
            this.Label1.Visible = true;
        }
    }
}



