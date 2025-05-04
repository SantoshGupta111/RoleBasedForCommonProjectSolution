<%@ Page Title="" Language="C#" MasterPageFile="~/Design Layout/MasterLayout.Master" AutoEventWireup="true" CodeBehind="ContentPage.aspx.cs" Inherits="UIExecute.Design_Layout.ContentPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Example Login Page -->
<div class="form-container">
    <h2 class="page-title">Login</h2>
    <label class="label" for="username">Username</label>
    <input type="text" id="username" name="username">
    
    <label class="label" for="password">Password</label>
    <input type="password" id="password" name="password">
    
    <button class="button" type="submit">Login</button>
</div>

</asp:Content>
