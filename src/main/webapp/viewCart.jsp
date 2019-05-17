<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.List, Data.Product"
    %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	 <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/shop-homepage.css" rel="stylesheet">
<style>
.dropbtn {
    color: orange;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
    border: 1px solid;
    border-radius: 2px;
}
#navbarid{
background-color:orange;
}
#cartdiv{
	float:right;
	position:fixed;
}
#urunler{
height:450px;
}
img{
 width:100px;
 height:75px;
}
tr{
width: 100px;
height: 100px;
}
td{
float:left;
margin:10px;
}
.tablosutun{
	float:left;
	margin:10px;
}
.tddizayn{
	margin-top:40px;
	margin-left: 70px;
}
#deletebutton{
	width:24px;
	height: 24px;
}
#cartlist{
	margin-top:50px;
	margin-left: 400px;
}
.cartlisttr{
	margin-top:50px;
}
</style>
<title>Insert title here</title>
</head>
<body>
<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="navbarid">
      <div class="container">
       <a class="navbar-brand" href="./products">Shopping Maven</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
         <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="./products">Products
              </a>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="./filter?type=Computer">Computers</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="./filter?type=Phones">Phones</a>
            </li>
          </ul>
        </div>
      </div>
      <div id="LoginRegister">
				<% 
			if(session.getAttribute("username")==null){ %>
			<a href="./login"><button type="button" class="btn btn-success">Login</button></a>
					<a href="./register"><button type="button" class="btn btn-success">Register</button></a>
			<%} else{ %>
			  	<p>
			<%= request.getSession().getAttribute("username") %>
			<a href="./logout"><button type="button" class="btn btn-danger">Logout</button></a>
			<%}  %>
			</p>
				</div>
    </nav>
	<div id ="cartlist">
	<table>
	<%
			Object cart = request.getSession().getAttribute("cart");
			if(cart!=null){
			List<Data.Product> cartList = (List<Product>)cart;
		for(Product p: cartList){
	%>	
		<tr class="cartlisttr">
		<td style="width: 100px"><img src=".\img\<%= p.getImage() %>" width="50px" height="50px"></td>
		 <td class ="tddizayn" style="width: 100px"><%= p.getName() %></td>
	     <td class ="tddizayn" style="width: 100px"><%= p.getPrice() %> ₺ </td> 
		 <td class ="tddizayn" style="width: 100px"><a href="viewProductDetails?id=<%= p.getId() %>">(Details)</a></td>
		 <td class ="tddizayn"  style="width: 100px"><a href="deleteProductList?id=<%= p.getId() %>"><img alt="" src=".\img\delete.png" style ="width: 24px; height: 24px;"></a></td>
	</tr>
	<% } %></table><% }else{%>
		<h1>Your cart is empty</h1>
	<% } %>
	</div>		
</body>
</html>
