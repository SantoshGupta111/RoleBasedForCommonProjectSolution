<%@ Page Title="" Language="C#" MasterPageFile="~/Design Layout/MasterLayout.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="UIExecute.Design_Layout.product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <%--<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        header {
            background-color: #009BA8;
            color: white;
            padding: 10px;
            text-align: center;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .product {
            background-color: white;
            border: 1px solid #ddd;
            padding: 20px;
            margin: 10px;
            text-align: center;
            display: inline-block;
            width: 30%;
            box-sizing: border-box;
        }
        .product img {
            max-width: 100%;
            height: auto;
        }
        .product-title {
            font-weight: bold;
            margin-top: 10px;
        }
        .product-price {
            color: #e44d26;
            margin-top: 5px;
        }
        .add-to-cart {
            background-color: #e44d26;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 14px;
        }
        .add-to-cart:hover {
            background-color: #c5371b;
        }
    </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container">
        <div class="product">
            <img src="product1.jpg" alt="Product 1">
            <div class="product-title">Product 1</div>
            <div class="product-price">$19.99</div>
            <button class="add-to-cart">Add to Cart</button>
        </div>
        <div class="product">
            <img src="product2.jpg" alt="Product 2">
            <div class="product-title">Product 2</div>
            <div class="product-price">$29.99</div>
            <button class="add-to-cart">Add to Cart</button>
        </div>
        <!-- Add more product divs here -->
    </div>

</asp:Content>
