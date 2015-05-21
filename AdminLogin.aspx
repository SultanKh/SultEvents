<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    

    <link href="css/AdminLogin.css" rel="stylesheet" type="text/css" />
   <title>Admins Only</title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<div class="grad">
		<div class="header">
			<div><span>Admin Login</span></div>
		</div>
		<br/>

		<div class="login">
        
				<input runat="server" id="name" type="text" placeholder="username" name="user" value=""/><br/>
				<input id="id" runat="server" type="password" placeholder="password - Your ID" value="" name="password"/><br />
				
		</div><asp:Button ID="HelloMotherFucker" runat="server" Text="Login" OnClientClick="return allfilled()" CssClass="login" OnClick="HelloMotherFucker_Click" />

      <h1>  <asp:LinkButton ID="back" PostBackUrl="~/OpinningPage.aspx" CssClass="grad" runat="server">Back</asp:LinkButton></h1>
            <hr /><h1><asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label></h1>
		</div>
</div>
  

    </form>
</body>
<script type="text/javascript">
    function allfilled() {
       
        var x = document.getElementById("name");
        var x1 = document.getElementById("id");
        
        if (x.value == "" || x1.value == "") {
            x.style.backgroundColor = "yellow";
            x1.style.backgroundColor = "yellow";
            x.style.color = "red";
            x1.style.color = "red";
            alert("nigga damn");
            return false;
        }
        if (isNaN(x1.value)) {
            x1.style.backgroundColor = "red";
            alert("must input a number");
            return false;
        }
        return true;
    }
</script>
</html>
