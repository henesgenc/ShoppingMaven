<!doctype html>
<html>
<head>

<style>
	@import url(https://fonts.googleapis.com/css?family=Montserrat:700);
	.btn-hover {
    width: 300px;
	height:300px;
    font-size: 16px;
    font-weight: 600;
    color: #fff;
    cursor: pointer;
    margin: 20px;
    text-align:center;
    border: none;
    background-size: 300% 100%;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
	border-right: medium #000000;
	border-left:medium #000000;
}
	.btn-hover:hover {
    background-position: 100% 0;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
		-webkit-mask-image: linear-gradient(-75deg, rgba(0,0,0,.6) 30%, #000 50%, rgba(0,0,0,.6) 70%);
  -webkit-mask-size: 200%;
  animation: shine 2s infinite;
}
	@-webkit-keyframes shine {
  from {
    -webkit-mask-position: 150%;
  }
  
  to {
    -webkit-mask-position: -50%;
  }
	}
	.btn-hover:focus {
    outline: none;
}
	.btn-hover.color-3 {
    background-image: linear-gradient(to bottom left, #667eea, #764ba2, #6B8DD6, #8E37D7);
    box-shadow: 0 4px 15px 0 rgba(116, 79, 168, 0.75);
}
body { 
  background-color:#000; 
  overflow:hidden;
}
h3 {
	position: absolute;
	top:50%;
	width: 100%;
	text-align: center;
	bottom:2em;
	color:hsla(360, 45%, 95%, .9);
	font-family: 'Montserrat', sans-serif;
	letter-spacing: .8em;
	font-size:20pt;
	font-weight: normal;
	opacity: .2;
	text-transform: uppercase;
	text-shadow: hsla(0, 45%, 5%, .3) 0 0 1px, hsla(360, 55%, 95%, .3) 0 -1px 2px,  hsla(0, 45%, 5%, .3) 0 -1px 2px, hsla(360, 55%, 95%, .3) 0 20px 15px;
	opacity: 1;
}
a{
  text-decoration:none;
}
.anim {
  position: absolute;
 width: .001vmin;
 height: .001vmin;
  border-radius: 50%;
  opacity: .25;
}

div:nth-child(1) {
  -webkit-box-shadow: 0 0 45vmax 45vmax #44444;
  box-shadow: 0 0 45vmax 45vmax #ff00ff;
  -webkit-animation: hue 10s 0s linear infinite, move1 19s 0s linear infinite;
  animation: hue 10s 0s linear infinite, move1 19s 0s linear infinite;
}

div:nth-child(2) {
  -webkit-box-shadow: 0 0 45vmax 45vmax #aaaaa;
  box-shadow: 0 0 45vmax 45vmax #ffffff;
  -webkit-animation: hue 15s 0s linear infinite, move2 25s 0s linear infinite;
  animation: hue 15s 0s linear infinite, move2 25s 0s linear infinite;
}

div:nth-child(3) {
  -webkit-box-shadow: 0 0 45vmax 45vmax #ccccc;
  box-shadow: 0 0 45vmax 45vmax #00ffff;
  -webkit-animation: hue 20s 0s linear infinite, move3 15s 0s linear infinite;
  animation: hue 20s 0s linear infinite, move3 15s 0s linear infinite;
  opacity: .2;
}
@-webkit-keyframes 
hue { 0% {
 -webkit-filter: hue-rotate(0deg);
 filter: hue-rotate(0deg);
}
 100% {
 -webkit-filter: hue-rotate(360deg);
 filter: hue-rotate(360deg);
}
}
@keyframes 
hue { 0% {
 -webkit-filter: hue-rotate(0deg);
 filter: hue-rotate(0deg);
}
 100% {
 -webkit-filter: hue-rotate(360deg);
 filter: hue-rotate(360deg);
}
}
@-webkit-keyframes 
move1 { 0% {
 top: 0vh;
 left: 50vw;
}
 25% {
 left: 0vw;
}
 50% {
 top: 100vh;
}
 75% {
 left: 100vw;
}
 100% {
 top: 0vh;
 left: 50vw;
}
}
@keyframes 
move1 { 0% {
 top: 0vh;
 left: 50vw;
}
 25% {
 left: 0vw;
}
 50% {
 top: 100vh;
}
 75% {
 left: 100vw;
}
 100% {
 top: 0vh;
 left: 50vw;
}
}
@-webkit-keyframes 
move2 { 0% {
 top: 50vh;
 left: 100vw;
}
 25% {
 top: 100vh;
}
 50% {
 left: 0vw;
}
 75% {
 top: 0vh;
}
 100% {
 top: 50vh;
 left: 100vw;
}
}
@keyframes 
move2 { 0% {
 top: 50vh;
 left: 100vw;
}
 25% {
 top: 100vh;
}
 50% {
 left: 0vw;
}
 75% {
 top: 0vh;
}
 100% {
 top: 50vh;
 left: 100vw;
}
}
@-webkit-keyframes 
move3 { 0% {
 top: 100vh;
 left: 50vw;
}
 25% {
 left: 100vw;
}
 50% {
 top: 0vh;
}
 75% {
 left: 0vw;
}
 100% {
 top: 100vh;
 left: 50vw;
}
}
@keyframes 
move3 { 0% {
 top: 100vh;
 left: 50vw;
}
 25% {
 left: 100vw;
}
 50% {
 top: 0vh;
}
 75% {
 left: 0vw;
}
 100% {
 top: 100vh;
 left: 50vw;
}
}
	#LoginRegister{
		position:absolute;
		width: .001vmin;
		height: .001vmin;
		right: 95px;
		margin: 5px;
	}
	#LoginRegister a{
		font-family: Constantia, "Lucida Bright", "DejaVu Serif", Georgia, "serif";
		float:left;
		font-size: 120%;
		color:white;
	}
	#LoginRegister a:hover{
		color:black;
	}
	#logo{
		position:absolute;
		top:5%;
		left:25%;
	}
</style>	
<meta charset="utf-8">
<title>Shopping Maven</title>
</head>
<body>
<div class="anim"></div>
<div class="anim"></div>
<div class="anim"></div>	
	<div id="LoginRegister">
	<% 
if(session.getAttribute("username")==null){ %>
<a href="./login">Login</a>
		<a href="./register">Register</a>
<%} else{ %>
  	<p>
<%= request.getSession().getAttribute("username") %>
<a href="./logout"><button class="Logout">Logout</button></a>
<%}  %>
</p>
	</div>
	<img src="./inner-images/logo.png" width="54%" id="logo">
	<h3 class = "text_fade ">
	<a href="./products"><button class="btn-hover color-3" name="Products" >Products</button></a>
	<a href="./filter?type=Computer"><button class="btn-hover color-3" name="Computers" >Computer</button></a>
		<a href="./filter?type=Phones"><button class="btn-hover color-3" name="Phones" >Phones</button></a>
 	</h3>
	

</body>
</html>
