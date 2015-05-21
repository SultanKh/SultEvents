using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.Services;
using System.Windows.Forms;


public class DataDal
{
    public int t = 0;
	public DataDal()
	{
       
        
	}


    public void NewUser_AddToUsers(string name,string email,string phone,DateTime dd,string pass)
    { 
        string st = @"Data Source=(LocalDB)\v11.0;
AttachDbFilename=C:\Users\Al-Sultan\Desktop\Sultevents\App_Data\Users.mdf ;Integrated Security=True;Connect Timeout=30";

     SqlConnection con;
        con = new SqlConnection(st);
        try
        {
            con.Open();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        string stcommand = "INSERT INTO Users VALUES(@name, @email, @phone,@birth ,@pass)";
        SqlCommand com = new SqlCommand(stcommand, con);
        com.Parameters.AddWithValue("@name", name);
        com.Parameters.AddWithValue("@email", email);
        com.Parameters.AddWithValue("@phone", phone);
        com.Parameters.AddWithValue("@birth", dd);
        com.Parameters.AddWithValue("@pass", pass);
        com.ExecuteNonQuery();

        con.Close();
        
    }

    public void NewEvent(string name, string phone, string eventtype,DateTime dat ,float length)
    {
        int rnd = (t * t + 20) / 3;
        string st = @"Data Source=(LocalDB)\v11.0;
AttachDbFilename=C:\Users\Al-Sultan\Desktop\Sultevents\App_Data\Users.mdf ;Integrated Security=True;Connect Timeout=30";
        SqlConnection con;
        con = new SqlConnection(st);
        try
        {
            con.Open();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        } 
        string stAllId = "SELECT Id FROM Events";
       
        SqlCommand com = new SqlCommand(stAllId, con);
        DateTime ddate = dat;
        
        SqlDataReader reader = com.ExecuteReader();
        List<int> Ids = new List<int>();
        while (reader.Read())
        {
            Ids.Add((int)reader[0]);
        }
        //checjing ID
        while ( Ids.Contains(rnd))
        {
            t++;
            rnd = (t * t + 20) / 3;
        }

        reader.Close();

        string stcommand = "INSERT INTO dbo.Events(Id,Guest_Name,Phone,Event_Type,Date,Length) VALUES(@id,@name, @phone, @Event_Type, @date, @length)";
        com = new SqlCommand(stcommand, con);
        com.Parameters.AddWithValue("@id", rnd);
        com.Parameters.AddWithValue("@name", name);
        com.Parameters.AddWithValue("@phone", phone);
        com.Parameters.AddWithValue("@Event_Type", eventtype);
        com.Parameters.AddWithValue("@date", ddate);
        com.Parameters.AddWithValue("@length", length);
        com.ExecuteNonQuery();

        con.Close();

    }
    public bool LoginCheckInUsers(string name, string pass)
    {
        string st = @"Data Source=(LocalDB)\v11.0;
AttachDbFilename=C:\Users\Al-Sultan\Desktop\Sultevents\App_Data\Users.mdf ;Integrated Security=True;Connect Timeout=30";
        SqlConnection con;
        con = new SqlConnection(st);
        try
        {
            con.Open();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        string stcommand = "SELECT Guest_Name,Password From Users Where Guest_Name=@name AND Password=@pass";
        SqlCommand com = new SqlCommand(stcommand, con);
        com.Parameters.AddWithValue("@name", name);
        com.Parameters.AddWithValue("@pass", pass);

        SqlDataReader reader = com.ExecuteReader();
        // Call Read before accessing data. 
        if (reader.Read())
        {
            if (reader["Guest_Name"].ToString().Equals(name) && reader["Password"].ToString().Equals(pass))
            {
                con.Close();
                return true;
            }
            
        }
        con.Close();
        return false;
    }

    public string GiveMeEmail(string name, string pass)
    {
        string st = @"Data Source=(LocalDB)\v11.0;
AttachDbFilename=C:\Users\Al-Sultan\Desktop\Sultevents\App_Data\Users.mdf ;Integrated Security=True;Connect Timeout=30";
        SqlConnection con;
        con = new SqlConnection(st);
        try
        {
            con.Open();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        string stcommand = "SELECT Email From Users Where Guest_Name=@name AND Password=@pass";
        SqlCommand com = new SqlCommand(stcommand, con);
        com.Parameters.AddWithValue("@name", name);
        com.Parameters.AddWithValue("@pass", pass);
        string s="";
        SqlDataReader reader = com.ExecuteReader();
        // Call Read before accessing data. 
        if (reader.Read())
        {
            
        s= reader["Email"].ToString();
        }
        con.Close();
        return s;
    }
    
    public bool CheckAdmin(int id, string name)
    {
        string st = @"Data Source=(LocalDB)\v11.0;
AttachDbFilename=C:\Users\Al-Sultan\Desktop\Sultevents\App_Data\Users.mdf ;Integrated Security=True;Connect Timeout=30";
        SqlConnection con;
        con = new SqlConnection(st);
        try
        {
            con.Open();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        string stcommand = "SELECT Id,Name FROM [Boss] WHERE [Id]=@Id AND [Name]=@Name";
        SqlCommand com = new SqlCommand(stcommand, con);
        com.Parameters.AddWithValue("@Id", id);
        com.Parameters.AddWithValue("@Name", name);

        SqlDataReader reader = com.ExecuteReader();
        // Call Read before accessing data. 
        if (reader.Read())
        {
            

            if (reader["Id"].ToString().Equals(id.ToString()) && reader["Name"].ToString().Equals(name))
            {
                con.Close();
                return true;
            }
           
            
        }
        con.Close();
        return false;
    }




    public List<EventClass> AllEvents_WithRespectToUser(string guestname,string pass)
    {
        string st = @"Data Source=(LocalDB)\v11.0;
AttachDbFilename=C:\Users\Al-Sultan\Desktop\Sultevents\App_Data\Users.mdf ;Integrated Security=True;Connect Timeout=30";
        SqlConnection con;
        con = new SqlConnection(st);
        try
        {
            con.Open();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        string stcommand = "SELECT Guest_Name,Phone,Event_Type,Date,Length From dbo.Events WHERE Guest_Name=@name";

        SqlCommand com = new SqlCommand(stcommand, con);
        com.Parameters.AddWithValue("@name", guestname);
        
        
        List<EventClass> list = new List<EventClass>();
       
        SqlDataReader reader = com.ExecuteReader();
        
        while (reader.Read())
        {
            EventClass eve=new EventClass();
            eve.GuestName = reader[0].ToString();
            eve.Phone = reader["Phone"].ToString();
            eve.EventType = reader[2].ToString();
            eve.datte =(DateTime) reader["Date"];
            eve.eventlong =(float) Convert.ToDouble(reader["Length"].ToString());

            list.Add(eve);
        }
        con.Close();
        return list;
    }

    public List<DateTime> AllTimes()
    {
        string st = @"Data Source=(LocalDB)\v11.0;
AttachDbFilename=C:\Users\Al-Sultan\Desktop\Sultevents\App_Data\Users.mdf ;Integrated Security=True;Connect Timeout=30";
        SqlConnection con;
        con = new SqlConnection(st);
        List<DateTime> ret = new List<DateTime>();
        
        


        try
        {
            con.Open(); // Custom class that has our connection string hard coded.

            string query = "SELECT Date FROM Events"; // (dummy query)

            using (SqlCommand command = new SqlCommand(query, con))
            using (SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection))
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        ret.Add( DateTime.Parse(reader[0].ToString()));
                       
                    }
                }
            }
        }
        catch (Exception e)
        {
            throw new Exception(e.Message);
        }
        return ret;
    }

    public List<DateTime> AllTime_WithRespectToUser(string name, string phone)
    {

        string st = @"Data Source=(LocalDB)\v11.0;
AttachDbFilename=C:\Users\Al-Sultan\Desktop\Sultevents\App_Data\Users.mdf ;Integrated Security=True;Connect Timeout=30";
        SqlConnection con;
        con = new SqlConnection(st);
        try
        {
            con.Open();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        
        string query = "SELECT [Date] FROM Events WHERE [Guest_Name]=@name AND [Phone]=@phone"; // (dummy query)
       
        SqlCommand com = new SqlCommand(query, con);
        com.Parameters.AddWithValue("@name", name);
        com.Parameters.AddWithValue("@phone", phone);
        List<DateTime> ret = new List<DateTime>();
        SqlDataReader reader = com.ExecuteReader();
        // Call Read before accessing data. 
        while (reader.Read())
        {
            
            ret.Add((DateTime) reader["Date"] );
        }
        
        con.Close();
        return ret;
        
        
        
        
    }

    public List<double> AllLength()
    {
        string st = @"Data Source=(LocalDB)\v11.0;
AttachDbFilename=C:\Users\Al-Sultan\Desktop\Sultevents\App_Data\Users.mdf ;Integrated Security=True;Connect Timeout=30";
        SqlConnection con;
        con = new SqlConnection(st);
        try
        {
            con.Open();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        string stcommand = "SELECT Length From Events";
        SqlCommand com = new SqlCommand(stcommand, con);
        List<double> ret = new List<double>();
        SqlDataReader reader = com.ExecuteReader();
        while (reader.Read())
        {
            ret.Add(Convert.ToDouble(reader[0].ToString()));
            
        }

        return ret;
    }

    public string giveMePhone(string name, string pass)
    {
        string st = @"Data Source=(LocalDB)\v11.0;
AttachDbFilename=C:\Users\Al-Sultan\Desktop\Sultevents\App_Data\Users.mdf ;Integrated Security=True;Connect Timeout=30";
        SqlConnection con;
        con = new SqlConnection(st);
        try
        {
            con.Open();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        string stcommand = "SELECT Phone_Number From Users Where Guest_Name=@name AND Password=@pass";
        SqlCommand com = new SqlCommand(stcommand, con);
        com.Parameters.AddWithValue("@name", name);
        com.Parameters.AddWithValue("@pass", pass);
        string s = "";
        SqlDataReader reader = com.ExecuteReader();
        // Call Read before accessing data. 
        if (reader.Read())
        {

            s = reader["Phone_Number"].ToString();
        }
        con.Close();
        return s;
    }
    
    public bool doesnot_interept(DateTime start,DateTime end, DateTime begin, DateTime ending)
    {
        if (start >= begin && start <= ending)      //  [*********************]
            return false;                               //      [*****]
       
        if (start <= begin && end > begin) return false;//  [*************************]
                                                          //    [******]  
       
        if (start < begin && end >= ending)                       //        [***************]
            return false;                                         //            [*******]

        return true;
    }
    public void NewMsgToMe(string sender_name, string sender_email, DateTime sendingdate, string content)
    {
        string st = @"Data Source=(LocalDB)\v11.0;
AttachDbFilename=C:\Users\Al-Sultan\Desktop\Sultevents\App_Data\Users.mdf ;Integrated Security=True;Connect Timeout=30";

        SqlConnection con;
        con = new SqlConnection(st);
        try
        {
            con.Open();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        int x = 0;
        
        foreach(char a in sender_name){
            x += (int)a;
        }
        x +=(int) DateTime.Now.TimeOfDay.TotalMinutes;
        x = x / 3;
        string stcommand = "INSERT INTO Messages VALUES(@id,@name, @email, @date, @cont)";
        SqlCommand com = new SqlCommand(stcommand, con);
        com.Parameters.AddWithValue("@id", x);
        com.Parameters.AddWithValue("@name", sender_name);
        com.Parameters.AddWithValue("@email", sender_email);
        com.Parameters.AddWithValue("@date", sendingdate);
        com.Parameters.AddWithValue("@cont", content);
        com.ExecuteNonQuery();

        con.Close();
    }
    public bool ChangePass(string name, string old_pass, string neo_pass)
    {
        string st = @"Data Source=(LocalDB)\v11.0;
AttachDbFilename=C:\Users\Al-Sultan\Desktop\Sultevents\App_Data\Users.mdf ;Integrated Security=True;Connect Timeout=30";
        SqlConnection con;
        con = new SqlConnection(st);
        try
        {
            con.Open();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        string validate = "SELECT Guest_Name,Password FROM Users WHERE Guest_Name=@name AND Password=@old_pass";
        string stcommand = "UPDATE Users SET Password=@neo_pass WHERE Guest_Name=@name AND Password=@old_pass";
        SqlCommand com = new SqlCommand(validate, con);
        com.Parameters.AddWithValue("@name", name);
        com.Parameters.AddWithValue("@old_pass", old_pass);
        SqlDataReader reader = com.ExecuteReader();
        if (!reader.Read())
        {
            return false;
        }
        reader.Close();
        com = new SqlCommand(stcommand, con);
        com.Parameters.AddWithValue("@neo_pass", neo_pass);
        com.Parameters.AddWithValue("@old_pass", old_pass);
        com.Parameters.AddWithValue("@name", name);
        com.ExecuteNonQuery();
        con.Close();
        return true;

        
    }
    public void HeadLines_Admin(DateTime dd, string headline, string content)
    {
        string st = @"Data Source=(LocalDB)\v11.0;
AttachDbFilename=C:\Users\Al-Sultan\Desktop\Sultevents\App_Data\Users.mdf ;Integrated Security=True;Connect Timeout=30";

        SqlConnection con;
        con = new SqlConnection(st);
        try
        {
            con.Open();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        string stcommand = "INSERT INTO RecentUpdates VALUES(@date, @headline, @content)";
        SqlCommand com = new SqlCommand(stcommand, con);
        com.Parameters.AddWithValue("@date", dd);
        com.Parameters.AddWithValue("@headline", headline);
        com.Parameters.AddWithValue("@content", content);
        com.ExecuteNonQuery();

        con.Close();
    }
    public List<string> GiveMeNews()
    {
        string st = @"Data Source=(LocalDB)\v11.0;
AttachDbFilename=C:\Users\Al-Sultan\Desktop\Sultevents\App_Data\Users.mdf ;Integrated Security=True;Connect Timeout=30";
        SqlConnection con;
        con = new SqlConnection(st);
        try
        {
            con.Open();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        string stcommand = "SELECT TOP 1 * FROM RecentUpdates ORDER BY DateWriting DESC ";

        SqlCommand com = new SqlCommand(stcommand, con);
       
        List<string> list = new List<string>();

        SqlDataReader reader = com.ExecuteReader();

        if (reader.Read())
        {

            list.Add(reader["headline"].ToString());
            list.Add(reader["content"].ToString());
        }
        con.Close();
        return list;
    }
    public void DeleteAllNews()
    {
        string st = @"Data Source=(LocalDB)\v11.0;
AttachDbFilename=C:\Users\Al-Sultan\Desktop\Sultevents\App_Data\Users.mdf ;Integrated Security=True;Connect Timeout=30";
        SqlConnection con;
        con = new SqlConnection(st);
        try
        {
            con.Open();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        string delete = "DELETE FROM [RecentUpdates]";
        SqlCommand com = new SqlCommand(delete, con);

        com.ExecuteNonQuery();
    }
    public void DeleteCheckedNews(DateTime dt, string h)
    {
        string st = @"Data Source=(LocalDB)\v11.0;
AttachDbFilename=C:\Users\Al-Sultan\Desktop\Sultevents\App_Data\Users.mdf ;Integrated Security=True;Connect Timeout=30";

        SqlConnection con;
        con = new SqlConnection(st);
        
        string delete = "DELETE FROM [RecentUpdates] WHERE [DateWriting]=@DateWriting AND [headline]=@headline";
        SqlCommand com = new SqlCommand(delete, con);
        com.Parameters.AddWithValue("@DateWriting", dt);
        com.Parameters.AddWithValue("@headline", h);
        
        
        try
        {
            con.Open();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        com.ExecuteNonQuery();

        con.Close();
    }
    public void UpdateEvent_date(DateTime newone, string name, string phone)
    {
        string st = @"Data Source=(LocalDB)\v11.0;
AttachDbFilename=C:\Users\Al-Sultan\Desktop\Sultevents\App_Data\Users.mdf ;Integrated Security=True;Connect Timeout=30";
        SqlConnection con;
        con = new SqlConnection(st);
        try
        {
            con.Open();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        
        string stcommand = "UPDATE [Events] SET [Date]=@date WHERE [Guest_Name]=@name AND [Phone]=@phone";
        SqlCommand com = new SqlCommand(stcommand, con);
        com.Parameters.AddWithValue("@date", newone);
        
        com.Parameters.AddWithValue("@name", name);
        com.Parameters.AddWithValue("@old_pass", phone);
        com.ExecuteNonQuery();
        con.Close();

    }


    
    public void Inviting(string name1,string pass1,string rec2,string pass2,string content)
    {

        string st = @"Data Source=(LocalDB)\v11.0;
AttachDbFilename=C:\Users\Al-Sultan\Desktop\Sultevents\App_Data\Users.mdf ;Integrated Security=True;Connect Timeout=30";

        SqlConnection con;
        con = new SqlConnection(st);
        try
        {
            con.Open();
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        int x = 0;

        foreach (char a in name1)
        {
            x += (int)a;
        }
        foreach (char b in rec2)
        {
            x += (int)b;
        }
        x += (int)DateTime.Now.TimeOfDay.TotalMinutes;
        x = x / 3;
        DateTime dd = DateTime.Now;
        string stcommand = "INSERT INTO [Invitations] VALUES(@id,@name, @pass1, @rec2, @email,@dd,@content)";

        string stcommandFind = "SELECT [Id] From [Invitations] Where [Id]=@x";
        SqlCommand com2 = new SqlCommand(stcommandFind, con);
        com2.Parameters.AddWithValue("@x", x);
        SqlDataReader read = com2.ExecuteReader();
        while (read.Read() && (int)read[0]==x)
        {
            x += (int)DateTime.Now.TimeOfDay.TotalMinutes;
            x = x / 3;

        }
        read.Close();
        SqlCommand com = new SqlCommand(stcommand, con);
        com.Parameters.AddWithValue("@id", x);
        com.Parameters.AddWithValue("@name", name1);
        com.Parameters.AddWithValue("@pass1", pass1);
        com.Parameters.AddWithValue("@rec2", rec2);
        com.Parameters.AddWithValue("@email", pass2);
        com.Parameters.AddWithValue("@dd", dd);
        com.Parameters.AddWithValue("@content", content);
        com.ExecuteNonQuery();

        con.Close();

    }

}