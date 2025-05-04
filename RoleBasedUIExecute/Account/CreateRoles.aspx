<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="CreateRoles.aspx.cs" Inherits="UIExecute.Account.CreateRoles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div >

        <table border='0' width='480px' cellpadding='0' cellspacing='0' align='center'>
<center><tr>
   <td><h1> Create Roles Form For Users</h1></td>
</tr><center>

<table border='0' width='480px' cellpadding='0' cellspacing='0' align='center'>
<tr>
    <td align='center'>&nbsp;</td>
    <td>
        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>

    </td>
</tr>
<tr>
    <td align='center'>&nbsp;</td>
    <td>
        &nbsp;</td>
</tr>
<tr>
    <td align='center'>Role Name:</td>
    <td>
        <asp:TextBox ID="txtrolename" runat="server" placeholder="Enter First Name"></asp:TextBox>
      <%--  <input type='text' name='name'>--%>

    </td>
</tr>
         
<table border='0' cellpadding='0' cellspacing='0' width='480px' align='center'>
<tr>
    <td align='center'>
        &nbsp;</tr>
<tr>
    <td align='left'>
       Details: </tr>
<tr>
    <td align='left'>

        <div>
            <asp:GridView ID="grdrole" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />

            </asp:GridView>
           
        </div>
     </tr>
<tr>
    <td align='center'>
        <asp:Button ID="btncreaterole" runat="server" Text="Create Role" />

        <%--<input type='submit' name='REGISTER' value="register"></td>--%>
</tr>
<tr>
    <td align='center'>&nbsp;</td>
</tr>
</table>
</table>

</table>

    </div>

</asp:Content>
