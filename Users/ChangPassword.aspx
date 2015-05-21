<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangPassword.aspx.cs" Inherits="Users_ChangPassword" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>changing password</title>
        
        <!-- The stylesheet -->
        <link rel="stylesheet" href="../css/changepass.css" />
        
        </head>
    
    <body>

        <div id="main">
        	
        	<h1>Changing Password</h1>
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"><h2>Insert a correct Password</h2></asp:Label>
        	<form class="" method="post" runat="server" action="">
        		
        		<div class="row email">
	    			<input type="password" id="oldpass" name="oldpass" placeholder="Old Password" runat="server"/>
        		</div>
        		
        		<div class="row pass">
        			<input type="password" id="password1" name="password1" placeholder="Password" runat="server" />
        		</div>
        		
        		<div class="row pass">
        			<input type="password" id="password2" name="password2" placeholder="Repeat Password" runat="server"  />
        		</div>
        		
        		<!-- The rotating arrow -->
        		<div class="arrowCap"></div>
        		<div class="arrow"></div>
        		
        		<p class="meterText">Password Meter</p>
        		
                <asp:Button ID="chageit" runat="server" Text="Change" OnClientClick="return validate()" OnClick="chageit_Click" />
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Users/calender.aspx"><h1>Back</h1></asp:LinkButton>
                
        		
        	</form>
        </div>
        
        <footer>
	        
            <a class="al3xis"> Make a good password </a>
        </footer>
        
        <!-- JavaScript -->
        <script>
            function validate() {
                var p1 = document.getElementById('password1');
                var p2 = document.getElementById('password2');

                if (p1.value == null || p1.value == "") {
                    p1.focus()
                    alert("Where is you password");
                    return false;
                }
                if (p1.value.length < 6 || p1.value != p2.value) {
                    p1.focus();
                    p2.focus();
                    alert("insert proper password and equal");
                    return false;
                }
                return true;
            }
        </script>

		     
    </body>
</html>