<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
top:5%;
position:absolute;
left:19%;
}
input{
width:100%;
}
textarea{
width:100%;
}
</style>
<title>Edit Product</title>
</head>
<body>
<div id="menu">
<h2>Menu</h1>
<a href="./adminPanelUsers">Users</a><br>
<a href="./adminPanelProducts">Products</a><br>
<a href="./adminPanelAddProduct.jsp">Add Product</a><br>
</div>
<div id="container">
<form action="EditProductServlet" method="get" name="edit">
<%
String id = request.getAttribute("id").toString();
String image = request.getAttribute("image").toString();
String name = request.getAttribute("name").toString();
String type = request.getAttribute("type").toString();
String price = request.getAttribute("price").toString();
String detail = request.getAttribute("detail").toString();
%>
<table>
<tr>
<td><p>ID : </p></td>
<td><input type="text" name="id" readonly="readonly" value="<%= id %>"></td>
</tr>
<tr>
<td><p>Image : </p></td>
<td><input type="text" name="image" readonly="readonly" value="<%= image %>"><input type="file" name="changeimage"></td>
</tr>
<tr>
<td><p>Name : </p></td>
<td><input type="text" name="name" value="<%= name %>"></td>
</tr>
<tr>
<td><p>Type : </p></td>
<td><input type="text" name="type" value="<%= type %>"></td>
</tr>
<tr>
<td><p>Price : </p></td>
<td><input type="number" name="price" value="<%= price %>"></td>
</tr>
<tr>
<td><p>Detail : </p></td>
<td><textarea name="details" rows="10" cols="21"><%= detail %></textarea></td>
</tr>
<tr>
<td colspan="2" >
<input type="submit"  style="width:100%; height:30px">
</td>
</tr>
</table>
</form>
</div>
</body>
</html>