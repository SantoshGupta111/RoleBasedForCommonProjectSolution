<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" Inherits="UIExecute.Account.changepassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div >
 <table class="registration-table" >
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
            <td width="100%" colspan="2">
            
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
                Old Password</td>
           <td style="font-weight: 700">
                <asp:TextBox ID="txtOldPassword" TextMode="Password" runat="server" BackColor="#FFFFCC" 
                    Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="Validate" SetFocusOnError="true" ControlToValidate="txtOldPassword" ForeColor="Red" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txtNewPassword" SetFocusOnError="true" ValidationGroup="Validate" runat="server" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="Validate" ControlToValidate="txtConfirmPassword" ForeColor="Red" SetFocusOnError="true" runat="server" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center">
                &nbsp;</td>
            <td align="center">
                &nbsp;</td>
            <td align="left">
            <div style="margin-left:40px;">
                <asp:Button ID="btnSubmit" runat="server" BackColor="#F0F0F0" OnClick="Submit" Text="Submit" BorderColor="White" BorderStyle="Groove" Font-Bold="True" ForeColor="Black" Width="80px" ValidationGroup="Validate" />
                <asp:Button ID="btncancel" runat="server" BackColor="#F0F0F0" OnClick="Cancel" Text="Cancel" BorderColor="White" BorderStyle="Groove" Font-Bold="True" ForeColor="Black" Width="80px" />
                    </div>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:CompareValidator ID="CompareValidator1" ControlToCompare="txtNewPassword" 
                    SetFocusOnError="true" ValidationGroup="Validate" ForeColor="Red" ControlToValidate="txtConfirmPassword" runat="server" ErrorMessage="CompareValidator">Password should be same new & confirm </asp:CompareValidator>
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
