<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="UIExecute.Design_Layout.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="CSS/StyleSheetMaster.css" rel="stylesheet" />

    <style>
/* Styles for the TreeView control */
.treeview {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 10px;
}

.treeview .tree-node {
    margin: 5px 0;
    padding-left: 20px;
    position: relative;
}

.treeview .tree-node:before {
    content: "";
    position: absolute;
    left: 0;
    top: 7px;
    width: 6px;
    height: 6px;
    border-radius: 50%;
    background-color: #333;
    transition: background-color 0.3s ease;
}

.treeview .tree-node:hover:before {
    background-color: #555;
}

.treeview .tree-node.active:before {
    background-color: #f44336;
}

.treeview .tree-label {
    display: inline-block;
    vertical-align: middle;
    margin-left: 10px;
    color: #333;
    cursor: pointer;
    transition: color 0.3s ease;
}

.treeview .tree-label:hover {
    color: #f44336;
}

.treeview .tree-icon {
    vertical-align: middle;
    font-size: 18px;
}

.treeview .tree-icon.folder:before {
    content: "\f07b"; /* Font Awesome folder icon */
}

.treeview .tree-icon.file:before {
    content: "\f15b"; /* Font Awesome file icon */
}

    </style>

</head>
<body>
    <form id="form1" runat="server">
       <asp:TreeView ID="TreeView1" runat="server" CssClass="treeview">
    <Nodes>
        <asp:TreeNode Text="Folder 1" Value="folder1">
            <asp:TreeNode Text="File 1.1" Value="file1.1"></asp:TreeNode>
            <asp:TreeNode Text="File 1.2" Value="file1.2"></asp:TreeNode>
        </asp:TreeNode>
        <asp:TreeNode Text="Folder 2" Value="folder2">
            <asp:TreeNode Text="File 2.1" Value="file2.1"></asp:TreeNode>
            <asp:TreeNode Text="File 2.2" Value="file2.2"></asp:TreeNode>
        </asp:TreeNode>
    </Nodes>
</asp:TreeView>

    </form>
</body>
</html>
