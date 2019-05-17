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
<title>EditUser</title>
</head>
<body>
<div id="menu">
<h2>Menu</h1>
<a href="./adminPanelUsers">Users</a><br>
<a href="./adminPanelProducts">Products</a><br>
<a href="./adminPanelAddProduct.jsp">Add Product</a><br>
</div>
<div id="container">
<form action="./editUsers" method="get" name="edit">
<%
String id = request.getAttribute("id").toString();
String username = request.getAttribute("username").toString();
String password = request.getAttribute("password").toString();
String name = request.getAttribute("name").toString();
String surname = request.getAttribute("surname").toString();
String birthdate = request.getAttribute("birthdate").toString();
%>
<table>
<tr>
<td><p>ID : </p></td>
<td><input type="text" name="id" readonly="readonly" value="<%= id %>"></td>
</tr>
<tr>
<td><p>Username : </p></td>
<td><input type="text" name="username" value="<%= username %>"></td>
</tr>
<tr>
<td><p>Password : </p></td>
<td><input type="password" name="password" value="<%= password %>"></td>
</tr>
<tr>
<td><p>Name : </p></td>
<td><input type="text" name="name" value="<%= name %>"></td>
</tr>
<tr>
<td><p>Surname : </p></td>
<td><input type="text" name="surname" value="<%= surname %>"></td>
</tr>
<tr>
<td><p>Birthdate : </p></td>
<td><input type="text" name="birthdate" value="<%= birthdate %>"></td>
</tr>
<tr>
<td colspan="2" >
<input type="submit" value="Submit" style="width:100%; height:30px">
</td>
</tr>
</table>
</form>
</div>
</body>
</html>