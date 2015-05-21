using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Net;
using System.Net.Mail;


public partial class calender : System.Web.UI.Page
{
    public List<EventClass> toDisplay = new List<EventClass>();
    protected void Page_Load(object sender, EventArgs e)
    {
        DataDal dal = new DataDal();
        string s1,s2;

        
      
if (Session["Name"] == null)
        {
            s1 = "aerosmith";
            s2 = "Crazy";
            return;
        }
        else
        {
            s1 = Session["Name"].ToString();
            s2 = Session["Pass"].ToString();
        }
if(dal.AllEvents_WithRespectToUser(s1, dal.giveMePhone(s1,s2)) . Count == 0)
     
      {
          this.msg.Text = "Nothing availble";
          this.msg.Visible = true;
      }
      else this.msg.Visible = false;

        ///////////////////////////////////
        ///////////////////////////////////

      DataDal m = new DataDal();
      string smtpAddress = "smtp.google.com";
      int portNumber = 587;
      bool enableSSL = true;

      string emailFrom = "WebEvents@SultanCorporotion.com";
      string password = "abcdefg";
      string emailTo = m.GiveMeEmail(Session["Name"].ToString(), Session["Pass"].ToString());
      string subject = "Remember";
      bool go = false;

        List<DateTime> alltimes=m.AllTime_WithRespectToUser(s1,s2);
        string body = "Hello, tonight you are having a party at ";
        foreach(DateTime x in alltimes){
            if(x==DateTime.Now){
                go = true;
                body += x.ToString() + " ";
            }
        }

        if (go)
        {
            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress(emailFrom);
                mail.To.Add(emailTo);
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;
                // Can set to false, if you are sending pure text.

                mail.Attachments.Add(new Attachment("~/images/i_wish_you_a_merry_christmas_by_pimpyourscreen-wallpaper-1920x1080.jpg"));


                using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                {
                    smtp.Credentials = new NetworkCredential(emailFrom, password);
                    smtp.EnableSsl = enableSSL;
                    smtp.Send(mail);
                }
            }
        }


    
    }
    protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        
        int id = (int)DataList1.DataKeys[e.Item.ItemIndex];
        SqlDataSource1.DeleteParameters["Id"].DefaultValue = id.ToString();
        SqlDataSource1.Delete();
    }

    protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
    {
        DataList1.EditItemIndex = e.Item.ItemIndex;
        DataList1.DataBind();
    }
    protected void DataList1_CancelCommand(object source, DataListCommandEventArgs e)
    {
DataList1.EditItemIndex = -1;
        DataList1.DataBind();
    }
    protected void DataList1_UpdateCommand(object source, DataListCommandEventArgs e)
    {
       
        
        string TypeName =( (System.Web.UI.WebControls.TextBox) e.Item.FindControl("type") ).Text.Trim();
        int Length = Convert.ToInt16( ( (System.Web.UI.WebControls.TextBox ) e.Item.FindControl("length") ).Text.Trim() );

      //  int id = Convert.ToInt16( ((System.Web.UI.WebControls.TextBox)e.Item.FindControl("Id")).Text );
        int id = Convert.ToInt32(DataList1.DataKeys[e.Item.ItemIndex]);

        DateTime value;
        if (!DateTime.TryParse(((System.Web.UI.WebControls.TextBox)e.Item.FindControl("date")).Text, out value))
        {

            MessageBox.Show("Try a correct format");
            return;
        }
        DateTime date = Convert.ToDateTime(((System.Web.UI.WebControls.TextBox)e.Item.FindControl("date")).Text);

     

        /***LET THE EDITING BEGIN    ****/
        SqlDataSource1.UpdateParameters["Id"].DefaultValue = id.ToString();
        SqlDataSource1.UpdateParameters["Event_Type"].DefaultValue= TypeName;
        SqlDataSource1.UpdateParameters["Date"].DefaultValue = date.ToString();
        SqlDataSource1.UpdateParameters["Length"].DefaultValue = Length.ToString();
        SqlDataSource1.Update();
        DataList1.EditItemIndex = -1;
        DataList1.DataBind();
    }

    protected void edit_Click(object sender, EventArgs e)
    {

    }
    protected void update_Click(object sender, EventArgs e)
    {
      

    }
}