<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Testing.aspx.cs" Inherits="Testing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <script src="../js/FirstUserPage.js" type="text/javascript"></script>
    
   <link href="../css/Testing.css" rel="stylesheet" type="text/css" /> 
 <link rel="stylesheet" href="../css/FisrtUserPage.css" type="text/css" />
   

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="blur_bg">
            <label>
                <select>
                    <option value="1">TODOS</option>
                    <option value="2">Algunos</option>
                    <option value="3">Burno</option>
                </select>
            </label>
        </div>

        <div class='images'>
            <img class='image' src='http://placekitten.com/g/400/380' />
            <img class='image' src='http://placekitten.com/g/400/410' />
            <img class='image' src='http://placekitten.com/g/400/390' />
            <img class='image' src='http://placekitten.com/g/405/410' />
            <img class='image' src='http://placekitten.com/g/400/425' />
        </div>
    </form>
</body>
</html>
