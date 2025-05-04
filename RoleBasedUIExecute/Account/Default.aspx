<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UIExecute.Account.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Midas PC Touch</title>
   <%-- <script type="text/javascript" src="../JavaScript/Patient/wait.js"></script>--%>

</head>
<body>
    <form id="form1" runat="server">
        <div style="height:100px; text-align:center;color:green;margin-top:100px; width:100%;" id="divDefault" runat="server" visible="false">   

        <h3>Your default password has been changed successfully.<br /> Kingly Re-login with password, which you had changed now!</h3>

            <a href="UserLogin.aspx">Please here Click on User Login...</a>
         <%--<asp:Image ID="imghome" runat="server" ImageUrl="~/Images/Home.JPG" Height="100%" Width="100%" />--%>
           
    </div>
    
    <div style="height:100%;  color:Green; text-align:center; margin-top:100px; width:100%;" id="divWelcome" runat="server" visible="true">
    <%--<h3>Welcome CPOSS</h3>--%>
    <%--<asp:Image ID="imghome" runat="server" ImageUrl="~/Images/bg.JPG" Height="100%" Width="100%" />--%>
        
    </div>


    </form>
</body>
</html>
