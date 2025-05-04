<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Mainmenudetails.aspx.cs" Inherits="UIExecute.Menu.DataDetails.Mainmenudetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../cssStyle/StyleSheetMaster.css" rel="stylesheet" />

     <style>
        .grid-container {
            max-width: 100%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
        }

        .grid-container h2 {
            text-align: center;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
        }

        .gridview th,
        .gridview td {
            padding: 8px;
            text-align: left;
            border: 1px solid #ccc;
        }

        .gridview th {
            background-color: #f2f2f2;
        }

        .gridview .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .gridview .pagination a {
            margin: 0 5px;
            padding: 5px 10px;
            text-decoration: none;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .gridview .pagination a.active {
            background-color: #4CAF50;
            color: #fff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="grid-container">
        <h2>Main Menu Details:&nbsp;
       <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Text=""></asp:Label>

                </h2><br />
                <div class="grid-container">
                   <table>
                       <tr><td style="font-weight: 700">Filter: </td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>Role Name: </td><td><asp:DropDownList ID="ddlrolename" runat="server" Width="150px" Height="30px" AutoPostBack="True" OnSelectedIndexChanged="ddlrolename_SelectedIndexChanged"></asp:DropDownList></td></tr>
                                             
                   </table>
                </div>
                <asp:GridView ID="grdmenu" CssClass="gridview" runat="server" 
                CellPadding="4" AllowPaging="True" PageSize="5" AutoGenerateColumns="False" OnRowCommand="grdmenu_RowCommand" OnRowDataBound="grdmenu_RowDataBound" OnPageIndexChanging="grdmenu_PageIndexChanging" >

                    <Columns>

                        <asp:TemplateField HeaderText="MenuID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblmenuid" runat="server" Text='<%#Eval("MenuID")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="MenuName">
                            <ItemTemplate>
                                <asp:Label ID="lblMenuName" runat="server" Text='<%#Eval("MenuName")%>'></asp:Label>
                            </ItemTemplate>
                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="15%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Menu Url" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblmenuurl" runat="server" Text='<%#Eval("MenuUrl")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="15%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Menu Descrp.">
                            <ItemTemplate>
                                <asp:Label ID="lblmenudescription" runat="server" Text='<%#Eval("MenuDescription")%>'></asp:Label>
                            </ItemTemplate>
                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Display Sequence.">
                            <ItemTemplate>
                                <asp:Label ID="lbldisplaysequence" runat="server" Text='<%#Eval("DisplaySequence")%>'></asp:Label>
                            </ItemTemplate>
                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="15%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:TemplateField>

                        
                         <asp:TemplateField HeaderText="Role Name">
                            <ItemTemplate>
                                <asp:Label ID="lblrolename" runat="server" Text='<%#Eval("RoleName")%>'></asp:Label>
                            </ItemTemplate>
                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="15%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Actions">
                                     <ItemTemplate>
                                    <asp:Button ID="lnkEdit" runat="server" Text="Update" CommandName="MenuEdit" CommandArgument='<%# Eval("MenuID") %>'></asp:Button> |
                                    <asp:Button ID="lnkView" runat="server" Text="View" CommandName="MenuView" CommandArgument='<%# Eval("MenuID") %>'></asp:Button> |
                                    <asp:Button ID="lnkDelete" runat="server" Text="Delete" CommandName="MenuDelete" CommandArgument='<%# Eval("MenuID") %>'></asp:Button> |
                                    <asp:Button ID="lnkInsert" runat="server" Text="Insert" CommandName="MenuInsert" CommandArgument='<%# Eval("MenuID") %>'></asp:Button>
                                 </ItemTemplate>
                                      <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="100%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                 </asp:TemplateField>


                    </Columns>
               </asp:GridView>

        <table class="gridview">
       
        </table>
    </div>
</asp:Content>
