<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html>
	
<head>
	<title>The Login</title>
		<meta charset="utf-8">
		<link href="css/Login.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<!--webfonts-->
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:600italic,400,300,600,700' rel='stylesheet' type='text/css'>
		<!--//webfonts-->
</head>
<body>
	
				 <!-----start-main---->
				<div class="login-form">
					<div class="head">
						<img src="images/mem2.jpg" alt=""/>
						
					</div>
				<form runat="server">
					<div>
						
                        
                        <input id="input_name" runat="server" type="text" placeholder="User Name" name="input_name" max="49" />
                    </div>
					<div>
						
                       <input id="input_pass" runat="server" type="password" placeholder="Password" name="input_pass" />
                       </div> <asp:CheckBox ID="Check1" runat="server" Text="Remember Me" />
					<div class="p-container">
								 
                        &nbsp;<asp:Button ID="LOogin" runat="server" Text="Log In" Height="52px" OnClick="LOogin_Click" Width="120px" />
							
                    

					</div>
                    <div class="copy-right">
						<p>
                            <asp:LinkButton ID="LinkButton2" runat="server" BorderStyle="Solid" Height="18px" PostBackUrl="~/OpinningPage.aspx" Width="51px">HOME</asp:LinkButton>
                        </p> 
					</div>
				</form>
			</div>
			<!--//End-login-form-->
		  <!-----start-copyright---->
    
				<!-----//end-copyright---->
		 		
</body>
</html>