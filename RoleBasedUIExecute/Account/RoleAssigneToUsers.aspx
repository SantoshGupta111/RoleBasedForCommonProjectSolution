<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="RoleAssigneToUsers.aspx.cs" Inherits="UIExecute.Account.RoleAssigneToUsers" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajax" %>
<%@ Register assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="System.Web.UI" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Confirm Role Assignment</title>

 <script type="text/javascript">
        function confirmUpdate() {
            return confirm("Please confirm that you want to assign a role to this userID ?"); // Display the confirmation message
        }
    </script>

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

  <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>--%>

     

   <div style="border:1px; width:100%">
        <table border='1' cellpadding='0' cellspacing='0' align='center' width="100%">
        <tr>
        <td align='center'><h3> Create Role Assign To Users Form</h3></td>
        </tr>

<table border='0' width="100%" cellpadding='0' cellspacing='0' align='center'>
<tr>
  
    <td>
        <asp:Label ID="lblmsg" ForeColor="Red" runat="server" Text=""></asp:Label>
         
    </td>
</tr>
<tr>
    <td align='left' colspan="2">
        The complete process of new user registration includes assigning roles to users. During the registration process, users provide their details, including username, email, and password. After successful registration, the system allows an authorized administrator or manager to assign specific roles to the newly registered users based on their responsibilities and permissions within the application.
    </td>
</tr>
<tr>
    <td align='left' colspan="2">&nbsp;</td>
</tr>
         
<tr>
    <td align='center' width="40%" >Select User Code</td>
    <td>
        
       
        <asp:DropDownList ID="ddluser" runat="server" Width="200px" AutoPostBack="True" OnSelectedIndexChanged="ddluser_SelectedIndexChanged">
        </asp:DropDownList>
   
    </td>
</tr>
   
         
    <tr>
        <td align="center">&nbsp;</td>
        <td>
        
        </td>
    </tr>
       

     <div id="DivTab" runat="server" visible="false" width="100%">
    <tr>
        <td align="left" colspan="2">
         <asp:UpdatePanel ID="updt" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <fieldset>
                <legend>
                    <strong>Employee Profile: <br />  </strong>
                </legend>

            <ajax:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" >  

            <ajax:TabPanel runat="server" HeaderText="Profile Detail 1" ID="TabPanel1">  
            <ContentTemplate>
                <table width="100%" border="0px" style="background-color:#dcfaf6; padding:5px;">
                    <tr>
                        <td><b>Emp Code: </b></td>
                        <td>
                            <asp:Label ID="lblusercode" runat="server"></asp:Label>
                        </td>

                        <td><b>User Name : </b></td>
                        <td>
                            <asp:Label ID="lblusername" runat="server"></asp:Label>
                        </td>


                    </tr>
                    <tr>
                       <td><b>Email ID : </b></td>
                        <td>
                            <asp:Label ID="lbluseremailid" runat="server"></asp:Label>
                        </td>
                        <td><b>Phone No : </b></td>
                        <td>
                            <asp:Label ID="lbluserphoneno" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Gender : </b></td>
                        <td>
                            <asp:Label ID="lblusergender" runat="server"></asp:Label>
                        </td>
                        <td><b>Age : </b></td>
                        <td>
                            <asp:Label ID="lbluserage" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </ContentTemplate>
            </ajax:TabPanel>  

            <ajax:TabPanel ID="TabPanel2" runat="server" HeaderText="Profile Detail 2">  
                <ContentTemplate>
                <table width="100%" >
                    <tr>
                        <td><b>Current Add : </b></td>
                        <td>
                            <asp:Label ID="lblcurrentaddress" runat="server"></asp:Label>
                        </td>

                        <td><b>Permanent Add : </b></td>
                        <td>
                            <asp:Label ID="lblpermanentaddress" runat="server"></asp:Label>
                        </td>


                    </tr>
                    <tr>
                        <td><b>Country : </b></td>
                        <td>
                            <asp:Label ID="lblcountry" runat="server"></asp:Label>
                        </td>
                       <td><b>State : </b></td>
                        <td>
                            <asp:Label ID="lblstate" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                       <td><b>City : </b></td>
                        <td>
                            <asp:Label ID="lblcity" runat="server"></asp:Label>
                        </td>
                        <td> </td>
                        <td>
                        
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                </ContentTemplate>

            </ajax:TabPanel>  

            <ajax:TabPanel ID="TabPanel3" runat="server" HeaderText="Profile Detail 3">  
                     <ContentTemplate>
                       <table width="100%">
                    <tr>
                       <td><b>Department : </b></td>
                        <td>
                            <asp:Label ID="lbldepartment" runat="server"></asp:Label>
                        </td>

                        <td><b>Designation : </b></td>
                        <td>
                            <asp:Label ID="lbldesignation" runat="server"></asp:Label>
                        </td>


                    </tr>
                    <tr>
                       <td><b>Location Zone : </b></td>
                        <td>
                            <asp:Label ID="lbllocationzone" runat="server"></asp:Label>
                        </td>
                        <td><b>Role Name : </b></td>
                        <td>
                            <asp:Label ID="lblrolename" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            
                        </td>
                        <td> </td>
                        <td>
                           
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                            </ContentTemplate>

            </ajax:TabPanel>  

            <ajax:TabPanel ID="TabPanel4" runat="server" HeaderText="Profile Detail 4">  
                 <ContentTemplate>
                   <table width="100%">
                    <tr>
                        <td><b>Doc File Name : </b></td>
                        <td>
                      <asp:LinkButton ID="lnkdocfiledownload" runat="server" Text="Download File" OnClick="DownloadFile" CommandArgument="" Visible="false"></asp:LinkButton>
                      <asp:Label ID="lblFileName" runat="server" Text="" Visible="false"></asp:Label>

                        </td>

                       <td><b>User Image : </b></td>
                        <td>
                            <asp:Label ID="lblimagename" runat="server"></asp:Label>
                            <asp:Image ID="imguserphoto" runat="server" />
                        </td>


                    </tr>
                    <tr>
                        <td></td>
                        <td>
                           
                        </td>
                        <td></td>
                        <td>
                           
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                        
                        </td>
                        <td> </td>
                        <td>
                           
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                            </ContentTemplate>

                 </ajax:TabPanel>  


        </ajax:TabContainer>
                  
            </fieldset>
         </ContentTemplate>
            <Triggers>
              <%--<asp:AsyncPostBackTrigger ControlID="ddluser" EventName="SelectedIndexChanged" />--%>
              <asp:PostBackTrigger ControlID="TabContainer1" />
               <%-- OnSelectedIndexChanged="ddluser_SelectedIndexChanged"--%>
            </Triggers>
            </asp:UpdatePanel>

        </td>
    </tr>
    <tr>
        <td align="center">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td align="center">Select Role Name</td>
        <td>
            <asp:DropDownList ID="ddlrole" runat="server" Width="200px">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="center">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>

          <tr>
        <td align="center">&nbsp;</td>
        <td>
            <asp:Button ID="btnroleassigntouser" runat="server" Text="Assign Role" OnClientClick="return confirmUpdate();" />

        </td>
    </tr>

      </div>    
       
  

      <table border='0' cellpadding='0' cellspacing='0' width="100%" align='center'>
