using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class OpinningPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["img"]!=null)
           this.toChange.Src =@"images/" + Request.QueryString["img"];
        else
            this.toChange.Src = @"/Images/ultimate-wedding.jpg";

        var url=Request.QueryString["row"];
        if (url != null)
        {
            //Security
            if (Request.QueryString["text"].Length == 0 || Request.QueryString["content"].Length==0)
                return;
            if (url == "FirstRow")
            {
                this.first.InnerText = Request.QueryString["text"];
                this.firstp.InnerText = Request.QueryString["content"];
            }
            if (url.Equals("SecondRow"))
            {
                this.sec.InnerText = Request.QueryString["text"];
                this.secp.InnerText = Request.QueryString["content"];
            }
            if (url.Equals("ThirdRow"))
            {
                this.third.InnerText = Request.QueryString["text"];
                this.thirdp.InnerText = Request.QueryString["content"];

            }
            if (url.Equals("FourthRow"))
            {
                this.four.InnerText = Request.QueryString["text"];
                this.fourp.InnerText = Request.QueryString["content"];
            }
        }
        

        DataDal dali = new DataDal();
        List<string> toDisplay = dali.GiveMeNews();
        
        if (toDisplay.Count == 0) return;

        this.NewsH1.InnerText = toDisplay.ElementAt(0);
        this.NewsP1.InnerText = toDisplay.ElementAt(1);
        
        
    }





    protected void Button1_Click(object sender, EventArgs e)
    {
        
        DataDal toDataBase = new DataDal();
        DateTime da = new DateTime();
        da = DateTime.Now;
        toDataBase.NewMsgToMe(this.name.Value, this.email.Value, da, this.msg.Value);
        name.Value = "";
        email.Value = "";
        msg.Value = "";
        
    }

   
}