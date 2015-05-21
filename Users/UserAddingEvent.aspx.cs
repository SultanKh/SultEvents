using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class Users_UserAddingEvent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
     
        
        if (Request.Cookies["login.aspx"] != null)
        {
            this.Label1.Text= Request.Cookies["login.aspx"].ToString();
        }
    }

    protected void Addevent_Click1(object sender, EventArgs e)
    {
        
        DataDal dal=new DataDal();
       //user chaeck 

        if (!dal.LoginCheckInUsers(Session["Name"].ToString(), this.pass.Value))
        {
            this.check.Text = "Only User In active must apply";
            this.check.Visible = true;
            return;
        }


        string p=this.phone.Value.Trim();
        p= this.phone.Value.Replace("-","");
        float len = Int16.Parse(this.leength.SelectedItem.ToString());
       
        TimeSpan tum;
        tum=TimeSpan.Parse(this.timespann.SelectedValue);

        tum.Add(TimeSpan.FromHours(Convert.ToDouble(this.leength.Text)));
        
        
        DateTime dtBegin = this.Calendar1.SelectedDate,dtEnd;


        dtEnd = new DateTime(dtBegin.Year, dtBegin.Month, dtBegin.Day, tum.Hours, tum.Minutes, tum.Seconds);
        MessageBox.Show(dtEnd.ToString());
        bool interept = true;      
            
       //checking ;chosen time does not match or interrept other's events
        
            List<DateTime> listoftime = dal.AllTimes();
            List<Double> listoflength = dal.AllLength();
            
            for(int i=0;i<listoftime.Count;i++){
                DateTime x=listoftime.ElementAt(i);

                if (!dal.doesnot_interept(dtBegin, dtEnd, x, x.AddHours(listoflength.ElementAt(i))))
                {
                    MessageBox.Show("Fuck Nigga, Damn it");
                    return;
                }

            }
            if (interept)
            {
                dal.NewEvent(Session["Name"].ToString(), p, type.Items[type.SelectedIndex].ToString(), dtBegin,(float) len);
                MessageBox.Show("Have a good fucking eve");
                Response.Redirect("~/Users/calender.aspx");
            }
            
            
        
              //Take the phone numer then add to the event table
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
                e.Cell.ForeColor = System.Drawing.Color.Gold;
                e.Cell.BackColor = System.Drawing.Color.IndianRed;
            }
        }
    }
}