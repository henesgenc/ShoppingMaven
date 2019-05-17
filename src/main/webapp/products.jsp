<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.List, Data.Product, java.util.ArrayList"
    %>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Shop Homepage - Start Bootstrap Template</title>

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

/* The container <div> - needed to position the dropdown content */
.dropdown {
	opacity:0;
    position: relative;
    display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
color: orange;
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
#cartdiv{
	float:right;
	position:fixed;
}
#urunler{
height:470px;
}
#products{
	margin-top:10px;
}

#addcartbutton{
	width: 200px;
}
#loginbutton{
	margin-left: 100px;	
}
#menu{
	position:fixed;
	top:50%;
}
</style>
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
<div id="cartdiv">
 <a href="./viewCart"><img src=".\img\cartlogo3.png" height="100px" width="200px"></a>
</div>  
    <!-- Page Content -->
    <div class="container">
      <div class="row">

        <div class="col-lg-3">

		          <div class="dropdown">
		  <button class="dropbtn">Products</button>
		  <div class="dropdown-content">
		    <a href="./computers">Computers</a>
		    <a href="./computerparts">Computer Parts</a>
		    <a href="./phones">Phones</a>
		    <a href="./products">Products</a>
		  </div>
		
		 
		</div>

        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">

          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
       
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">
                <img class="d-block img-fluid" src=".\img\2.png" height="350px" width="900" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src=".\img\3.png" height="350px" width="900" alt="First slide">
              </div>
              <div class="carousel-item">
               <img class="d-block img-fluid" src=".\img\4.png" height="350px" width="900" alt="First slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>  
          <div class="row">
	 <%	String type = (String)request.getAttribute("type");
	 	List<Product> products = (List<Product>)request.getAttribute("products");
		if(type==null){
		for(Product p: products){
		%><div class="col-lg-4 col-md-6 mb-4" id="urunler">
	              <div class="card h-100">
	      			<a href="viewProductDetails?id=<%=p.getId()%>"><img src=".\img\<%= p.getImage() %>" height="250px" width="250px" id ="products"></a>
	                <div class="card-body">
	                <h4 class="card-title">
	                  <a href="viewProductDetails?id=<%=p.getId()%>"><%=p.getName()%></a>
	                  </h4>
	                  <h5>₺ <%= p.getPrice()%><br></h5>
	                  <a href="addCart?id=<%= p.getId() %>"><button type="button" class="btn btn-success" id="addcartbutton" >Add Cart</button></a>
	                </div>
	              </div>
	            </div>
	            <% } } else{
        	   for(Product p: products){
         		if(p.getType().equals(type)){
          		 %>
	           <div class="col-lg-4 col-md-6 mb-4" id="urunler">
	              <div class="card h-100">	
	      			<a href="viewProductDetails?id=<%=p.getId()%>"><img src="./img/<%= p.getImage() %>" height=250px2" width="250px" id ="products"></a>
	                <div class="card-body">
	                <h4 class="card-title">
	                  <a href="viewProductDetails?id=<%=p.getId()%>"><%=p.getName()%></a>
	                  </h4>
	                  <h5>₺ <%= p.getPrice()%><br></h5>
	                  <a href="addCart?id=<%= p.getId() %>"><button type="button" class="btn btn-success" id="addcartbutton" >Add Cart</button></a>
	                </div>
	              </div>
	            </div><% } } } %>
          </div>
          <!-- /.row -->
        </div>
        <!-- /.col-lg-9 -->
      </div>
      <!-- /.row -->
    </div>
    <!-- /.container -->
    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
      <!-- /.container -->
    </footer>
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>