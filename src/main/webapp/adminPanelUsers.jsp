<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.List, Data.Users"
    %>	
<html>
<head>
<style>
td{ border: 1px solid; width:100px; }
#menu{ width:10%; position:fixed; top:0px; left:0px; height:100%; background-color:#ffe6c6; padding:50px; }
#menu a{ text-decoration:none; color:black; font-size:x-large; }
#menu a:hover{ color:blue; }
#container{ position:absolute; left:19%; top:5%; }
</style>
<title>Insert title here</title>
</head>
<body>
<div id="menu">
<h2>Menu</h1>
<a href="./adminPanelUsers">Users</a><br>
<a href="./adminPanelProducts">Products</a><br>
<a href="./adminPanelAddProduct.jsp">Add Product</a><br>
</div>
<div id="container"><% ServletContext appContext = 
request.getSession().getServletContext(); %>
<p>Number of Online Users : <%= appContext.getAttribute("sessioncount").toString() %></p>
<table>
<tr style="font-weight: bold;">

<td>ID</td><td>Username</td><td>Password</td><td>Name</td><td>Surname</td><td>Birthdate</td>
</tr>
<% 
List<Users> users = (List<Users>)
request.getAttribute("users");
for(Users u: users) {%>
<tr>
<td><%= u.getID() %></td>
<td><%= u.getUsername() %></td>
<td><%= u.getUserPassword() %></td>
<td><%= u.getUserName() %></td>
<td><%= u.getUserSurname() %></td>
<td><%= u.getBirthdate() %></td>
<td><a href="./editUser?id=<%= u.getID() %>">Edit</a></td>
<td><a href="./deleteUser?id=<%= u.getID() %>">Delete</a></td>
<% } %>
</tr>
</table>
</div>
</body>
</html>
