<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signingup.aspx.cs" Inherits="signingup" %>
<html>
  <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up Form</title>
        <link rel="stylesheet" href="css/signup.css">
        <link href='http://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/signup.css">
    </head>
    <body>

        <form id="form1" runat="server">
      
        <h1>Sign Up</h1>
        
        <fieldset>
           
            <legend><span class="number">1</span>Your basic info</legend>
         
          
          <label for="name">Name:</label>
            <input id="name" name="Name" placeholder="Your Name" type="text" value="" runat="server">

&nbsp;<label for="mail">Email:</label>
            <input id="mail" name="email" placeholder="Your EMAIL" type="text" value="" runat="server">

             <label for="name">Phone Number:</label>
             <input id="fone" name="Phone" placeholder="Phone Number" type="text" value="" runat="server">
            
            <label for="name">BirthDay:</label>
            <input id="birthday" name="Birthday" placeholder="1/1/9 for example" type="text" value="" runat="server" autocomplete="off">

            <label for="password">Password:</label>
             <input id="pass" name="Password" placeholder="Password Here" value="" type="password" runat="server">
&nbsp;</fieldset>
           
            <asp:Button ID="Signup" runat="server" Height="59px" Text="Sign Up" Width="93%" BorderColor="#FFFFCC" CssClass="number" Font-Size="Medium" OnClick="Signup_Click" OnClientClick="return validate()" />
            <br />
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/MainPage.aspx">HOME</asp:LinkButton>
        </form>
      <script>
function validate() {
    var name = document.getElementById('name');
    var mail = document.getElementById('mail');
    var fone = document.getElementById("fone");
    var pass = document.getElementById('pass');
    var b = document.getElementById("birthday");
    if (name.value == "" || name.value == null) {
        alert(" please insert your name");
        name.focus();
        return false;
    }
    if (b.value == "" || b.value == null) {
        alert(" please insert Birthday");
        name.focus();
        return false;
    }
    if (mail.value == "" || mail.value == null) {
        alert("email needed!");
        mail.focus();
        return false;
    }
    if (fone.value == "" || fone == null) {
        alert("Phone Number needed");
        fone.focus();
        return false;
    }
    if (pass.value == "" || pass.value == null) {
        alert("Fill in your Password DUMB");
        pass.focus();
        return false;
    }
    //input check. and for now data validation
    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    if (re.test(mail.value) == false) {
        mail.focus();
        alert("you would rather intsert a valid email!");
        return false;
    }
    //password validation
    
    if (pass.value.length < 6  )
    {
        pass.focus();
        alert("Password more than 6");
        return false;
    }
    //phone number validation
    var phoneno = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
    if (!fone.value.match(phoneno)) {

        fone.style.backgroundColor = "red";
        alert("Valid phone number please : [xxx-xxx-xxxx]");
        return false;
    }

    return true;
}
</script>

    </body>
</html>