<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainPage.aspx.cs" Inherits="MainPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Sultannate</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="css/default.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" href="MainPageMenu.css"/>
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="MainPageMenu.js" type="text/javascript"></script>

<script src="js/popingup.js" type="text/javascript"></script>
</head>
<body>
<div id="header">
  <h1>Your Next Event - About Us</h1>
  <h2>&nbsp;</h2>
</div>
    <div style="clear: both;">&nbsp;</div>

    <div class="content_background">
        
<div id='menu1'>
<ul>
   <li><h1><a href="OpinningPage.aspx">Home</a></h1></li>
    </ul>
</div>
        
        <div id="content">


            <div id="colTwo">
                <h2>Welcome to EventCusto.com!</h2>

                <p>
                    &nbsp;
                </p>

                <p>Suspendisse potenti. Donec nulla est, laoreet quis, pellentesque in, congue in, dui. Nunc rhoncus placerat augue. Donec justo odio, eleifend varius, volutpat venenatis, sagittis ut, orci. Donec nulla est, laoreet quis, pellentesque in, congue in, dui. Nunc rhoncus placerat augue. Donec justo odio, eleifend varius, volutpat venenatis, sagittis ut, orci. Nullam et orci in erat viverra ornare. Nunc pellentesque. Sed vestibulum blandit nisl. Quisque elementum convallis purus. Quisque pellentesque semper massa.</p>
                <ul>
                    <li><a href="#">Blallllllllll.</a></li>
                    <li><a href="#">his party.</a></li>
                    <li><a href="#">aaaaaaaaaaaaaaaaaaaaaaaaa.</a></li>
                    <li><a href="#">bbbbbbbbbbbbbbbbbbbbbbbb.</a></li>
                    <li><a href="#">bbbbbbbbbbbbvvvvvvvvvvvv.</a></li>
                </ul>
                <p>Vivamus sagittis bibendum erat. Curabitur malesuada turpis nec ante. Suspendisse quis felis. Suspendisse potenti. Nullam et orci in erat viverra ornare. Nunc pellentesque. Sed vestibulum blandit nisl. Quisque elementum convallis purus. Sed vestibulum blandit nisl. Quisque elementum convallis purus. Quisque pellentesque semper massa.</p>
            </div>
            <div style="clear: both;">&nbsp;</div>
        </div>



    </div>
<div id="footer">
  <p>Copyright &copy;Coming Soon Sultevents.com. Designed by<strong>Sultan Khalaily 0502570160</strong></p>
</div>

<!-- Popup Div Starts Here -->
    
<!-- Popup Div Ends Here -->

    <script type="text/javascript">
        $(document).ready(function () {
            $('#bg').blurjs({
                source: 'body',
                radius: 30,
                overlay: 'rgba(0, 0, 0, .2)'
            });
        });

        function validate() {
            //input filling validition
            var inpObj = document.getElementById("name");
            var emeel = document.getElementById("email");
            var meseg = document.getElementById("msg");
            if (inpObj.value==null || inpObj.value=="") {
                alert("may you Fill your name,stupid ass");
                inpObj.style.backgroundColor = "yellow";
                return false;
            }
            if (emeel.value == null || emeel.value == "") {
                alert("may you fill you bloody email!");
                emeel.style.backgroundColor = "yellow";
                return false;
            }
            if (meseg.value == null || meseg.value == "") {
                alert("You are about to sending a message without a message!!");
                emeel.style.backgroundColor = "yellow";
                return false;
            }//input check. and for now data validation
            var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
            if (re.test(emeel.value) == false) {
                emeel.focus();
                alert("you rather intsert a valid email!");
                return false;
            }
                

            if (confirm("are you sure that your message does not imply any sexual content?"))
                return true;
        }
    </script>
</body>
</html>
