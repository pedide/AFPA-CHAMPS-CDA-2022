<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Intro</title>
<%@include file="includes/head.jsp"%>
<style>
	body{
		background-color:black !important;
	}
	.headBG{
	height : 215px;
	text-align:center;
	margin-bottom: 50px;
	}
	.video{
	text-align:center;
	}
	h1{
	color:red;
	font-weight:900;
	font-size:2.5em;
}
</style>
</head>
<body >
<div class = "principal" >
	<div class ="headBG" >
				<a href="index.jsp"><img src= "background/logo.png"/></a>
	</div>
	
	<h1 style="text-align:center; margin:20px;"> Le numéro un des ventes de cartes Pokémon <br>
	<a href="index.jsp" ><img src= "product-image/pokeball_btn.png" style="width: 100px;"/></a></h1>
	
	<div class = "video">
		 <video controls muted autoplay width="1000" >
		 	<source src = "product-image/PokemonGOSun.mp4" type="video/mp4">
		 </video>
	</div>
</div>
</body>html autoplay video

</html>