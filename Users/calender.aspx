<%@ Page Title="" Language="C#" MasterPageFile="~/Users/UserMasterPage.master" AutoEventWireup="true" CodeFile="calender.aspx.cs" Inherits="calender" %>


    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1"  Runat="Server">
        
       
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>MyCalender</title>
        <!--    <link href='http://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'> -->

            <link rel="stylesheet" href="../css/TableEvents.css">
        
        

            <div class='container'>

                <asp:DataList ID="DataList1" DataKeyField="Id" runat="server" DataSourceID="SqlDataSource1" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" RepeatColumns="20"
                    OnDeleteCommand="DataList1_DeleteCommand" style="direction: ltr" 
                    OnCancelCommand="DataList1_CancelCommand" 
                    OnEditCommand="DataList1_EditCommand" OnUpdateCommand="DataList1_UpdateCommand" CellPadding="1" RepeatDirection="Horizontal">
                  
                    <EditItemTemplate>
                        <div class="silver">
                            <asp:TextBox ID="type" runat="server" Text='<%# Eval("Event_Type") %>'></asp:TextBox>
                            <br />


                            <h2>Starts at:</h2>
                            <div class="Timedate>">
                                <asp:TextBox ID="date" runat="server" Text='<%# Eval("Date", "{0:d/M/yyyy hh:mm:ss tt}") %>'></asp:TextBox>
                            </div>
                            <br />
                            <span >Long:</span>
                            <asp:TextBox ID="length" runat="server" Text='<%# Eval("Length") %>' MaxLength="1"></asp:TextBox>


                            <asp:LinkButton ID="cencel" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                            <asp:LinkButton ID="update" runat="server" OnClick="update_Click" OnClientClick="return validate()" CommandName="Update">Update</asp:LinkButton>
                        </div>

                    </EditItemTemplate>
                    <ItemTemplate>

                        <div class="silver">
                            
                            <asp:Label ID="Event_TypeLabel" CssClass="h1" runat="server" Text='<%# Eval("Event_Type") %>' />
                            <asp:Label ID="Id_label" runat="server" Visible="false" Text='<%# Eval("Id") %>' />
                            <hr />
                            <h2>Starts at:</h2>
                            
                            <div class="submenu-opened">
                                <asp:Label ID="Date_time" runat="server" Text='<%# Eval("Date") %>' />
                            </div>
                            <span class="span">you got: </span>
                            <asp:Label ID="LengthLabel" CssClass="label" runat="server" Text='<%# Eval("Length") %>' />
                            <br />
                            <h3>HOURS</h3>


                            
                                <asp:Button ID="edit" runat="server" Text="Edit Event" CommandName="edit"  CssClass="button" OnClick="edit_Click"/>
                            
                                <asp:Button ID="deleter" runat="server" Text="Delete Event" CommandName="delete" />
                            <hr />

                        </div>
                    </ItemTemplate>

                   
                    
                </asp:DataList>
<asp:Label ID="msg" runat="server" Text="msg" Visible="false"></asp:Label>


                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [Id], [Event_Type], [Date], [Length] FROM [Events] WHERE ([Guest_Name] = @Guest_Name)" 
                    
                    UpdateCommand="UPDATE [Events] SET [Event_Type] = @Event_Type, [Date] = @Date,[Length]=@Length WHERE [Id] = @Id"
                   
                     DeleteCommand="DELETE FROM [Events] WHERE [Id]=@Id">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="NULL" Name="Guest_Name" SessionField="Name" Type="String" />
                    </SelectParameters>
                    
                    <DeleteParameters>
                        <asp:Parameter Type="Int32" Name="Id" />
                    </DeleteParameters>
                    
                    <UpdateParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                        <asp:Parameter Name="Event_Type" Type="String" />
                        <asp:Parameter Name="Date" Type="DateTime" />
                        <asp:Parameter Name="Length" Type="Int16" />
                    </UpdateParameters>
                </asp:SqlDataSource>


                <!--<div class='silver'>
    <h1>Event</h1>
    <h2>Date Time</h2>
    <div class='Timedate'></div>
    <p>Number of Courses</p>
    <span>4</span>
    <button>Select Plan</button>
  </div>-->

            </div>

            <script type="text/javascript">
                function validate() {
                    var length = document.getElementById("length");
                    var type = document.getElementById("type");
                    var date = document.getElementById("date");

                    var re = "/^([0-2]\d|3[01])-(0[1-9]|1[0-2])-\d{4} (0\d|1[01]):[0-5]\d:[0-5]\d$/";
                    //           dd -           MM      -       yyyy           hh     :   mm  :   ss
                    if (!re.test(date.value)) {
                        alert("valid date please");
                        return false;
                    }
                    var r=/^[0-8]+$/;
                    if (!r.test(length.value)) {
                        alert("valid number between 1- 8")
                        return false;
                    }
                    var n = type.value;
                    if (n != "Party" && n != "Wedding" && n != "Holiday" && n != "Birthday" && n != "Easter") {
                        alert("invalid type");
                        return false;
                    }
                    return true;

                }
                
            </script>
        
       
</asp:Content>
  