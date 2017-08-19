<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ServiceConsume.Default" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Calendar</title>
    <link href="Content/StyleLayout.css" rel="stylesheet" />

    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery-3.1.1.js"></script>
    <link href="Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src="Scripts/jquery-ui-1.12.1.js"></script>

    <script src="Scripts/Calendar.js"></script>

    <style>
        color-profile::backdrop = "blue";

        background-color: deepskyblue;
    </style>

</head>
<body>
    <form id="form1" runat="server">
<div class="ColourBkGrd"> 
<div class="Page"> 
<div class="CentreBox1"> 
    <center> 
        <h1><u><asp:Label ID="Label1" runat="server" ForeColor="#0066FF" Text="Calendar"></asp:Label>
        </u></h1> <br /> 
    <table>
        <tr>
            <td>ID</td>
            <td><asp:TextBox runat="server" ID="txtID" BorderColor="#0066FF"></asp:TextBox></td>
        </tr>       
        <tr>
            <td>Date</td>
            <td><asp:TextBox runat="server" ID="txtDate" BorderColor="#0066FF"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Event</td>
            <td><asp:TextBox runat="server" ID="txtEvent" BorderColor="#0066FF"></asp:TextBox></td>
        </tr>

    </table> <br /> 
        <asp:Button runat="server" ID="btnInsert" OnClick="btnInsert_Click" Text="Insert" BackColor="#0066FF" ForeColor="White" />
        <asp:Button runat="server" ID="btnUpdate" OnClick="btnUpdate_Click" Text="Update" BackColor="#0066FF" ForeColor="White" />
        <asp:Button runat="server" ID="btnDelete" OnClick="btnDelete_Click" Text="Delete" BackColor="#0066FF" ForeColor="White" />
        <asp:Button runat="server" ID="btnSelect" OnClick="btnSelect_Click" Text="Select" BackColor="#0066FF" ForeColor="White" />
    
        <p>
        <asp:Label runat="server" id="lblMessage" ForeColor="#0066FF"></asp:Label>
        </p>
        </center> 
        </div> 
        </div>
        </div>
    </form>
</body>
</html>