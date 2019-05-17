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
position:absolute;
left:19%;
top:5%;
}
</style>
<title>Add Product</title>
</head>
<body>
<div id="menu">
<h2>Menu</h1>
<a href="./adminPanelUsers">Users</a><br>
<a href="./adminPanelProducts">Products</a><br>
<a href="./adminPanelAddProduct.jsp">Add Product</a><br>
</div>
<div id="container">
<form action="addProduct" method="get" name="addProduct">
<table>
<tr>
<td><p>Product Image : </p></td>
<td><input type="file" name="image" accept="image/*"></td>
</tr>
<tr>
<td><p>Product Name : </p></td>
<td><input type="text" name="name" placeholder="Name"></td>
</tr>
<tr>
<td><p>Product Type : </p></td>
<td><input type="text" name="type" placeholder="Type"></td>
</tr>
<tr>
<td><p>Price : </p></td>
<td><input type="number" name="price" placeholder="Price"></td>
</tr>
<tr>
<td><p>Details : </p></td>
<td><textarea name="details" rows="10" cols="21" placeholder="Write Details Here"></textarea></td>
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