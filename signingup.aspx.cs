using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class signingup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Signup_Click(object sender, EventArgs e)
    {
        DataDal new_geust = new DataDal();
        if (new_geust.LoginCheckInUsers(name.Value, pass.Value)) 
        {
            MessageBox.Show("You already exist! stupid");
        }
        else
        {
            DateTime dd;
          if(!  DateTime.TryParse(birthday.Value, out dd)){

              MessageBox.Show("try insert a valid date");
              return;
            }
          dd = DateTime.Parse(birthday.Value);
        new_geust.NewUser_AddToUsers(name.Value, mail.Value, fone.Value,dd, pass.Value);

        int timeout = 2500;//2.5 seconds
	   
// is model
bool model = false;

        AutoClosingMessageBox.Show("Welcome MotherFucker To my Website", "Caption", 1000);
          
        Session["Name"] = name.Value;
        Session["Pass"] = pass.Value;
        Response.Redirect("~/Users/calender.aspx");

        }
        
    }

    public class AutoClosingMessageBox
    {
        System.Threading.Timer _timeoutTimer;
        string _caption;
        AutoClosingMessageBox(string text, string caption, int timeout)
        {
            _caption = caption;
            _timeoutTimer = new System.Threading.Timer(OnTimerElapsed,
                null, timeout, System.Threading.Timeout.Infinite);
            MessageBox.Show(text, caption);
        }
        public static void Show(string text, string caption, int timeout)
        {
            new AutoClosingMessageBox(text, caption, timeout);
        }
        void OnTimerElapsed(object state)
        {
            IntPtr mbWnd = FindWindow(null, _caption);
            if (mbWnd != IntPtr.Zero)
                SendMessage(mbWnd, WM_CLOSE, IntPtr.Zero, IntPtr.Zero);
            _timeoutTimer.Dispose();
        }
        const int WM_CLOSE = 0x0010;
        [System.Runtime.InteropServices.DllImport("user32.dll", SetLastError = true)]
        static extern IntPtr FindWindow(string lpClassName, string lpWindowName);
        [System.Runtime.InteropServices.DllImport("user32.dll", CharSet = System.Runtime.InteropServices.CharSet.Auto)]
        static extern IntPtr SendMessage(IntPtr hWnd, UInt32 Msg, IntPtr wParam, IntPtr lParam);
    }
}