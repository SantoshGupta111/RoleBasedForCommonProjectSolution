<%@ Page Title="UserRegistration" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="UIExecute.Account.UserRegistration" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" tagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <%--  <script src="https://www.google.com/recaptcha/api.js"></script>
    <div class="g-recaptcha" data-sitekey="YOUR_SITE_KEY"></div>--%>
       
<table class="registration-table">
   
<tr>
    <td colspan="4" align='center'><h1>Registration Form For Users</h1></td>

</tr>
    
<tr>
  
    <td>&nbsp;</td>
    <td colspan="3" align='center'>
        <asp:Label ID="lblmsg" runat="server" Text="" ForeColor="Red" CssClass="form-error-message"></asp:Label>

    </td>

</tr>


<tr>
    <td>&nbsp;</td>
    <td colspan="3" align='left'>
       <asp:ValidationSummary ID="ValidationSummary_SignupForm" ForeColor="Red"
           HeaderText="Please correct the following errors in the page." 
           ShowMessageBox="true" ShowSummary="false"
           runat="server"  ValidationGroup="Validate" CssClass="form-error-message" />
    </td>

</tr>


<tr>
   <td CssClass="form-label">First Name</td>
    <td>
        <asp:TextBox ID="txtfirstname" runat="server" placeholder="Enter First Name" CssClass="form-input"></asp:TextBox>
        <asp:RequiredFieldValidator ID="FirstName_Required" runat="server" ValidationGroup="Validate" CssClass="form-error-message" 
            Display="Dynamic" ControlToValidate="txtfirstname" ForeColor="red" Text="*" ErrorMessage="First Name is required.." >
        </asp:RequiredFieldValidator>
    </td>
    <td CssClass="form-label">Last Name</td>
    <td>
        <asp:TextBox ID="txtlastname" runat="server" placeholder="Enter Last Name" CssClass="form-input"></asp:TextBox>
         <asp:RequiredFieldValidator ID="LastName_Required" runat="server" ValidationGroup="Validate" CssClass="form-error-message"
        ControlToValidate="txtlastname" ForeColor="red" Text="*" ErrorMessage="Please enter your Last Name." >
        </asp:RequiredFieldValidator>
    </td>

</tr>


<tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>

</tr>


<tr>
    <td CssClass="form-label">DOB</td>
    <td>
       <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
        <asp:TextBox ID="txtDOB" runat="server" placeholder="MM-DD-YYYY" width="150px" ></asp:TextBox>
        <asp:ImageButton ID="imgbtnCalendar" style="margin-left:-22px; margin-bottom:-4px;" runat="server" ImageUrl="~/Images/Calender.jpg" Width="16px" Height="16px" OnClientClick="return false;" />
        
           <ajax:CalendarExtender ID="CalendarExtender2" TargetControlID="txtDOB" PopupButtonID="imgbtnCalendar" runat="server" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="Validate" CssClass="form-error-message"
            ControlToValidate="txtDOB" ForeColor="red" Text="*" ErrorMessage="Please enter your DOB">
        </asp:RequiredFieldValidator>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="imgbtnCalendar" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>

    </td>
    <td CssClass="form-label">Gender</td>
    <td >
        <asp:RadioButtonList ID="radiogender" runat="server" RepeatDirection="Horizontal" CssClass="form-radio" >
            <asp:ListItem Value="Male" Selected="True">Male</asp:ListItem>
            <asp:ListItem Value="Female">Female</asp:ListItem>
        </asp:RadioButtonList>
         <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="Validate" CssClass="form-error-message"
        ControlToValidate="radiogender" CssClass="form-error-message" ForeColor="red" Text="*" ErrorMessage="Please enter your Gender" >
        </asp:RequiredFieldValidator>--%>
    </td>

</tr>


<tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>

</tr>


