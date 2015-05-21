<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyMessages.aspx.cs" Inherits="Admin_MyMessages" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="author" content="CSS" />

<title>Web Administrator</title>
<link rel="stylesheet" type="text/css" media="all" href="../css/styleAdmin.css" />
<link rel="stylesheet" href="prettyphoto/prettyPhoto.css" type="text/css" media="screen" charset="utf-8" />
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
                <li><a href="AllUsers.aspx">USERS IN ACTIVE</a></li>
                <li><a href="AllEvents.aspx">ALL EVENT</a></li>
                <li class="selected"><a href="#">MESSAGE</a></li>
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
            
       </div>
   </div>
   
   
   <div class="main_content">
       <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal" OnDeleteCommand="DataList1_DeleteCommand">
           <ItemTemplate>
               <div class="pricing-table">
                   <div class="pricing-table-header">
               <h2> Sender:</h2>
               <asp:Label ID="SenderLabel" runat="server" Text='<%# Eval("Sender") %>' />
             <br />
                       <strong>Email</strong>
                      <span> <asp:Label ID="email" runat="server" CssClass="pricing-table-space" Text='<%# Eval("Email") %>' /></span>
                       <br />
               <asp:Label ID="sendingDateLabel" runat="server" Text='<%# Eval("SendingDate") %>' />
                       <br />
               
               </div>

               <br />
                   <strong>Content:</strong>
                     <p>  <asp:Label ID="ContentLabel" CssClass="labelclass" runat="server" Text='<%# Eval("Content") %>' /></p>
                   <br />
               
                   <asp:Button ID="deleter" CssClass="button" runat="server" Text="Delete Message" CommandName="Delete" />
                  <p></p>
                
                   <br />

            </div>
<br />
           </ItemTemplate>
       </asp:DataList>

       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
           DeleteCommand="DELETE FROM [Messages] WHERE [Id]=@Id"
           SelectCommand="SELECT * FROM [Messages]">
           <DeleteParameters>
               <asp:Parameter Type="Int16" Name="Id" />
           </DeleteParameters>
       </asp:SqlDataSource>
       <div class="clear">      
   </div> 
   
</div>


        <div class="footer">
        	<div class="footer_content">
            
            <div class="footer_right">
                <ul class="social_icons"></ul> <asp:LinkButton ID="LinkButton2" runat="server"><h4>Sign Out</h4> </asp:LinkButton>
                
                
            </div>
           <div class="clear"></div>
           </div>
        </div>


    </form>


</body>
</html>
