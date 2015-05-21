using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_allNews : System.Web.UI.Page
{
    public DataDal linkedWithDatabase = new DataDal();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void deleteall_Click(object sender, EventArgs e)
    {
        
        linkedWithDatabase.DeleteAllNews();
    }
    protected void deletechecked_Click(object sender, EventArgs e)
    {
        DateTime dt;
        string header;
        
        foreach (GridViewRow grow in GridView1.Rows)
        {
            CheckBox chkdel = (CheckBox)grow.FindControl("sign1");
            if (chkdel.Checked)
            {
                dt =DateTime.Parse( grow.Cells[0].Text);
                header = grow.Cells[1].Text;
                
                linkedWithDatabase.DeleteCheckedNews(dt, header);
            }  
        }
    }
}