<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="CreateSubMenu.aspx.cs" Inherits="UIExecute.Menu.CreateSubMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div>

        <table border='0' width='480' cellpadding='0' cellspacing='0' align='center'>
<center><tr>
   <td><h1> Create New Sub-Menu Form</h1></td>
</tr><center>

<table border='0' width='70%' border='1' cellpadding='0' cellspacing='0' align='center'>
<tr>
    <td align='center'>&nbsp;</td>
    <td align='center'>&nbsp;</td>
    <td>
        &nbsp;</td>
    <td>
        <asp:Label ID="lblmsg" ForeColor="Red" runat="server" Text=""></asp:Label>
         
    </td>
</tr>
<tr>
    <td align='right' width="100" colspan="2" style="width: 200px">Role Name:</td>
    <td>
        &nbsp;</td>
    <td>
      <%--  <input type='text' name='name'>--%>

        <asp:DropDownList ID="ddlrole" runat="server" Width="200px" AutoPostBack="true" >
        </asp:DropDownList>

        select role</td>
</tr>
         
<tr>
    <td align='center'>&nbsp;</td>
    <td align='center'>&nbsp;</td>
    <td>
        &nbsp;</td>
    <td>
        &nbsp;</td>
</tr>
         
<tr>
    <td align='center'>&nbsp;</td>
    <td align='center'>Main Menu Name</td>
    <td>
        &nbsp;</td>
    <td>

        <asp:DropDownList ID="ddlmenuname" runat="server" Width="200px">
        </asp:DropDownList>

        display as per selected role</td>
</tr>
         
<tr>
    <td align='center'>&nbsp;</td>
    <td align='center'>&nbsp;</td>
    <td>
        &nbsp;</td>
    <td>
        &nbsp;</td>
</tr>
         
<tr>
    <td align='right' colspan="2">Sub-Menu Name</td>
    <td>
        &nbsp;</td>
    <td>
        <asp:TextBox ID="txtsubmenuname" runat="server"></asp:TextBox>

    </td>
</tr>
         
<tr>
    <td align='center'>&nbsp;</td>
    <td align='center'>&nbsp;</td>
    <td>
        &nbsp;</td>
    <td>
        &nbsp;</td>
</tr>
         
<tr>
    <td align='right' colspan="2">Sub-Menu Url</td>
    <td>
        &nbsp;</td>
    <td>
        <asp:TextBox ID="txtsubmenuurl" runat="server" Width="300px"></asp:TextBox>

    </td>
</tr>
         
<tr>
    <td align='center'>&nbsp;</td>
    <td align='center'>&nbsp;</td>
    <td>
        &nbsp;</td>
    <td>
        <asp:Label ID="lblurl" runat="server" ForeColor="Maroon" Text="i.e How to enter path for url: ../foldername/your page name "></asp:Label>
    </td>
</tr>
         
<tr>
    <td align='center'>&nbsp;</td>
    <td align='center'>&nbsp;</td>
    <td>
        &nbsp;</td>
    <td>
        &nbsp;</td>
</tr>
         
<tr>
    <td align='right' colspan="2">Sub-Menu Description</td>
    <td>
        &nbsp;</td>
    <td>
        <asp:TextBox ID="txtsubmenudescription" runat="server" TextMode="MultiLine"></asp:TextBox>

    </td>
</tr>
         
<tr>
    <td align='center'>&nbsp;</td>
    <td align='center'>&nbsp;</td>
    <td>
        &nbsp;</td>
    <td>
        &nbsp;</td>
</tr>
         
<tr>
    <td align='right' colspan="2">Display Sequence</td>
    <td>
        &nbsp;</td>
    <td>
        <asp:DropDownList ID="ddldisplaysequence" runat="server" Width="100px" Height="16px">
            <asp:ListItem Value="0">--Select Sequence--</asp:ListItem>
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="1">4</asp:ListItem>
            <asp:ListItem Value="2">5</asp:ListItem>
            <asp:ListItem Value="3">6</asp:ListItem>
            <asp:ListItem Value="3">7</asp:ListItem>
            <asp:ListItem Value="2">8</asp:ListItem>
            <asp:ListItem Value="3">9</asp:ListItem>
            <asp:ListItem Value="3">10</asp:ListItem>

        </asp:DropDownList>

    </td>
</tr>
         
<tr>
    <td align='center'>&nbsp;</td>
    <td align='center'>&nbsp;</td>
    <td>
        &nbsp;</td>
    <td>
        &nbsp;</td>
</tr>
         
<tr>
    <td align='center'>&nbsp;</td>
    <td align='right'>Is Active</td>
    <td>
        &nbsp;</td>
    <td>
        <asp:CheckBox ID="chkisactive" Checked="true" runat="server" />

    </td>
</tr>
         
<tr>
    <td align='center'>&nbsp;</td>
    <td align='center'>&nbsp;</td>
    <td>
        &nbsp;</td>
    <td>
        &nbsp;</td>
</tr>
         
<tr>
    <td align='center'>&nbsp;</td>
    <td align='center'>&nbsp;</td>
    <td>
        &nbsp;</td>
    <td>
        <asp:Button ID="btnsubmenu" runat="server" Text="Create Sub-Menu" />

    </td>
</tr>
         
<tr>
    <td align='center'>&nbsp;</td>
    <td align='center'>Detail:</td>
    <td>
        &nbsp;</td>
    <td>
        &nbsp;</td>
</tr>
         
<tr>
    <td align='left'>
            &nbsp;</td>
    <td align='left' colspan="3">
            <asp:GridView ID="grdsubmenu" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
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
           
    </td>
</tr>
         

         
<tr>
    <td align='left'>
            &nbsp;</td>
    <td align='left' colspan="3">
            &nbsp;</td>
</tr>
         

         
<tr>
    <td align='left'>
            &nbsp;</td>
    <td align='left' colspan="3">
            &nbsp;</td>
</tr>
         

         
<table border='0' cellpadding='0' cellspacing='0' width='480px' align='center'>

    
</table>
</table>

</table>

    </div>


</asp:Content>
