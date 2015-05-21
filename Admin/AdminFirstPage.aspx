<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminFirstPage.aspx.cs" Inherits="AdminFirstPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Web Administrator</title>
<link rel="stylesheet" type="text/css" media="all" href="../css/styleAdmin.css" />
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'/>
   
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.min.js"></script>
   
</head>
<body>
    <form id="form1" runat="server">
  <div id="header">
        <div class="header_content">
      
        <div class="logo"><a href="index.html">ADMIN</a> <span> <asp:Label ID="Label1" runat="server" Visible="false" Text="Label"></asp:Label>|You are Responsible</span></div>
        
        <div class="menu">
            <ul>
                <li class="selected"><a href="#">home</a></li>
                <li><a href="AllUsers.aspx">USERS IN ACTIVE</a></li>
                <li><a href="AllEvents.aspx">ALL EVENT</a></li>
                <li><a href="MyMessages.aspx">MESSAGE</a></li>
                <li><a href="allNews.aspx">All News</a></li> 
                
               
            </ul>
         </div>
         
        </div> 
  </div><!-- End of Header-->

<div id="wrap">

  <div class="top_slogan">
&nbsp;how it works.  
            </div>

    
        <div class="smart-green">
    <h1>News Section
        <span>Please fill all the texts in the fields.</span>
    </h1>
       
    <label>
        <span>Header :</span>
        <input id="headline" type="text" name="headline" value="" placeholder="Header" runat="server"/>
        <span>News:</span>
        <textarea id="content" name="yournews" placeholder="Your News" runat="server"></textarea>
    </label>
    
        <label>
            <span>&nbsp;</span>

            <asp:Button ID="updatenews" runat="server" Text="Update" CssClass="button" OnClientClick="return popthatshit()" OnClick="updatenews_Click" EnableTheming="False" />

        </label>  

        </div> 

    <div class="smart-green">
    <h1>Recent Updates 
        <span>Please fill all the texts in the fields.</span>
    </h1>
       
    <label>
        <span>Header :</span>
        <input id="Text1" type="text" name="headline" value="" placeholder="Header" runat="server"/>
        <span>Write Somthing</span>
        <textarea id="Textarea1" name="yournews" placeholder="Your News" runat="server"></textarea>
    </label>
    <asp:DropDownList ID="List1" runat="server">
            <asp:ListItem>FirstRow</asp:ListItem>
            <asp:ListItem>SecondRow</asp:ListItem>
            <asp:ListItem>ThirdRow</asp:ListItem>
        <asp:ListItem>FourthRow</asp:ListItem>
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
        <hr />
     <label>
        <span>&nbsp;</span> 
         
         <asp:Button ID="post" runat="server" Text="Post" CssClass="button" OnClientClick="return checkit()" OnClick="post_Click" />
    </label>
        
            
</div>
    <div class="smart-green">
        <h2>Change the pictire on the front Page</h2>
        <asp:FileUpload ID="imgUpload1" runat="server" />&nbsp;<br />
        <asp:Button ID="accept" runat="server" Text="Accept" CssClass="button" OnClick="accept_Click" />
    </div>

    <hr />
    <br />
   </div>
   
   
  <div class="footer">
        	<div class="footer_content">
            
            <div class="footer_right">
<ul class="social_icons">
                <li></li>
                </ul>
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><h4>Sign Out</h4></asp:LinkButton>
                
            </div>
           <div class="clear"></div>
           </div>
        </div>
   <!-- pop up-->
    
        
   <!-- boby up -->
</form>
    <script type="text/javascript">

        function popthatshit() {
            var h=document.getElementById("headline");
            var t = document.getElementById("content");
            if (h.value == null || h.value == "") {
                
                h.blur();
                return false;
            }
                ;
            if (t.value == null || t.value == "") {
                t.focus();
                return false;
            }
               
                var r = confirm("are you sure it is clean neat without strong language");
                if (r == true) {
                    h.value = "";
                    t.value = "";
                    return true;
                }
                    
                else return false;

        }
        function checkit() {
            var r = document.getElementById("Text1");
            var c = document.getElementById("Textarea1");
            if (r.value == null || r.value == "") {
                r.focus();
                return false;
            }
            if (c.value == null || c.value == "") {
                c.focus();
                return false;
           
            }
            return true;
        }

        

    </script>

</body>
</html>
