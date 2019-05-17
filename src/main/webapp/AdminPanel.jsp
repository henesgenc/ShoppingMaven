<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.List, Data.Users"
    %>	
<html>
<head>
<title>Insert title here</title>
<style>
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
}
</style>
</head>
<body>
<div id="menu">
<h2>Menu</h1>
<a href="./adminPanelUsers">Users</a><br>
<a href="./adminPanelProducts">Products</a><br>
<a href="./adminPanelAddProduct.jsp">Add Product</a><br>
</div>
<div id="container"><h1>Welcome to the Admin Panel.</h1></div>

</body>
</html>