<tr>
    <td align='left'>
      </tr>
<tr>
    <td align='left'>
          <fieldset>
                <legend>
                    <strong>Authenticated & Authorized Employee List: <br />  </strong>
                </legend>
                 <div >
             <asp:GridView ID="grdusers" runat="server" PagerStyle-CssClass="pagingDiv" AutoGenerateColumns="False" 
                             AutoPostBack="false" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="4" 
                             AllowPaging="true" PageSize="8" BorderStyle="None">
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

                                 <asp:TemplateField HeaderText="Role">
                                     <ItemTemplate>
                                         <asp:Label ID="lblrolename" runat="server" Text='<%#Eval("RoleName")%>'></asp:Label>
                                     </ItemTemplate>
                                      <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="10%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
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

                                <%-- <asp:TemplateField HeaderText="Download">
                                 <ItemTemplate>
                                 <asp:LinkButton ID="lnkDownload" Text='<%#Eval("docfileName")%>' CommandArgument='<%# Eval("docfileupload")%>' runat="server" OnClick="DownloadFile"></asp:LinkButton>
                                </ItemTemplate>
                                      <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="10%" />
                                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                </asp:TemplateField>--%>


                                 <asp:TemplateField HeaderText="Actions" Visible="false">
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

        <table class="gridview">
           
        </div>

              </fieldset>
     </tr>
<tr>
    <td align='center'>

        <%--<input type='submit' name='REGISTER' value="register"></td>--%>
</tr>
<tr>
    <td align='center'>&nbsp;</td>
</tr>
</table>
</table>

</table>

    </div>

      <%--  </ContentTemplate>--%>
        <%-- <Triggers>--%>
      <%--  <asp:AsyncPostBackTrigger ControlID="btnroleassigntouser" EventName="Click" />--%>
        <%--<asp:AsyncPostBackTrigger ControlID="ddluser" EventName="SelectedIndexChanged" />--%>
           <%--  <asp:PostBackTrigger ControlID="btnroleassigntouser" />--%>
            <%-- <asp:PostBackTrigger ControlID="ddluser" />--%>
            <%-- <asp:PostBackTrigger ControlID="TabContainer1" />--%>
          
<%--</Triggers>--%>

<%--</asp:UpdatePanel>--%>
   

</asp:Content>
