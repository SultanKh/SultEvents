<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AllUsers.aspx.cs" Inherits="AllUsers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>Web Administrator</title>
<link rel="stylesheet" type="text/css" media="all" href="../css/styleAdmin.css" />
<link rel="stylesheet" href="prettyphoto/prettyPhoto.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'/>


</head>
<body>

    <form id="form1" runat="server">

  <div id="header">
        <div class="header_content">
      
        <div class="logo"><a href="AdminManPage.aspx">ADMIN</a> <span>|You are Responsible</span></div>
        
        <div class="menu">
            <ul>
                <li><a href="AdminFirstPage.aspx">home</a></li>
                <li class="selected"><a href="#">USERS IN ACTIVE</a></li>
                <li><a href="AllEvents.aspx">ALL EVENT</a></li>
                <li><a href="MyMessages.aspx">MESSAGE</a></li>
                <li></li>
                <li></li>
            </ul>
           
         </div>
         
            
        </div> 
  </div><!-- End of Header-->

<div id="wrap">

  <div class="top_slogan">
&nbsp;how it works.<br />  
       <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Guest_Name" DataSourceID="SqlDataSource1" Height="225px" Width="567px">
           <Columns>
               
                             
               <asp:BoundField DataField="Guest_Name" HeaderText="Guest_Name" ReadOnly="True" SortExpression="Guest_Name" />
               <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
               <asp:BoundField DataField="Phone_Number" HeaderText="Phone_Number" SortExpression="Phone_Number" />
               <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
               <asp:TemplateField>
			<ItemTemplate>
				<asp:LinkButton ID="DeleteBtn" runat="server" CommandName="Delete"
				OnClientClick="return isDelete();">Delete
				</asp:LinkButton>
			</ItemTemplate>
		</asp:TemplateField>
              
           </Columns>
       </asp:GridView>
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
           DeleteCommand="DELETE FROM [Users] WHERE [Guest_Name]=@Guest_Name; DELETE FROM [Events] WHERE Guest_Name=@Guest_Name;"
            SelectCommand="SELECT * FROM [Users]">
           <DeleteParameters>
               <asp:Parameter Name="Id" Type="Int32" />
           </DeleteParameters>
       </asp:SqlDataSource>

  <h4>All Users</h4></div>	
    
   <div class="main_content">
      
 
   </div>
  
   
</div>
    


    <div class="footer">
       <div class="footer_right">
           <asp:LinkButton ID="signout" runat="server"><h4>Sign Out</h4></asp:LinkButton></div> 
    </div>

    <div class="right_ass"> 

    </div>

    </form>
    <script type="text/javascript">
        function isDelete() {
            return confirm("Do you want to delete this row ? cautios: you will all his events");
        }
	</script>
</body>
</html>
