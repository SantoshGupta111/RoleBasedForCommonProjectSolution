<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Site1.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="UIExecute.Account.UserLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }
        form {
            border: 3px solid #f1f1f1;
        }
        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        button:hover {
            opacity: 0.8;
        }
        .cnbtn {
            background-color: #ec3f3f;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 49%;
        }
        .lgnbtn {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 50%;
        }
        .uuseraccbtn {
            background-color: #0094ff
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }
        .imgcontainer {
            text-align: center;
            margin: 24px 0 12px 0;
        }
        img.avatar {
            width: 40%;
            border-radius: 50%;
        }
        .container {
            padding: 16px;
        }
        span.psw {
            float: right;
            padding-top: 16px;
        }
        /* Change styles for span and cancel button on extra small screens */
        @media screen and (max-width: 300px) {
            span.psw {
                display: block;
                float: none;
            }
            .cnbtn {
                width: 100%;
            }
        }
        .frmalg {
            margin-top: 10%; margin-left:30%; margin-right:20%;
            width: 40%;
        }
    </style>

    <div class="container">
            <center>
                <h3> Login form </h3>
            </center>
            <label for="uname"><b>Username</b></label>
            <asp:TextBox runat="server" ID="txtusername" placeholder="Enter EMPNO"></asp:TextBox>
            <label for="psw"><b>Password</b></label>
            <asp:TextBox runat="server" ID="txtpassword" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
            <asp:Button runat="server" ID="btnLogin" CssClass="lgnbtn" Text="Login" />
            <asp:Button runat="server" ID="btn_cancel" Text="Cancel" class="cnbtn" />
         
            <asp:Button ID="btnuseraccount" runat="server" Text="USER ACCOUNT" CssClass="uuseraccbtn" />

                     
        </div>
      
       
        <div>
            <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
        </div>
   
</asp:Content>
