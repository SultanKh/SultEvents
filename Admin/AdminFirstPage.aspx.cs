using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
public partial class AdminFirstPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Boss"] != null)
        {
            this.Label1.Text = Session["Boss"].ToString();
            this.Label1.Visible = true;
        }
    }
    protected void updatenews_Click(object sender, EventArgs e)
    {
        DataDal headline = new DataDal();
        DateTime dd = new DateTime();
        dd = DateTime.Now;
        headline.HeadLines_Admin(dd, this.headline.Value, this.content.Value);

    }

    protected void post_Click(object sender, EventArgs e)
    {
        string UrlWithVar = "~/OpinningPage.aspx?row=" + this.List1.SelectedValue + "&text=" + this.Text1.Value + "&content=" + this.Textarea1.Value;
        Response.Redirect(UrlWithVar);
        
    }

    protected void accept_Click(object sender, EventArgs e)
    {
        if (this.imgUpload1.HasFile)
        {
            Response.Redirect("~/OpinningPage.aspx?img=" + this.imgUpload1.FileName);
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/OpinningPage.aspx");
    }
}