using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class Admin_MyMessages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        
         
        int id = (int)DataList1.DataKeys[e.Item.ItemIndex];
        SqlDataSource1.DeleteParameters["Id"].DefaultValue = id.ToString();
        SqlDataSource1.Delete();
    }
}