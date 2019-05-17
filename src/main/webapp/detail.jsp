<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<title></title>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/shop-homepage.css" rel="stylesheet">
</head>
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

/* The container <div> - needed to position the dropdown content */
.dropdown {
    position: relative;
    display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
color: orange;
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 200px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    border: 1px solid;
    border-radius: 2px;
}

/* Links inside the dropdown */
.dropdown-content a {
    color: orange;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}
#solimg{

	margin-top:100px;
	margin-left:300px;
	width:402px;
}
#sagbilgi{
	height : 400px;
	width : 800px;

	margin-left : 750px;
	margin-top : -300px;
}
/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: white}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
    display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
    background-color: #f9f9f9;
}
#navbarid{
background-color:orange;
}
#orta{
	
	height:600px;
	width: auto;

}
#addcartbutton{
	width:300px;
	margin-left:75px;
}
tr{
	height: 100px;
}
</style>
<body>
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
    

<%
	Data.Product product = (Data.Product)request.getAttribute("product");
	int id = product.getId();
	String img = product.getImage();
	String name = product.getName();
	String detail = product.getDetail();
	float price = product.getPrice();
	String type = product.getType();
%>
    <div id="orta">
    	<div id="solimg"><img src=".\img\<%= img %>" alt="<%= name %>" height=350px" width="350px"></div>
    	<div id="sagbilgi">
    		<table>
    			<tr><h1><%= name %> </h1></tr>
    			<tr><h5>₺ <%= price%><br></h5></tr>
    			<tr><p> <%= detail %> </p></tr>
    			<tr><a href="addCart?id=<%= product.getId() %>"><button type="button" class="btn btn-success" id="addcartbutton" >Add Cart</button></a></tr>
    		</table>
    	
    	</div>
    
    </div>

    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>