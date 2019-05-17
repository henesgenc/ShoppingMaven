<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.List, Data.Product"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
td{
	border:1px solid;
	padding: 5px;
	text-align:center;
}
#menu{
width:10%;
position:fixed;
top:0px;
left:0px;
height:100%;
background-color:#ffe6c6;
padding:50px;
}
#menu a{
text-decoration:none;
color:black;
font-size:x-large;
}
#menu a:hover{
color:blue;
}
#container{
position:absolute;
left:19%;
top:5%;
}
</style>
<title>AdminPanelProducts</title>
</head>
<body>
<div id="menu">
<h2>Menu</h1>
<a href="./adminPanelUsers">Users</a><br>
<a href="./adminPanelProducts">Products</a><br>
<a href="./adminPanelAddProduct.jsp">Add Product</a><br>
</div>
<div id="container">
<table style="margin-right: 50px; margin-bottom: 50px">
<tr style="font-weight: bold;">
<td>ID</td><td>Name</td><td>Price</td><td>Image</td><td>Type</td><td>Detail</td>
</tr>
<% 
List<Product> products = (List<Product>)
request.getAttribute("products");
for(Product p: products) {%>
<tr>
<td><%= p.getId() %></td>
<td><%= p.getName() %></td>
<td><%= p.getPrice() %></td>
<td><%= p.getImage() %></td>
<td><%= p.getType() %></td>
<td><%= p.getDetail() %></td>
<td><a href="./editProduct?id=<%= p.getId() %>">Edit</a></td>
<td><a href="./deleteProduct?id=<%= p.getId() %>">Delete</a></td>
<% } %>
</tr>
</table>
</div>
</body>
</html>