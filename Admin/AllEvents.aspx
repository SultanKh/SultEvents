<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AllEvents.aspx.cs" Inherits="Admin_AllEvents" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Administrator | Events</title>
<link rel="stylesheet" type="text/css" media="all" href="../css/styleAdmin.css" />
<link rel="stylesheet" href="prettyphoto/prettyPhoto.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'/>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
<script type="text/javascript" charset="utf-8">
var $ = jQuery.noConflict();
  $(window).load(function() {
    $('.flexslider').flexslider({
          animation: "slide"
    });
  });
</script>
</head>
<body>

    <form id="form1" runat="server">

  <div id="header">
        <div class="header_content">
      
        <div class="logo"><a href="AdminManPage.aspx">ADMIN</a> <span>|You are Responsible</span></div>
        
        <div class="menu">
            <ul>
                <li><a href="AdminManPage.aspx">home</a></li>
                <li><a href="AllUsers.aspx">USERS IN ACTIVE</a></li>
                <li class="selected"><a href="#">ALL EVENT</a></li>
                <li><a href="MyMessages.aspx">MESSAGE</a></li>
                <li></li> 
                <li></li>
                <li>signou</li>
            </ul>
         </div>
         
        </div> 
  </div><!-- End of Header-->

<div id="wrap">

  <div class="top_slogan">
&nbsp;how it works.
            <asp:GridView ID="GridView1"  runat="server"  AllowSorting="True" AutoGenerateColumns="false" DataKeyNames="Id" DataSourceID="SqlDataSource1" Height="228px" Width="662px">
    <Columns>
        
        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="Guest_Name" HeaderText="Guest_Name" SortExpression="Guest_Name" />
        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
        <asp:BoundField DataField="Event_Type" HeaderText="Event_Type" SortExpression="Event_Type" />
        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
        <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
        
        <asp:TemplateField>
			<ItemTemplate>
				<asp:LinkButton ID="DeleteBtn" runat="server" CommandName="Delete"
				OnClientClick="return isDelete();">Delete
				</asp:LinkButton>
			</ItemTemplate>
		</asp:TemplateField>

       </Columns>
       </asp:GridView><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
           SelectCommand="SELECT * FROM [Events]" 
           DeleteCommand="DELETE From [Events] WHERE [Id] = @Id">
           <DeleteParameters>
               <asp:Parameter Name="Id" Type="Int32" />
           </DeleteParameters>
                      </asp:SqlDataSource>
  <div class="clear"></div>
        
            
    </div><li style="height: 79px; width: 884px">all events</li>
   </div>
   <div class="main_content">

       


        </div>
        
   
        
        

        <div class="footer">
        	<div class="footer_content">
            
            <div class="footer_right">
                <asp:LinkButton ID="LinkButton1" runat="server"><h4>Sign Out</h4></asp:LinkButton>
                <ul class="social_icons">
                <li> </li>
                    
                </ul>
            </div>
           <div class="clear"></div>
           </div>
        </div>


    </form>

    <script type="text/javascript">
        function isDelete() {
            return confirm("Do you want to delete this row ?");
        }
	</script>
</body>
</html>
