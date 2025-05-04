<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Site1.Master" AutoEventWireup="true" CodeBehind="changedefaultpassword.aspx.cs" Inherits="UIExecute.Account.changedefaultpassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div>
 <table width="450px"  cellpadding="4" cellspacing="4" style="border:medium solid #336699; background-image:url('Icons/lg4.jpg');">
        <tr>
            <td width="15%" style="font-weight: 700; width: 45%;" colspan="3" valign="top">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/Icons/welcome.jpg" Height="80" Width="125"/>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblLoginedName" CssClass="IconTitleHead" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="15%" style="font-weight: 700; width: 45%;" colspan="3" valign="top">
            <div id="divErrorList" runat="server" visible="true" style="height:100%; color:Red; text-align:left; width:100%;">
            <asp:Label ID="lblErrorList" runat="server" Text=""></asp:Label>
            </div>
            </td>
        </tr>
        <tr>
            <td width="3%" style="font-weight: 700">
                &nbsp;</td>
            <td width="20%" style="font-weight: 700">
                Employee Code</td>
            <td width="90%" style="font-weight: 700; width: 230px;">
                <asp:TextBox ID="txtEmployeeCode" runat="server" BackColor="#FFFFCC" ForeColor="#336699" Font-Bold="true" Enabled="false" Width="100px"></asp:TextBox>
                                                </td>
        </tr>
        <tr>
            <td style="font-weight: 700">
                &nbsp;</td>
            <td style="font-weight: 700">
                Employee Name</td>
            <td width="80%" style="font-weight: 700; width: 230px;">
                <asp:TextBox ID="txtEmployeeName" runat="server" BackColor="#FFFFCC" ForeColor="#336699" Enabled="false" Font-Bold="true" Width="200px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td colspan="3">
            <div style="height:2px; border:1px solid#336699;"></div>
            </td>
        </tr>
        <tr>
            <td style="font-weight: 700">
                &nbsp;</td>
            <td style="font-weight: 700">
                New Password</td>
            <td style="font-weight: 700">
                <asp:TextBox ID="txtNewPassword" TextMode="Password" runat="server" BackColor="#FFFFCC" 
                    Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtNewPassword" ErrorMessage="RequiredFieldValidator" 
                    SetFocusOnError="True" ValidationGroup="Validate">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="font-weight: 700">
                &nbsp;</td>
            <td style="font-weight: 700">
                Confirm Password</td>
            <td style="font-weight: 700">
                <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server" BackColor="#FFFFCC" 
                    Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtConfirmPassword" ErrorMessage="RequiredFieldValidator" 
                    SetFocusOnError="True" ValidationGroup="Validate">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center">
                &nbsp;</td>
            <td align="center">
                &nbsp;</td>
            <td align="left">
            <div style="margin-left:120px;">
                <asp:Button ID="btnSubmit" runat="server" BackColor="#F0F0F0" Text="Submit" BorderColor="White" BorderStyle="Groove" Font-Bold="True" ForeColor="Black" Width="80px" ValidationGroup="Validate" />
                
                    </div>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" 
                    ErrorMessage="Password didn't matched." SetFocusOnError="True" 
                    ValidationGroup="Validate" Font-Bold="True" Font-Size="12pt"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        
        </table>
 </div>

</asp:Content>
