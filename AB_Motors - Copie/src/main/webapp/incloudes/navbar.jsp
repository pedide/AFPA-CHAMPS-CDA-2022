<%@page import="com.ab_motors.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/homestyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudfare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/boostrap/4.0.0/css/boostrap.min.css" />
<title>Admin header</title>


</head>
<body>
	<div class="lineaire-simple">
		<div class="topnav sticky">
			<img class="card-img-top" src="product-image/logo.png"
				style="width: 70px;">
			<h2>AB SHOPPING</h2>
			<%
			Users auth1 = (Users) request.getSession().getAttribute("auth");
			%>
			<%
			if (auth1 != null) {
			%>
			<%
			String email = session.getAttribute("email").toString();
			%>
			<a href=""><%=email%><i class="fas fa-user-alt"></i></a>
			<a href="Accueil.jsp">Accueil <i class="fas fa-university"></i></a>
			 <a href="index.jsp">Nos Produits <i class="fas fa-solid fa-tags"></i></a>
			  <a href="vehicules.jsp">Nos véhicules <i class="fas fa-solid fa-car"></i></a>  
			 <a href="orders.jsp">Commande <i class="fas fa-plus-square"></i></a> 
			 <a href="card.jsp">Panier <i class="fas fa-shopping-cart"></i></a> 
			
			 <a href="logout.jsp">Déconnexion <i class="fas fa-share-square"></i></a>
			<%
			} else {
			%>

			<a href="Accueil.jsp">Accueil <i class="fas fa-university"></i></a>
			 <a href="index.jsp">Nos Produits <i class="fas fa-solid fa-tags"></i></a> 
			  <a href="card.jsp">Panier <i class="fas fa-shopping-cart"></i></a> 
			  <a href="login.jsp">Connexion <i class="fas fa-share-square"></i></a>
			<%
			}
			%>

			<div class="search-container">
				<form action="search.jsp" method=post>
					<input type="text" placeholder="Rechercher.." name="search">
					<button type="submit">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>