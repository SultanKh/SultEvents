<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserAddingEvent.aspx.cs" Inherits="Users_UserAddingEvent" %>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>New Event</title>
  <link rel="stylesheet" href="../css/style_AddingEvent.css">
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>

<body>
  <div class="container">
    <section class="register">
      <h1>Make An Event Mr/Ms <asp:Label ID="Label1" runat="server" Text="Mr"></asp:Label></h1>
        <form id="form1" runat="server">
            <asp:Label ID="check" Visible="false" runat="server" Text="Label"></asp:Label>
      <div class="reg_section personal_info">
      <h3>Your Personal Information</h3>
      <input type="text" name="username" value="" placeholder="Your Availble Phone Number" id="phone" runat="server">
       <h3>Password</h3>
          <input type="password" name="password" value="" placeholder="Your Password" runat="server" id="pass">

     
          <h3>Event Type</h3>
      <select id="type" runat="server">
        <option value="">Wedding</option>
        <option value="">New_Year_Eve</option>
        <option>Celebrity</option>
          <option>Birthday</option>
          <option>Holiday</option>
      </select>&nbsp;
      </div>
      <div class="reg_section password">
      <h3>Date 
          <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="195px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="316px" OnDayRender="Calendar1_DayRender">
              <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
              <DayStyle Width="14%" />
              <NextPrevStyle Font-Size="8pt" ForeColor="White" />
              <OtherMonthDayStyle ForeColor="#999999" />
              <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
              <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
              <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
              <TodayDayStyle BackColor="#CCCC99" />
          </asp:Calendar>
          </h3>

          <h3>Set Time hour</h3>
          <asp:DropDownList ID="timespann" runat="server" Height="32px" Width="307px">
              <asp:ListItem>12:00</asp:ListItem>
              <asp:ListItem>13:00</asp:ListItem>
               <asp:ListItem>14:00</asp:ListItem>
              <asp:ListItem>15:00</asp:ListItem>
               <asp:ListItem>16:00</asp:ListItem>
              <asp:ListItem>17:00</asp:ListItem>
               <asp:ListItem>18:00</asp:ListItem>
              <asp:ListItem>19:00</asp:ListItem>
               <asp:ListItem>20:00</asp:ListItem>
              <asp:ListItem>21:00</asp:ListItem>
              <asp:ListItem>22:00</asp:ListItem>
              
          </asp:DropDownList>
          
      &nbsp;<h3>Length</h3>
      
         <asp:DropDownList ID="leength" runat="server" Height="32px" Width="307px">
              <asp:ListItem>2</asp:ListItem>
              <asp:ListItem>3</asp:ListItem>
               <asp:ListItem>4</asp:ListItem>
              <asp:ListItem>5</asp:ListItem>
               <asp:ListItem>6</asp:ListItem>
              
                             
          </asp:DropDownList>
      </div>
      <div class="reg_section password">
      
      </div>
      <p class="submit">
          <asp:Button ID="Addevent" runat="server" Text="Add Event" OnClick="Addevent_Click1" />
            </p>
        </form>
    </section>
  </div>

    <div class="about">
      <h1><a href="calender.aspx">BACK</a></h1> 
    </div>

</body>
    <script type="text/javascript">
        function v() {
            var x1 = document.getElementById("pass");
            var x2 = document.getElementById("phone");
            if (x1.value == "" || x2.value == "") {
                x1.style.backgroundColor = "red";
                x2.style.backgroundColor = "red";
                return false;
            }
        }
    </script>
</html>
