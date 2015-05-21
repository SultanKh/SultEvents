<%@ Page Language="C#" AutoEventWireup="true" CodeFile="allNews.aspx.cs" Inherits="Admin_allNews" %>

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
      
        <div class="logo"><a href="index.html">ADMIN</a> <span>|You are Responsible</span></div>
        
        <div class="menu">
            <ul>
                <li class="selected"><a href="#">home</a></li>
                <li><a href="AllUsers.aspx">USERS IN ACTIVE</a></li>
                <li><a href="AllEvents.aspx">ALL EVENT</a></li>
                <li><a href="MyMessages.aspx">MESSAGE</a></li>
                <li><a href="allNews.aspx">All News</a></li> 
                <li></li>
                <li>signou</li>
            </ul>
         </div>
         
        </div> 
  </div><!-- End of Header-->

<div id="wrap">
    
    
  <div class="top_slogan">
&nbsp;how it works.  <br />
<asp:Button ID="deleteall" runat="server" CssClass="social_icons" Text="Delete All" OnClientClick="return areyousure()" OnClick="deleteall_Click" Height="37px" Width="130px" />
            </div>
<h2> <asp:LinkButton ID="deletechecked" runat="server" OnClientClick="return shitchecked()" OnClick="deletechecked_Click">Delete Checked Records</asp:LinkButton></h2>
    <br />
    <hr />
    <asp:GridView ID="GridView1" runat="server" DataKeyNames="DateWriting" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Height="427px" Width="1214px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
           

            <asp:BoundField DataField="DateWriting" HeaderText="DateWriting" SortExpression="DateWriting"></asp:BoundField>
            <asp:BoundField DataField="headline" HeaderText="headline" SortExpression="headline"></asp:BoundField>
            <asp:BoundField DataField="content" HeaderText="content" SortExpression="content"></asp:BoundField>

            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="sign1" runat="server" />
                
				<asp:LinkButton ID="DeleteBtn" runat="server" CommandName="Delete"
				OnClientClick="return isDelete();">Delete
				</asp:LinkButton>
			</ItemTemplate>
		</asp:TemplateField>

        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>




    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
        DeleteCommand="DELETE FROM [RecentUpdates] WHERE [DateWriting]=@DateWriting"
        SelectCommand="SELECT * FROM [RecentUpdates]">
        <DeleteParameters>
               <asp:Parameter Name="DateWriting" Type="DateTime" />
           </DeleteParameters>
    </asp:SqlDataSource>
</div>
   
   
  <div class="footer">
        	<div class="footer_content">
            
            <div class="footer_right">
<ul class="social_icons">
                <li></li>
                </ul>
                <asp:LinkButton ID="LinkButton2" runat="server"><h4>Sign Out</h4></asp:LinkButton>
                
            </div>
           <div class="clear"></div>
           </div>
        </div>
   <!-- pop up-->
    
        
   <!-- boby up -->
</form>
    <script type="text/javascript">
        function isDelete() {
            return confirm("Do you want to delete this row ?");
        }
        function areyousure() {
            return confirm("are you sure you want to delete all the records in the news section? , \n you still a dumb ")
        }

        function shitchecked() {
            return confirm("are you suuuuuuuuuuuuuuuuuuuuuuuure ??? ");
        }
	</script>
    
</body>
</html>
