using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;


public class EventClass
{

    private string Guest_Name;
    private string Email, phone,Event_Type;
    private DateTime Event_Date;
    private  float event_long;//(in hours)
    
    public EventClass()
    {
     
        

   
    }
public EventClass(string name, string phone,string Eventtype,DateTime ddt ,float eventlong)
    {
        this.Guest_Name = name;
        this.Event_Date =ddt;
        this.Email = email;
        this.Event_Type = Eventtype;
        this.phone = phone;
        this.event_long = eventlong;
    }


public string GuestName
    {  
       get { return this.Guest_Name; }
       set { Guest_Name = value; }
    }

public string email
{
    get { return this.Email; }
    set { this.Email = value; }
}
public string Phone
{
    get { return this.phone; }
    set { this.phone = value; }
}
public string EventType
{
    get { return this.Event_Type; }
    set { this.Event_Type = value; }
}


public DateTime datte
{
    get { return this.Event_Date; }
    set { this.Event_Date = value; }
}

public float eventlong
{
    get { return this.event_long; }
    set { this.event_long = value; }
}

}