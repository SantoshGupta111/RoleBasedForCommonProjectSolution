<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/PaidTimeOffMaster.Master" AutoEventWireup="true" CodeBehind="testing.aspx.cs" Inherits="UIExecute.Account.testing" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" tagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

.pnlCSS{
font-weight: bold;
cursor: pointer;
border: solid 1px #c0c0c0;
width:30%;
}
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div>
<asp:Panel ID="pnlClick" runat="server" CssClass="pnlCSS">
<div style="background-image:url('green_bg.gif'); height:30px; vertical-align:middle">
<div style="float:left; color:blue;padding:5px 5px 0 0">
Collapsible Panel
</div>
<div style="float:right; color:White; padding:5px 5px 0 0">
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
                                      <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                     <ContentTemplate>
                                     <asp:TextBox ID="txtfromdate" Width="150px" runat="server" placeholder="DOB-yyyy-MM-dd"></asp:TextBox>
                                     <asp:ImageButton ID="imgbtnfromdate" style="margin-bottom:-6px;"  runat="server" ImageUrl="~/Images/Calender.jpg" Width="20px" Height="20px" OnClientClick="return false;" />
        
                                      <ajax:CalendarExtender ID="CalendarExtender2" TargetControlID="txtfromdate" PopupButtonID="imgbtnfromdate" runat="server" />
       
                                     </ContentTemplate>
                                     <Triggers>
                                         <asp:AsyncPostBackTrigger ControlID="imgbtnfromdate" EventName="Click" />
                                     </Triggers>
                                        </asp:UpdatePanel>

                                 </td>
                                  <td>To Date</td>
                                  <td>
                                     <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                     <ContentTemplate>
                                     <asp:TextBox ID="txttodate" Width="150px" runat="server" placeholder="DOB-yyyy-MM-dd"></asp:TextBox>
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
                                 <td >Age [Min]:</td>
                                  <td>
                                      <asp:DropDownList ID="ddlminage" Width="60px" runat="server">
                                      </asp:DropDownList>
                                 &nbsp;To Max
                                      <asp:DropDownList ID="ddlmaxage" Width="60px" runat="server">
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
                                 <td >&nbsp;</td>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                             </tr>
                             <tr>
                                 <td >&nbsp;</td>
                                  <td>&nbsp;</td>
                                  <td>&nbsp;</td>
                                  <td align='right'>
                                      <h3 style="margin-bottom:5px; margin-left:10px;">FLUTTER: &nbsp;&nbsp;&nbsp;
                                     <asp:ImageButton Id="imgGridView" Width="20px" Height="20px" runat="server"  ImageUrl="~/Icons/gridview.png" />
                                   
                                      <asp:ImageButton ID="imgListView" Width="20px" Height="20px" runat="server" ImageUrl="~/Icons/ListView.png" />
                                  </h3>
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
</asp:Content>
