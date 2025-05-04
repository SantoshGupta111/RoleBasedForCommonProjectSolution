<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Updatemainmenu.aspx.cs" Inherits="UIExecute.Menu.Updatemainmenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .form-container {
            max-width: 100%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            
        }

        .form-container h2 {
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input[type="text"],
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-group input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-group input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div class="form-container">
 <center> <h1> Update Main Menu Form</h1></center> 

<table class="form-group" border='0' width='70%' border='1' cellpadding='0' cellspacing='0' align='center'>
    <div class="form-group">
<tr>
    <td align='center'>&nbsp;</td>
    <td align='center'>
        <asp:HiddenField ID="hiddenMainMenuID" runat="server" />

    </td>
    <td>
        &nbsp;</td>
    <td>
        <asp:Label ID="lblmsg" ForeColor="Red" runat="server" Text=""></asp:Label>
         
    </td>
</tr>
        </div>

    
    
         
   
    <tr>
    <td align='center'>&nbsp;</td>
    <td align='center'>&nbsp;</td>
    <td>
        &nbsp;</td>
    <td>
        &nbsp;</td>
</tr>
      
    

<tr>
    <td align='right' colspan="2" >Menu Name</td>
    <td>
        &nbsp;</td>
    <td>
        <asp:TextBox ID="txtmenuname" CssClass="form-group textarea"  runat="server"></asp:TextBox>

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
    <td align='right' colspan="2" >Role Name:</td>
    <td>
        &nbsp;</td>
    <td>
          <asp:DropDownList ID="ddlrole" runat="server" Width="150px">
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
    <td align='right' colspan="2">Menu Url</td>
    <td>
        &nbsp;</td>
    <td>
           <asp:DropDownList  ID="ddlmenuurl" runat="server" Width="80%" Height="30px">
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
    <td align='center'>&nbsp;</td>
    <td>
        &nbsp;</td>
    <td>
        &nbsp;</td>
</tr>
         
<tr>
    <td align='right' colspan="2">Menu Description</td>
    <td>
        &nbsp;</td>
    <td>
        <asp:TextBox ID="txtmenudescription" runat="server" TextMode="MultiLine"></asp:TextBox>

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
        <asp:DropDownList ID="ddlmenudisplaysequence" runat="server" Width="100px" Height="30px">
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
    <td align='right'>Show Is Active:</td>
    <td>
        &nbsp;</td>
    <td align='left'>
        
           
               <asp:RadioButtonList ID="radiomenuisactie" runat="server" 
                    RepeatDirection="Horizontal" Width="100%">
                <asp:ListItem  Value="Published">Published</asp:ListItem>
                <asp:ListItem  Value="Hidden">Hidden</asp:ListItem>
                </asp:RadioButtonList>
           

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
         <div class="form-container">
                <asp:Button ID="btnView" runat="server" Text="View" />
                <asp:Button ID="btnedit" runat="server" Text="Edit" />
                <asp:Button ID="btndelete" runat="server" Text="Delete" />
                <asp:Button ID="btninsert" runat="server" Text="Insert" />

            </div>

    </td>
</tr>
        

         

</table>

</div>

</asp:Content>
