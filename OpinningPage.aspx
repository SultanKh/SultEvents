<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OpinningPage.aspx.cs" Inherits="OpinningPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/popupmsgcontact.css" rel="stylesheet" type="text/css"/>
    <link href="css/OpinningPage.css" rel="stylesheet" type="text/css" />
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="js/popingup.js" type="text/javascript"></script>
    <title>Greeding Page</title>
</head>
<body>
   
  <div class="line"></div>
<div class="wrapper">
  <header role="banner">
    <nav role="navigation">
      <h2><a href="#">Sultnate Events</a></h2>
      <ul class="nav-ul">
        <li><a href="#">Home</a></li>
        <li><a id="aboutus" onclick="return AlfaUser()" href="MainPage.aspx">About Us</a></li>
        <li><a href="Login.aspx">Login</a></li>
        <li><a href="signingup.aspx">Sign Up</a></li>
        <li><a id="contactus" href="#" onclick="div_show()">Contact Us</a></li>
         
      </ul>
    </nav>
  </header>
  <main role="main">
    <section class="sec-intro" role="section">
      <img id="toChange" src="~/images/ultimate-wedding.jpg" alt="" runat="server"/>
      <h1>.سلطان للرئاسة</h1>
        
    </section>
      <h3>News</h3>
    <section class="sec-boxes" role="section">
      <article class="box">
        <h1 id="NewsH1" runat="server">News</h1>
        <p id="NewsP1" runat="server">Every option should be explored and tried no matter how unpredictable, impossible, insane.</p>
        
      </article>
              
    </section>
   
      
        <section class="sec-projects" role="section">
      <hr />
      <h1>Previous Projects</h1>
      <article>
        <h1 id="first" runat="server">Neural network for Wedding</h1>
        <p id="firstp" runat="server">People from India approached us this Bla bla blaism blation blast black blasa blasis blasosa blasisi blasisiki balasoftakofitch</p>
      </article>
      <article>
        <h1 id="sec" runat="server">Best Birthdays </h1>
        <p id="secp" runat="server">For a years, since founding days of a happines, SultEvents always worked with its own operating system. In October, this was about to change. Our company got chance to rewrite lalalalalalal nbnbnbnbnb nbnbnbn nnnnnnnnnnnnnnnnnnnn hhhhhhhhhhhhhhh kj k kkkkkkkkkkk </p>
      </article>
      <article>
        <h1 id="third" runat="server">Making the real life Party</h1>
        <p id="thirdp" runat="server"> ah eheh hehe heh jerjr latest  to achieve the , this was not enough. heheheheh hhdudududu jjjj n n n nbn mckcc nn n nvnvn nfjhznbgthjssee ytou afraer lkeaving on  secenty thirty</p>
      </article>
    </section>


    <section class="sec-standards" role="section">
      <hr />
      <h1>Our Standards</h1>
      <article>
        <h1 id="four" runat="server">Excellence</h1>
        <p id="fourp" runat="server">Our goal is to give our customers the best solutions in highest aquality. Our employees strive for excellence and work hard to achieve it. Everything must work and be reliable. Great design must be both, aesthetic and functional. Product or service that pass these conditions will be everlasting.</p>
      </article>
      
    </section>
    <section class="sec-partners" role="form">
      <hr />
      <h1>Our Partners</h1>
      <div class="row">
        <div class="logo-container">
          <img src="https://lh3.googleusercontent.com/-86PXgZY43HU/AAAAAAAAAAI/AAAAAAAAAaE/vjd0zj1w6Pw/photo.jpg" alt="Google logo" />
        </div>
        <div class="logo-container">
          <img src="https://cdn0.iconfinder.com/data/icons/flowers-and-leaves/51/flower_13-256.png" alt="Apple logo" />
        </div>
        
        <div class="logo-container">
          <img src="http://cdn.mysitemyway.com/etc-mysitemyway/icons/legacy-previews/icons-256/glossy-waxed-wood-icons-food-beverage/057114-glossy-waxed-wood-icon-food-beverage-food-apple2-sc44.png" alt="Valve logo" />
        </div>
        <div class="logo-container">
          <img src="http://www.rootsre.com/wp-content/uploads/2013/02/RootsRE-icon-brown.jpg" alt="Martini" />
        </div>
        <div class="logo-container">
          <img src="http://www.veryicon.com/icon/png/Object/Dine-O-Matic%20Icons/Martini.png" alt="Lava" />
        </div>
      </div>
    </section>
  </main>
</div>
<footer>
  <nav role="navigation">
    <ul class="nav-ul">
      <li><a href="#">Home</a></li>
      <li><a id="aboutus2" onclick="return AlfaUser()" href="MainPage.aspx">About Us</a></li>
      <li><a href="AdminLogin.aspx">Login-Special</a></li>
     
      <li><a id="contactus2" href="#" onclick="div_show()">Contact Us</a></li>
        
    </ul>
  </nav>
  <p class="copy">&copy; Sultan Khalaily  0502570160</p>
</footer>
<div class="line"></div>
    



    <!-- Popup Div Starts Here -->
    <div id="abc">

        <div id="popupContact">
            <!-- Contact Us Form -->
            <form action="#" id="form" method="post" name="form" runat="server">
                <img id="close" src="images/3.png" onclick="div_hide()" />
                <h2>Contact Us</h2>
                <hr />
                <input id="name" name="name" placeholder="Name" type="text" runat="server" />
                <input id="email" name="email" placeholder="Email" type="text" runat="server" />
                <textarea id="msg" name="message" placeholder="Message" runat="server"></textarea>
                <asp:Button ID="Button1" runat="server" Text="Send" OnClick="Button1_Click" OnClientClick="return validate()" />

            </form>
        </div>

    </div>
    <!-- Popup Div Ends Here -->


    <script type="text/javascript">
        function AlfaUser() {
            var mySession = '<%=Session["Name"]%>';
            if (mySession == '') {//session does not exist ,,disable all links
                alert("you must sign in or signup");
                return false;
               
            }

            return true;
        }

       
        





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
