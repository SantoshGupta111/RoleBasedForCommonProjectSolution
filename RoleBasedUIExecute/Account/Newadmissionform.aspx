<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Newadmissionform.aspx.cs" Inherits="UIExecute.Account.Newadmissionform" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-container {
            max-width: 100%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
        }

        .form-container h2 {
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-group textarea {
            width: 100%;
            height: 100px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-group input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
           
        }

        .form-group input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="form-container">
            <h2>Admission College Form</h2>
            <div class="form-group">
                <label for="txtFullName">Full Name:</label>
                <input type="text" id="txtFullName" name="txtFullName" runat="server" required>
            </div>
            <div class="form-group">
                <label for="txtEmail">Email:</label>
                <input type="email" id="txtEmail" name="txtEmail" runat="server" required>
            </div>
            <div class="form-group">
                <label for="txtPhone">Phone Number:</label>
                <input type="text" id="txtPhone" name="txtPhone" runat="server" required>
            </div>
            <div class="form-group">
                <label for="ddlCourse">Course:</label>
                <select id="ddlCourse" name="ddlCourse" runat="server" required>
                    <option value="">Select Course</option>
                    <option value="Engineering">Engineering</option>
                    <option value="Business">Business</option>
                    <option value="Arts">Arts</option>
                    <option value="Science">Science</option>
                </select>
            </div>
            <div class="form-group">
                <label for="txtMessage">Message:</label>
                <textarea id="txtMessage" name="txtMessage" runat="server" required></textarea>
            </div>
            <div class="form-group">
                <asp:Button ID="btnView" runat="server" Text="View" />
                <asp:Button ID="btnedit" runat="server" Text="Edit" />
                <asp:Button ID="btndelete" runat="server" Text="Delete" />
                <asp:Button ID="btninsert" runat="server" Text="Insert" />

            </div>
        </div>
</asp:Content>
