<%@page errorPage="error.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />

<title>Admin Header</title>
</head>
<!-- Header -->
<br>
<div class="topnav sticky">
	<%
	String email = session.getAttribute("email").toString();
	%>
	<center>
		<h2>XPROD SHOPPING ADMIN DASHBORD</h2>
		<h3>Bienvenue <%out.print(email); %></h3>
	</center>
	<a href=""><i class="fas fa-user-alt"></i> <%out.print(email); %></a>
	<a href="adminHome.jsp">Accueil <i class = "fas fa-home"></i></a>
	<a href="addNewProduct.jsp">Ajouter nouveau Produit <i class="fas fa-plus-square"></i></a> <a href="allProductEditProduct.jsp">Tous les Produits & Editer Produits <i class="fas fa-plus-square"></i></a>
	<a href = "messageAdmin.jsp">Messages reçus <i class = "fas fa-plus-square"></i></a>
	<a href="../logout.jsp">Log Out <i class="fas fa-share-square"></i></a>
	<div class ="serch-container" style="float:right;">
		<form action="searchHomeAdmin.jsp" method="post">
			<input type="text" placeholder="rechercher" name="search" style="background-color: aquamarine;">
			<button type="submit"><i class="fas fa-search"></i></button>
		</form>
	</div>
</div>
<body>

</body>
</html>