<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InvitingScale.aspx.cs" Inherits="InvitingScale" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
   
<head runat="server">
    <link rel="stylesheet" href="../css/MenuScript.css">
 <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
 <script src="../js/MenuScript.js"></script>

    <link rel="stylesheet" href="../css/EventInScale.css"  type="text/css"/>
    <title>Make The Crowd</title>
</head>
<body>
    
    <div id='cssmenu'>
<ul>
   <li><a href="Default.aspx">Home</a></li>
   <li class='active has-sub'><a href='#'>Private</a>
      <ul>
         <li class='has-sub'><a href="ChangPassword.aspx">Change Password</a>
         </li>
          <li class='has-sub'><a href="ChangPassword.aspx">Whatever</a>
         </li>
        
      </ul>
   </li>
   <li><a href="calender.aspx">Calender</a></li>
   <li><a href="UserAddingEvent.aspx">Lets Celebrate</a></li>
    <li><a href="InvitingScale.aspx">Lets Invite</a></li>
    
</ul>
       
     </div>


   <form runat="server" action="#">
       
    <div>
    
<div class="container">
  <div class="row header">
    <h1>INVITE &nbsp;</h1>
    <h3>Fill out</h3>
<asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>
  </div>
  <div class="row body">
      
          <ul>

              <li>
                  <p class="left">
                      <label for="first_name">Name</label>
                      <input id="name1"  runat="server" type="text" name="first_name" placeholder="John" />
                  </p>
              </li>

              <li>
                  <p>
                      <label for="email">Email <span class="req">*</span></label>
                      <input id="email1" runat="server" type="text" name="email" placeholder="example@gmail.com" />
                  </p>
              </li>
              <li>
                  <div class="divider"></div>
              </li>
              <li>
                  <label for="comments">Invitation</label>
                  <textarea id="tt" runat="server" cols="46" rows="3" name="comments"></textarea>
              </li>

              <li>
                  <asp:Button ID="Button1" CssClass="btn btn-submit" runat="server" Text="Send" OnClientClick="return validate()" OnClick="Button1_Click" />
              </li>

          </ul>
       
  </div>
</div>

        <div class="container">
            <div class="row header">
   
    <h1>Your Friends</h1>
               
  </div>
 <div class="row body">
                    <ul>

              <li>
                  <p class="left">
                      <label for="first_name">Write a name</label>
                      <input id="friend" type="text" name="friend" placeholder="Batman" runat="server" />
                     
                  </p>
              </li>
                        <li>
                            <asp:Button ID="findlike" runat="server" Text="Submit" CssClass="btn btn-submit" OnClick="findlike_Click" />
                        </li>
                        
                        <li>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Guest_Name" DataSourceID="SqlDataSource1">

                                <Columns>
                                    <asp:BoundField DataField="Guest_Name" HeaderText="Guest_Name" ReadOnly="True" SortExpression="Guest_Name"></asp:BoundField>
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
                                    <asp:BoundField DataField="Phone_Number" HeaderText="Phone_Number" SortExpression="Phone_Number"></asp:BoundField>
                                </Columns>
                            </asp:GridView>


                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>'
                                 SelectCommand="SELECT [Guest_Name], [Email], [Phone_Number] FROM [Users]" FilterExpression="Guest_Name LIKE '{0}' OR Guest_Name LIKE '%{0}' OR Guest_Name LIKE '%{0}%' OR Guest_Name LIKE '{0}%' ">
                                <FilterParameters>
                                    <asp:ControlParameter Name="Guest_Name" ControlID="friend" PropertyName="value" />
                                </FilterParameters>
                                </asp:SqlDataSource>
                        </li>

                        
                        </ul>

                </div>
        </div>
    </div>

</form> 
    <script type="text/javascript">
        function validate() {
            var e = document.getElementById("email1");
            var na = document.getElementById('name1');
            var t = document.getElementById("tt");
            if (na.value == "" || na.value == null) {
                alert("Fill in your friend name");
                pass.focus();
                return false;
            }
            if (e.value == "" || e.value == null) {
                alert("Fill in your friend email");
                pass.focus();
                return false;
            }
        //input check. and for now data validation
        var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
        if (re.test(e.value) == false) {
            e.focus();
            alert("you would rather intsert a valid email!");
            return false;
        }
        if (t.value == "" || t.value == null) {
            alert("no content availble");
            tt.focus();
            return false;
        }
            
        return confirm("are you sure you want to invite this dumb?");
        }
       
    </script>
</body>
</html>
