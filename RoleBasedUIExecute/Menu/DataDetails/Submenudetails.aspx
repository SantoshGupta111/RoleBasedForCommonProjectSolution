<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Submenudetails.aspx.cs" Inherits="UIExecute.Menu.DataDetails.Submenudetails" %>

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
        <h2>Sub-Menu Details:   <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Text=""></asp:Label></h2><br />
      

        <div class="grid-container">
                   <table>
                       <tr><td style="font-weight: 700">Filter :&nbsp; </td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>Role Name: </td><td style="margin-left: 40px"><asp:DropDownList ID="ddlrolename" runat="server" Width="150px" Height="30px" AutoPostBack="True" OnSelectedIndexChanged="ddlrolename_SelectedIndexChanged"></asp:DropDownList></td><td style="margin-left: 40px">&nbsp;</td><td style="margin-left: 40px">Main Menu Name: </td>
                           <td style="margin-left: 40px"><asp:DropDownList ID="ddlmainmenuname" runat="server" Width="150px" Height="30px" AutoPostBack="True" OnSelectedIndexChanged="ddlmainmenuname_SelectedIndexChanged" ></asp:DropDownList></td></tr>
                                             
                   </table>
                </div>


                <asp:GridView ID="grdsubmenu" CssClass="gridview" runat="server" 
                CellPadding="4" AllowPaging="True" PageSize="8" AutoGenerateColumns="False" OnRowDataBound="grdsubmenu_RowDataBound" OnPageIndexChanging="grdsubmenu_PageIndexChanging" OnRowCommand="grdsubmenu_RowCommand">

                    <Columns>

                        <asp:TemplateField HeaderText="SubMenuID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblsubmenuid" runat="server" Text='<%#Eval("SubMenuID")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="MenuName">
                            <ItemTemplate>
                                <asp:Label ID="lblmenuname" runat="server" Text='<%#Eval("MenuName")%>'></asp:Label>
                            </ItemTemplate>
                             <HeaderStyle HorizontalAlign="Left"  VerticalAlign="Middle" Width="15%" />
                                     <ItemStyle HorizontalAlign="Left" ForeColor="#006699" VerticalAlign="Middle" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Sub-MenuName">
                            <ItemTemplate>
                                <asp:Label ID="lblsubmenuname" runat="server" Text='<%#Eval("SubMenuName")%>'></asp:Label>
                            </ItemTemplate>
                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Sub Menu Url" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblsubmenuurl" runat="server" Text='<%#Eval("SubMenuUrl")%>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="15%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Sub-Menu Descrp.">
                            <ItemTemplate>
                                <asp:Label ID="lblsubmenudescription" runat="server" Text='<%#Eval("SubMenuDescription")%>'></asp:Label>
                            </ItemTemplate>
                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="20%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="SubMenu Display Sequence." Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblsubmenudisplaysequence" runat="server" Text='<%#Eval("SubMenuDisplaySequence")%>'></asp:Label>
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
                                    <asp:Button ID="lnkEdit" runat="server" Text="Update" CommandName="SubMenuEdit" CommandArgument='<%# Eval("SubMenuID") %>'></asp:Button> |
                                    <asp:Button ID="lnkView" runat="server" Text="View" CommandName="SubMenuView" CommandArgument='<%# Eval("SubMenuID") %>'></asp:Button> |
                                    <asp:Button ID="lnkDelete" runat="server" Text="Delete" CommandName="SubMenuDelete" CommandArgument='<%# Eval("SubMenuID") %>'></asp:Button> |
                                    <asp:Button ID="lnkInsert" runat="server" Text="Insert" CommandName="SubMenuInsert" CommandArgument='<%# Eval("SubMenuID") %>'></asp:Button>
                                 </ItemTemplate>
                                      <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="100%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                 </asp:TemplateField>

                       
                    </Columns>
                   
                
                             <EmptyDataTemplate>
                             <div class="empty-data-message">
                              No data found.
                             </div>
                             </EmptyDataTemplate>

               </asp:GridView>

        <table class="gridview">
       
        </table>
    </div>
 

</asp:Content>