<tr>
    <td CssClass="form-label">Country Name</td>
    <td>
        <asp:DropDownList ID="ddlcountryname" runat="server"  CssClass="form-input select">
        </asp:DropDownList>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="Validate" CssClass="form-error-message"
        ControlToValidate="ddlcountryname" InitialValue="--Select Country--" ForeColor="red" Text="*" ErrorMessage="Please select Country Name">
        </asp:RequiredFieldValidator>


    </td>
    <td CssClass="form-label">State Name</td>
    <td>
        <asp:DropDownList ID="ddlstatename" runat="server" CssClass="form-input select">
             <asp:ListItem Selected="True" Value="-1" Text="State Name"></asp:ListItem>
        </asp:DropDownList>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="Validate" CssClass="form-error-message"
        ControlToValidate="ddlstatename" InitialValue="--Select StateName--" ForeColor="red" Text="*" 
            ErrorMessage="Please select State Name"></asp:RequiredFieldValidator>

    </td>

</tr>


<tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>

</tr>


<tr>
    <td CssClass="form-label">City Name</td>
    <td>
        <asp:DropDownList ID="ddlcityname" runat="server" CssClass="form-input select">
             <asp:ListItem Selected="True" Value="-1" Text="Country City"></asp:ListItem>
        </asp:DropDownList>

         <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="Validate" CssClass="form-error-message"
        ControlToValidate="ddlcityname" InitialValue="--Select CityName--" ForeColor="red" Text="*" 
            ErrorMessage="Please select City Name"></asp:RequiredFieldValidator>

    </td>
    <td CssClass="form-label">Location Zone</td>
    <td>
        <asp:DropDownList ID="ddllocationzone" runat="server" CssClass="form-input select">
              </asp:DropDownList>

         <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="Validate" CssClass="form-error-message"
        ControlToValidate="ddllocationzone" InitialValue="--Select LocationZone--" ForeColor="red" Text="*" 
            ErrorMessage="Please select Locatoin Zone Name"></asp:RequiredFieldValidator>

    </td>

</tr>


<tr>
    <td CssClass="form-label">&nbsp;</td>
    <td>
        &nbsp;</td>
    <td CssClass="form-label">&nbsp;</td>
    <td>
        &nbsp;</td>

</tr>


<tr>
    <td CssClass="form-label">Department</td>
    <td>
        <asp:DropDownList ID="ddldepartmentname" runat="server" CssClass="form-input select">
           </asp:DropDownList>

          <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="Validate" CssClass="form-error-message"
        ControlToValidate="ddldepartmentname" InitialValue="--Select Department Name--" ForeColor="red" Text="*" 
            ErrorMessage="Please select Department Name"></asp:RequiredFieldValidator>



    </td>
    <td CssClass="form-label">Designation</td>
    <td>
        <asp:DropDownList ID="ddldesignationname" runat="server" CssClass="form-input select">
        </asp:DropDownList>

          <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="Validate" CssClass="form-error-message"
        ControlToValidate="ddldesignationname" InitialValue="--Select Designation Name--" ForeColor="red" Text="*" 
            ErrorMessage="Please select Designation Name"></asp:RequiredFieldValidator>

    </td>

</tr>


<tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>

</tr>


<tr>
    <td CssClass="form-label">Email ID</td>
    <td>
        <asp:TextBox ID="txtemailid" placeholder="Enter Email ID" runat="server" CssClass="form-input"></asp:TextBox>
      
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="Validate" CssClass="form-error-message"
        ControlToValidate="txtemailid" ForeColor="red" Text="*" ErrorMessage="Please enter your Email ID" >
        </asp:RequiredFieldValidator>
    </td>
    <td CssClass="form-label">Mobile No</td>
    <td>
        <asp:TextBox ID="txtmobileno" placeholder="Enter Mobile No" runat="server" CssClass="form-input"></asp:TextBox>
        
           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="Validate" CssClass="form-error-message"
        ControlToValidate="txtmobileno" ForeColor="red" Text="*" ErrorMessage="Please enter your Mobile Number" >
        </asp:RequiredFieldValidator>
    </td>

</tr>


<tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>

</tr>


