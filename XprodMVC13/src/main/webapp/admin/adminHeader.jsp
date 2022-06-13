<%@ page errorPage="../error.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
<title>Admin Header</title>

<!-- Header -->
<br>
<div class="topnav sticky">

	<%
	String email = session.getAttribute("email").toString();
	%>
	<%-- <%String nom=session.getAttribute("userName").toString();%> --%>

	<center>
		<h2>Diablement Bon Espace de Travail d'Admin</h2>
	</center>
	<h2>
		<a href="">
			<%
			out.print(email);
			%> <i class="fas fa-user-alt"></i>
		</a>
	</h2>
	<a href="adminHome.jsp">Accueil <i class="fas fa-home"></i>
	</a> 
	<a href="addNewProduct.jsp">Ajouter un nouveau produit 
		<i class="fas fa-plus-square"></i>
	</a> 
	<a href="allProductEditProduct.jsp">Tous les produits et Edition produit 
		<i class="fas fa-plus-square"></i>
	</a> 
	<a href="allMessagesUsers.jsp">Messages des clients 
		<i class="fas fa-plus-square"></i>
	</a> 
	<a href="../logout.jsp">Se déconnecter 
		<i class="fas fa-share-square"></i>
	</a>

	<div class="search-container">
		<form action="searchHome.jsp" method="post">
			<input type="text" placeholder="Rechercher" name="search">
			<button type="submit">
				<i class="fa fa-search"></i>
			</button>
		</form>
	</div>
</div>


</html>