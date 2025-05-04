<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="UIExecute.Account.ContactUs" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" tagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 148px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>

        <table class="registration-table">

            <tr>
                <td width="15%">

                </td>

                <td width="15%">

                    Contact Us</td>
                <td width="15%">

                </td>
                <td width="15%">

                </td>

            </tr>

            <tr>
                <td width="15%">

                    &nbsp;</td>

                <td width="15%">

                    &nbsp;</td>
                <td width="15%">

                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
                <td width="15%">

                    &nbsp;</td>

            </tr>

            <tr>
                <td width="15%">

                    &nbsp;</td>

                <td width="15%">

                    Your Name</td>
                <td width="15%">

                    <asp:TextBox ID="txtname" runat="server"  Width="200px"></asp:TextBox>
                </td>
                <td width="15%">

                    &nbsp;</td>

            </tr>


            <tr>
                <td width="15%">

                    &nbsp;</td>

                <td width="15%">

                    Your Email ID</td>
                <td width="15%">

                    <asp:TextBox ID="txtemailid" runat="server" width="200px"></asp:TextBox>
                </td>
                <td width="15%">

                    &nbsp;</td>

            </tr>


            <tr>
                <td width="15%">

                    &nbsp;</td>

                <td width="15%">

                    Subject</td>
                <td width="15%">

                    <asp:TextBox ID="txtsubject" runat="server" width="200px"></asp:TextBox>
                </td>
                <td width="15%">

                    &nbsp;</td>

            </tr>


            <tr>
                <td width="15%">

                    &nbsp;</td>

                <td width="15%">

                    Your Query:</td>
                <td width="15%">

                    <asp:TextBox ID="txtquery" Height="50px" width="200px" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td width="15%">

                    &nbsp;</td>

            </tr>


            <tr>
                <td width="15%">

                    &nbsp;</td>

                <td width="15%">

                    &nbsp;</td>
                <td width="15%">

                    &nbsp;</td>
                <td width="15%">

                    &nbsp;</td>

            </tr>


            <tr>
                <td width="15%">

                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
                </td>

                <td width="15%">

                    &nbsp;</td>
                <td width="15%">

                    <asp:Button ID="btnSend" runat="server" Text="Send you query" style="font-weight: 700" OnClick="btnSend_Click" />
                </td>
                <td width="15%">

                    &nbsp;</td>

            </tr>


            <tr>
                <td width="15%">

                    &nbsp;</td>

                <td width="15%">

                    &nbsp;</td>
                <td width="15%">

                    <asp:Label ID="lblmsg" ForeColor="Red" runat="server" Text="Label"></asp:Label>
                </td>
                <td width="15%">

                    &nbsp;</td>

            </tr>


            <tr>
                <td width="15%">

                    &nbsp;</td>

                <td width="15%">

                    &nbsp;</td>
                <td width="15%">

                    &nbsp;</td>
                <td width="15%">

                    &nbsp;</td>

            </tr>



        </table>

    </div>
</asp:Content>
