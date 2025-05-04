<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="RolePermissionToSubMenu.aspx.cs" Inherits="UIExecute.Menu.DataDetails.RolePermissionToSubMenu" %>
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

    <div>
            
             <table style width ="100%" >

                   <tr>
                     <td class="auto-style1" >
             
                     </td>
                       <td class="auto-style1" >
             
                     </td>
                       <td class="auto-style1" >
             
                     </td>
                       <td class="auto-style1" >
             
                     </td>

                   
                 </tr>



                   <tr>
                     <td align='right' >
             
                         Role Name</td>
                       <td >
             
                           <asp:DropDownList ID="ddlrole" runat="server" Width="150px" AutoPostBack="True">

                           </asp:DropDownList>
                       </td>
                       <td >
             
                           &nbsp;</td>
                       <td >
             
                           &nbsp;</td>

                   
                 </tr>



                   <tr>
                     <td align='right' >
             
                         &nbsp;</td>
                       <td >
             
                           <asp:Label ID="lblmsg" runat="server" Text="" ForeColor="Red"></asp:Label>

                       </td>
                       <td >
             
                           &nbsp;</td>
                       <td >
             
                           &nbsp;</td>

                   
                 </tr>



                   <tr>
                     <td colspan="2" style="font-weight: 700" >
             
                        <p>Sub-Menu Details for the Role-Accessbility:</p> 

                     </td>
                       <td >
             
                           &nbsp;</td>
                       <td >
             
                           &nbsp;</td>

                   
                 </tr>
                  <tr>
                     <td colspan="4">


                         <asp:GridView ID="grdrolepermission" CssClass="gridview" runat="server" AutoGenerateColumns="False"  CellPadding="4">
                            

                             <Columns>

                                <%-- <asp:TemplateField >
                                 <HeaderTemplate>
                                    <asp:CheckBox ID="chkSelectAll" Text="Checked For Updation" runat="server" OnCheckedChanged="chkSelectAll_CheckedChanged" AutoPostBack="true" />
                                    </HeaderTemplate>
                                     <ItemTemplate>
                                     <asp:CheckBox ID="chkSelect" runat="server" />
                                      </ItemTemplate>
                                     </asp:TemplateField>--%>


                                  <asp:TemplateField HeaderText="Menu Name">
                                      <ItemTemplate>
                                          <asp:Label ID="lblmenuname" runat="server" Text='<%#Eval("MenuName")%>'></asp:Label>
                                      </ItemTemplate>
                                       <HeaderStyle HorizontalAlign="Left"  VerticalAlign="Middle" Width="15%" />
                                     <ItemStyle HorizontalAlign="Left" ForeColor="#006699" VerticalAlign="Middle" />
                                  </asp:TemplateField> 

                                 <asp:TemplateField HeaderText="Sub-Menu Name">
                                     <ItemTemplate>
                                         <asp:Label ID="lblID" Visible="false" runat="server" Text='<%#Eval("ID")%>'></asp:Label> 
                                         <asp:Label ID="lblsubmenuID" Visible="false" runat="server" Text='<%#Eval("SubMenuID")%>'></asp:Label>
                                         <asp:Label ID="lblroleid" Visible="false" runat="server" Text='<%#Eval("RoleID")%>'></asp:Label>

                                         <asp:Label ID="lblsubmenuname" runat="server" Text='<%# Eval("SubMenuName") %>'></asp:Label>
                                     </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="15%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                 </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Sub-Menu-url">

                                     <ItemTemplate>
                                         <asp:Label ID="lblsubmenuurl" runat="server" Text='<%# Eval("SubMenuUrl") %>'></asp:Label>
                                        
                                     </ItemTemplate>
                                     <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="10%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                 </asp:TemplateField>

                                  <asp:TemplateField HeaderText="CanEdit">
                                     <ItemTemplate>
                                         <asp:CheckBox ID="chkcanEdit" runat="server" Checked='<%#Eval("CanEdit") %>' />
                                     </ItemTemplate>
                                     <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="10%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                 </asp:TemplateField>

                                 <asp:TemplateField HeaderText="CanView">
                                     <ItemTemplate>
                                         <asp:CheckBox ID="chkcanview" runat="server" Checked='<%#Eval("CanView")%>' />
                                     </ItemTemplate>
                                     <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="10%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                 </asp:TemplateField>
                                                                 

                                  <asp:TemplateField HeaderText="CanDelete">
                                     <ItemTemplate>
                                         <asp:CheckBox ID="chkcanDelete" runat="server" Checked='<%#Eval("CanDelete")%>' />
                                     </ItemTemplate>
                                     <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="10%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                 </asp:TemplateField>

                                  <asp:TemplateField HeaderText="CanInsert">
                                     <ItemTemplate>
                                         <asp:CheckBox ID="chkcanInsert" runat="server" Checked='<%#Eval("CanInsert")%>' />
                                     </ItemTemplate>
                                     <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="10%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                 </asp:TemplateField>

                                 <asp:TemplateField HeaderText="CanDownload" Visible="false">
                                     <ItemTemplate>
                                         <asp:CheckBox ID="chkcanDownload" runat="server" Checked='<%#Eval("CanDownload")%>' />
                                     </ItemTemplate>
                                     <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="10%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                 </asp:TemplateField>

                              </Columns>

                             <EmptyDataTemplate>
                             <div class="empty-data-message">
                              No data found.
                             </div>
                             </EmptyDataTemplate>


                         </asp:GridView>


                     </td>
                   
                 </tr>

                 <tr>
                     <td>&nbsp;</td>
                     <td align='center'>
                         &nbsp;</td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                 </tr>

                 <tr>
                     <td></td>
                     <td align='left'>
                         <asp:Button ID="btnupdaterolepermission" Visible="false" runat="server" Text="Role Accessbility" style="font-weight: 700" />
                     </td>
                     <td></td>
                     <td></td>
                 </tr>

                 <tr>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                     <td>&nbsp;</td>
                 </tr>
             </table>
            
        </div>


</asp:Content>
