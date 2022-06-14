<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Home</title>
		<%@include file="includes/navbar.jsp"%>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
		<!-- 	Calendar    -->	
		 <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
		 <link rel="stylesheet" href="/resources/demos/style.css"><link rel="stylesheet" href="css/homeProjet.css">
		 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		 <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
		<!--   Home.css  -->  
		 <link rel="stylesheet" href="css/home-style.css">

		 
		 <!-- Calendar JS -->
		 <script src="JS/homeJS.js"></script>
		 
		 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" />
		 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.0/TweenMax.min.js" />	  

	</head>
	<body>  
		<div class="container">
			<div class="containerFlexCenter">
				<video playsinline autoplay muted loop> <source src="videos/video.mp4" type="video/mp4"></video>
				<div class="containerCalBook" >
					<div class="containerFlex">
						<h2 class="text-germania-white h2Title">Réserver votre chambre |</h2>
						<h2 class="text-germania-white h2-subtitle-1">Date d'arrivée: </h2>
						<input type="text" id="datepicker" class="textfield-calendar">
						<h2 class="text-germania-white h2-subtitle-2">Date de départ: </h2>
						<input type="text" id="datepicker2" class="textfield-calendar">
						<button type="submit" class="btn button" style=" height: 2.2em;  margin-top: 1.5em; margin-left: 3em">Vérifier disponibilité</button>
					</div>		
				</div>
			</div>
		</div>
				
		
		<div class="containerDiapo">
			<h3 class="title-germania-gold"> Scroll down to discover more</h3>
				<div class="container" style="margin-top: 20em">
					<div class="thumbex">
						<div class="thumbnail"><a href="javascript:void(0)"> <img src="images/terrace-eiffeil.jpg"/><span>La terrasse</span></a></div>
					</div>
					<div class="thumbex"> 
					    <div class="thumbnail"><a href="javascript:void(0)"><img src="images/hotel_georgesV_chambre.jpg"/><span>Les suites</span></a></div>
					</div>
					<div class="thumbex">
					    <div class="thumbnail"><a href="javascript:void(0)"><img src="images/spaHotel.jpg"/><span>Le Spa</span></a></div>
					</div>
			   </div>	
		</div>
		<%@include file="includes/chat.jsp"%>

	</body>
	
	<footer>

	</footer>
</html>