<tr>
    <td CssClass="form-label">Permanent Address</td>
    <td>
        <asp:TextBox ID="txtpermanentaddress" placeholder="Enter Permanent Address" runat="server" TextMode="MultiLine" CssClass="form-input"></asp:TextBox>
    </td>
    <td CssClass="form-label">Current Address</td>
    <td CssClass="form-label">
        <asp:TextBox ID="txtcurrentaddress" placeholder="Enter Current Address" runat="server" TextMode="MultiLine" CssClass="form-input"></asp:TextBox>
    </td>

</tr>


<tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>

</tr>


<tr>
    <td CssClass="form-label">&nbsp;File Upload</td>
    <td>
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <asp:FileUpload ID="fileuploaduserdocument" runat="server"  placeholder="Upload doc file" />
         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="Validate" CssClass="form-error-message"
        ControlToValidate="fileuploaduserdocument" ForeColor="red" Text="*" ErrorMessage="Please upload doc file" >
        </asp:RequiredFieldValidator>
              </ContentTemplate>
       <Triggers>
       <asp:PostBackTrigger ControlID="btnregistration" />
       </Triggers>
       </asp:UpdatePanel>
       
    </td>
    <td CssClass="form-label">User Photo Upload</td>
    <td>
          <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
        <asp:FileUpload ID="fileuploaduserphoto" runat="server" placeholder="Upload Photo" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="Validate" CssClass="form-error-message"
        ControlToValidate="fileuploaduserphoto" ForeColor="red" Text="*" ErrorMessage="Please upload photo image" >
        </asp:RequiredFieldValidator>
        </ContentTemplate>
       <Triggers>
       <asp:PostBackTrigger ControlID="btnregistration" />
       </Triggers>
       </asp:UpdatePanel>
    </td>

</tr>


<tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>

</tr>


<tr>
    <td CssClass="form-label">Detail</td>
    <td><asp:TextBox ID="txtdetail" Width="200px" runat="server" placeholder="Enter Detail" TextMode="MultiLine" CssClass="form-input"></asp:TextBox></td>
    <td CssClass="form-label">
      <asp:UpdatePanel ID="UP1" runat="server">  
                    <ContentTemplate>  
                        <table>  
                            <tr>  
                                <td style="height: 50px; width: 100px; font-weight: 700;">  
                                   <b> <asp:Image ID="imgCaptcha" runat="server"  />  </b>
                                </td>  
                                <td valign="middle">  
                                    <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" CssClass="form-label" />  
                                </td>  
                            </tr>  
                        </table>  
                    </ContentTemplate>  
                </asp:UpdatePanel> 

    </td>
    <td CssClass="form-label">
       <asp:TextBox ID="txtCaptcha" runat="server" Width="200px" CssClass="form-input"></asp:TextBox>  

        <asp:Label ID="lblErrorMsg" ForeColor="Red" runat="server" CssClass="form-label"></asp:Label>
    </td>

</tr>


<tr>
    <td align='center'>&nbsp;</td>
    <td>
        &nbsp;</td>
    <td>
        &nbsp;</td>
    <td>
        &nbsp;</td>
</tr>


<tr>
    <td align='center'>&nbsp;</td>
    <td align='middle'>
        &nbsp;</td>
    <td>

        <asp:Button ID="btnregistration" ValidationGroup="Validate"  runat="server" CssClass="form-button"  Text="Register Me.." />

    </td>
    <td>
        &nbsp;</td>
</tr>
<tr>
    <td align='center' colspan="4">

        <asp:Button ID="btnsubmit" Width="100px" runat="server" Text="Submit" CssClass="form-button" />  
        <asp:Button ID="btnview" Width="100px" runat="server" Text="View" CssClass="form-button" />  
        <asp:Button ID="btnedit" Width="100px" runat="server" Text="Edit" CssClass="form-button" />  
        <asp:Button ID="btndelete" Width="100px" runat="server" Text="Delete" CssClass="form-button" />  

        </td>
</tr>



<tr>
    <td align='center'>&nbsp;</td>
    <td>
        &nbsp;</td>
    <td>
        &nbsp;</td>
    <td>
        &nbsp;</td>
</tr>



</table>
       
    
</asp:Content>
