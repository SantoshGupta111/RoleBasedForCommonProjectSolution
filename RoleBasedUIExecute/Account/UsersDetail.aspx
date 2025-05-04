<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="UsersDetail.aspx.cs" Inherits="UIExecute.Account.UsersDetail" EnableEventValidation="false"  %>
<%@ MasterType VirtualPath="~/MasterPage/PaidTimeOffMaster.Master" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" tagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
 <style>
        /*.pnlCSS{
font-weight: bold;
cursor: pointer;
border: solid 1px #c0c0c0;
width:100%;
}*/

.pagingDiv a, .pagingDiv span {
    display: inline-block;
    padding: 0px 9px;
    margin-right: 4px;
    border-radius: 3px;
    border: solid 1px #c0c0c0;
    background: #e9e9e9;
    box-shadow: inset 0px 1px 0px rgba(255,255,255, .8), 0px 1px 3px rgba(0,0,0, .1);
    font-size: .875em;
    font-weight: bold;
    text-decoration: none;
    color: #717171;
    text-shadow: 0px 1px 0px rgba(255,255,255, 1);
}
  
    .pagingDiv a:hover {
        background: #fefefe;
        background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#FEFEFE), to(#f0f0f0));
        background: -moz-linear-gradient(0% 0% 270deg,#FEFEFE, #f0f0f0);
    }
  
    .pagingDiv a.active {
        border: none;
        background: #616161;
        box-shadow: inset 0px 0px 8px rgba(0,0,0, .5), 0px 1px 0px rgba(255,255,255, .8);
        color: #f0f0f0;
        text-shadow: 0px 0px 3px rgba(0,0,0, .5);
    }
  
    .pagingDiv span {
        color: #f0f0f0;
        background: #616161;
    }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" />--%>
  

    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
      <ContentTemplate>
            <%-- <asp:Timer ID="Timer1" runat="server" Interval="5000" OnTick="Timer1_Tick" Enabled="false" />--%>

         <div>
             <table style width ="100%" border="1px" >
                  <tr>
                     <td colspan="3">
                     <div style="width:100%;">
                        
                        
                         <div>
<asp:Panel ID="pnlClick" runat="server" CssClass="pnlCSS">
<div style="background-image:url('../icons/green_bg.gif'); height:30px; vertical-align:middle">
<div style="float:left; color:dodgerblue;padding:5px 5px 0 0">
</div>
    
<div style="float:right; color:white; padding:5px 5px 0 0">FILTER::
<asp:Label ID="lblMessage" runat="server" Text="Label"/>

    <asp:Image ID="imgArrows" runat="server" />
</div>
<div style="clear:both"></div>
</div>
</asp:Panel>

<asp:Panel ID="pnlCollapsable" runat="server" Height="0" CssClass="pnlCSS">

     
    <table style="width:100%;">
                             <tr>
                                 <td >Registration Date-From</td>
                                  <td>
                                   <%-- placeholder="DOB-yyyy-MM-dd"--%>
                                     <asp:TextBox ID="txtfromdate" Width="150px" runat="server" ></asp:TextBox>
                                     <asp:ImageButton ID="imgbtnfromdate" style="margin-bottom:-6px;"  runat="server" ImageUrl="~/Images/Calender.jpg" Width="20px" Height="20px" OnClientClick="return false;" />
        
                                      <ajax:CalendarExtender ID="CalendarExtender2" TargetControlID="txtfromdate" PopupButtonID="imgbtnfromdate" runat="server" />
       
                                     

                                 </td>
                                  <td>To Date</td>
                                  <td>
                                     <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                     <ContentTemplate>
                                     <asp:TextBox ID="txttodate" Width="150px" runat="server" ></asp:TextBox>
                                     <asp:ImageButton ID="imgbtntodate" runat="server" style="margin-bottom:-6px;" ImageUrl="~/Images/Calender.jpg" Width="20px" Height="20px" OnClientClick="return false;" />
        
                                      <ajax:CalendarExtender ID="CalendarExtender1" TargetControlID="txttodate" PopupButtonID="imgbtntodate" runat="server" />
       
                                     </ContentTemplate>
                                     <Triggers>
                                         <asp:AsyncPostBackTrigger ControlID="imgbtntodate" EventName="Click" />
                                     </Triggers>
                                        </asp:UpdatePanel>
                                 </td>
                             </tr>
                             <tr>
                                 <td >First Name: </td>
                                  <td>
                                      <asp:TextBox ID="txtfirstname" Width="150px" runat="server"></asp:TextBox>
                                 </td>
                                  <td>Last Name: </td>
                                  <td>
                                      <asp:TextBox ID="txtlastname" runat="server"></asp:TextBox>
                                 </td>
                             </tr>
                             <tr>
                                 <td >Age:</td>
                                  <td>
                                      Min
                                      <asp:DropDownList ID="ddlminage" runat="server">
                                           <asp:ListItem Value="0" Selected="True" Text="Min"></asp:ListItem>
                                      </asp:DropDownList>
                                      &nbsp; Max
                                      <asp:DropDownList ID="ddlmaxage" runat="server">
                                          <asp:ListItem Value="0" Selected="True" Text="Max"></asp:ListItem>
                                      </asp:DropDownList>
                                 </td>
                                  <td>Role Name</td>
                                  <td>
                                      <asp:DropDownList ID="ddlrolename" Width="150px" runat="server">
                                      </asp:DropDownList>
                                 </td>
                             </tr>
                             <tr>
                                 <td >Mobile No:</td>
                                  <td>
                                      <asp:TextBox ID="txtmobileno" Width="150px" runat="server"></asp:TextBox>
                                 </td>
                                  <td>Email ID:</td>
                                  <td>
                                      <asp:TextBox ID="txtemailid" Width="150px" runat="server" ></asp:TextBox>
                                 </td>
                             </tr>
                             <tr>
                                 <td >Location Code:</td>
                                  <td>
                                      <asp:DropDownList ID="ddllocationcode" Width="150px" runat="server">
                                      </asp:DropDownList>
                                 </td>
                                  <td>Gender:</td>
                                  <td>
                                      <asp:DropDownList ID="ddlgender" Width="150px" runat="server">
                                          <asp:ListItem Value="0" Selected="True" Text="-Select-"></asp:ListItem>
                                          <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
                                          <asp:ListItem Value="Female"  Text="Female"></asp:ListItem>

                                      </asp:DropDownList>
                                 </td>
                             </tr>
                             <tr>
                                 <td >State:</td>
                                  <td>
                                      <asp:DropDownList ID="ddlstate" Width="150px" runat="server">
                                      </asp:DropDownList>
                                 </td>
                                  <td>City:</td>
                                  <td>
                                      <asp:DropDownList ID="ddlcity" Width="150px" runat="server">
                                      </asp:DropDownList>
                                 </td>
                             </tr>
                            
                             <tr>
                                 <td colspan="3">
                                     <asp:Label ID="lblmsg" runat="server" ForeColor="red" style="font-weight: 700" Text=""></asp:Label>
                                 </td>
                                 <td align='right'>
                        
                                <asp:Button ID="btnsearch" runat="server" Text="Search"  />
                                 &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnreset" runat="server" Text="Reset" />
                             
                                 </td>
                             </tr>
                            
                         </table>
   

    </asp:Panel>

<ajax:CollapsiblePanelExtender
ID="CollapsiblePanelExtender1"
runat="server"
CollapseControlID="pnlClick"
Collapsed="true"
ExpandControlID="pnlClick"
TextLabelID="lblMessage"
CollapsedText="Show"
ExpandedText="Hide"
ImageControlID="imgArrows"
CollapsedImage="downarrow.jpg"
ExpandedImage="uparrow.jpg"
ExpandDirection="Vertical"
TargetControlID="pnlCollapsable"
ScrollContents="false">
</ajax:CollapsiblePanelExtender>
</div>
                        
        

                     </div>    
                     </td>
                   
                 </tr>

                <tr style="background-color:#54adf8;">
                   <td align='left' width="40%">
                         <asp:Label ID="lblHeaderSearch" runat="server" ForeColor="black" Text="" Visible="true" style="font-weight: 700"></asp:Label>
                    </td>
                    <td align='right' width="40%">
                     Record Per Page Size: <asp:DropDownList ID="ddlpagesize" runat="server" Width="50px" AutoPostBack="True" OnSelectedIndexChanged="ddlpagesize_SelectedIndexChanged">
                                    <asp:ListItem  Value="5" Text="5"></asp:ListItem>
                                    <asp:ListItem  Value="10" Text="10"></asp:ListItem>
                                    <asp:ListItem Value="15" Text="15"></asp:ListItem>
                                    <asp:ListItem  Value="20" Text="20"></asp:ListItem>

                                  </asp:DropDownList>

                    </td>

                    <td align="left" width="20%">Refresh Interval:
                       <asp:DropDownList ID="ddlrefreshinterval" runat="server" OnSelectedIndexChanged="ddlrefreshinterval_SelectedIndexChanged" AutoPostBack="true">
                         <asp:ListItem Text="No Refresh" Value="0"></asp:ListItem>
                         <asp:ListItem Text="5 seconds" Value="5000"></asp:ListItem>
                        <asp:ListItem Text="10 seconds" Value="10000"></asp:ListItem>
    
                        </asp:DropDownList>
                
                    </td>

                   
                
                    </tr>
                 
                  <tr style="background-color:#54adf8;">
                      <td align="left" width="40%">
                          &nbsp;</td>
                      <td align="left" width="40%">
                          &nbsp;</td>
                      <td align="left" width="20%">
                          FLUTTER: &nbsp;&nbsp;
                          <asp:ImageButton ID="imgGridView" runat="server" Height="20px" ImageUrl="~/Icons/gridview.png" Width="20px" />
                          <asp:ImageButton ID="imgListView" runat="server" Height="20px" ImageUrl="~/Icons/ListView.png" Width="20px" />

                      </td>
                     
                  </tr>
                 
                  <tr>
                     <td colspan="3">
                       
                    

                         <asp:GridView ID="grdusers" runat="server" PagerStyle-CssClass="pagingDiv" AutoGenerateColumns="False" 
                             AutoPostBack="false" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="4" 
                             OnRowCommand="grdusers_RowCommand" OnRowDataBound="grdusers_RowDataBound"
                             AllowPaging="true" PageSize="8" 
                             OnPageIndexChanging="grdusers_PageIndexChanging" OnSorting="grdusers_Sorting" 
                             BorderStyle="None" AllowSorting="True">
                             <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                             <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                             <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" />
                             <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                             <RowStyle BackColor="White" ForeColor="#003399" />
                             <SelectedRowStyle BackColor="#009999" ForeColor="#CCFF99" Font-Bold="True" />
                             <SortedAscendingCellStyle BackColor="#EDF6F6" />
                             <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                             <SortedDescendingCellStyle BackColor="#D6DFDF" />
                             <SortedDescendingHeaderStyle BackColor="#002876" />

                             <Columns>
                           
                                 <asp:TemplateField HeaderText="ID" Visible="false">
                                     <ItemTemplate>
                                         <asp:Label ID="lblid" runat="server" Text='<%# Eval("UID") %>'></asp:Label>
                                     </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="5%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                 </asp:TemplateField>


                                 <asp:TemplateField HeaderText="EMPNO" SortExpression="EMPNO">
                              
                                     <ItemTemplate>
                                         <asp:Label ID="lblempno" runat="server" Text='<%# Eval("EMPNO") %>'></asp:Label>
                                     </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="10%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />

                                 </asp:TemplateField>

                                 <asp:TemplateField HeaderText="First Name" SortExpression="FirstName">

                                     <ItemTemplate>
                                         <asp:Label ID="lblfirstname" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                                        
                                     </ItemTemplate>
                                     <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="10%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                 </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Last Name" SortExpression="Lastname">

                                     <ItemTemplate>
                                         <asp:Label ID="lbllastname" runat="server" Text='<%#Eval("Lastname") %>'></asp:Label>
                                     </ItemTemplate>
                                     <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="10%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />

                                 </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Email ID" SortExpression="Lastname">

                                     <ItemTemplate>
                                         <asp:Label ID="lblemailid" runat="server" Text='<%#Eval("EmailID") %>'></asp:Label>
                                     </ItemTemplate>
                                     <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="15%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />

                                 </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Mobile No" SortExpression="Mobileno">

                                     <ItemTemplate>
                                         <asp:Label ID="lblmobileno" runat="server" Text='<%#Eval("Mobileno") %>'></asp:Label>
                                     </ItemTemplate>
                                     <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="10%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />

                                 </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Gender">
                                     <ItemTemplate>
                                         <asp:Label ID="lblGender" runat="server" Text='<%#Eval("Gender")%>'></asp:Label>
                                     </ItemTemplate>
                                 </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Detail" Visible="false">
                                     <ItemTemplate>
                                         <asp:Label ID="lbldetail" runat="server" Text='<%#Eval("Detail") %>'></asp:Label>
                                     </ItemTemplate>
                                 </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Regis.Date" Visible="false" SortExpression="RegistrationDate">
                                     <ItemTemplate>
                                         <asp:Label ID="lblregisDate" runat="server" Text='<%#Eval("RegistrationDate")%>'></asp:Label>
                                     </ItemTemplate>
                                 </asp:TemplateField>

                                 <asp:TemplateField HeaderText="RoleName" Visible="false">
                                     <ItemTemplate>
                                         <asp:Label ID="lblrolename" runat="server" Text='<%#Eval("RoleName")%>'></asp:Label>
                                     </ItemTemplate>
                                 </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Photo">
                                     <ItemTemplate>
                                         <asp:Image ID="imgphoto" runat="server" ImageUrl='<%#Eval("UserImagePath")%>' Width="60px" Height="30px" onmouseover="showLargeImage(this)" onmouseout="hideLargeImage()" />
                                     </ItemTemplate>
                                      <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="10%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                 </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Download">
                                 <ItemTemplate>
                                 <asp:LinkButton ID="lnkDownload" Text='<%#Eval("docfileName")%>' CommandArgument='<%# Eval("docfileupload")%>' runat="server" OnClick="DownloadFile"></asp:LinkButton>
                                </ItemTemplate>
                                      <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="10%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                </asp:TemplateField>


                                 <asp:TemplateField HeaderText="Actions">
                                     <ItemTemplate>
                                    <asp:Button ID="lnkEdit" runat="server" Text="Edit" CommandName="UserEdit" CommandArgument='<%# Eval("EMPNO") %>'></asp:Button> |
                                    <asp:Button ID="lnkView" runat="server" Text="View" CommandName="UserView" CommandArgument='<%# Eval("EMPNO") %>'></asp:Button> |
                                    <asp:Button ID="lnkDelete" runat="server" Text="Delete" CommandName="UserDelete" CommandArgument='<%# Eval("EMPNO") %>'></asp:Button> |
                                    <asp:Button ID="lnkInsert" runat="server" Text="Insert" CommandName="UserInsert" CommandArgument='<%# Eval("EMPNO") %>'></asp:Button>
                                 </ItemTemplate>
                                      <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="100%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                 </asp:TemplateField>

                             </Columns>
                         </asp:GridView>
                        
                    

                     </td>
                   
                 </tr>

                 <tr>
                     <td></td>
                     <td></td>
                     <td></td>
                 </tr>
                  <tr>
                      <td colspan="3">
                          <div id="DivExportToExcel" runat="server" visible="true" style="border:1px solid#336699; width:65%; margin-left:44%; text-align:right;">
            
                        <table width="500" border="1" cellpadding="2" cellspacing="2">
                
                    <tr>
                        <td width="150">
                            File Name<font style="color:Red;">*</font>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtExportFileName" ErrorMessage="RequiredFieldValidator" 
                    SetFocusOnError="True" ValidationGroup="Validate">??</asp:RequiredFieldValidator>
                            </td>
                            
                        <td width="250" valign="top">
                    
                            <asp:TextBox ID="txtExportFileName" Visible="true" runat="server" Width="250px"></asp:TextBox>
                        </td>
                        
                        <td valign="bottom" align="right">
                            <asp:Button ID="btnExportToExcel" runat="server" ValidationGroup="Validate" BackColor="#F0F0F0" BorderColor="White" BorderStyle="Groove" Font-Bold="True" ForeColor="Black"
                                OnClick="ExportToExcel" Text="Export To Excel" Visible="true" />
                        </td>
                    </tr>
                </table>
            
            </div>

                      </td>
                  </tr>
             </table>

                   
            
        </div>

           </ContentTemplate>
    <Triggers>
            <asp:PostBackTrigger ControlID="btnExportToExcel" />
            <asp:PostBackTrigger ControlID="grdusers" />
       <%-- <asp:AsyncPostBackTrigger ControlID="docfileupload" EventName="lnkDownload" /> --%>
        
     </Triggers>

    </asp:UpdatePanel>

     
</asp:Content>
