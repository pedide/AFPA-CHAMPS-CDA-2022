<%@ page errorPage="../error.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<style><%@include file="../css/home-style.css"%></style>
<!-- <link rel="stylesheet" href="../css/home-style.css"> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" /> -->
<title>Admin Header</title>

<!-- Header -->
<!-- <br> -->

<nav class="navbar navbar-expand-lg navbar-light bg-light-admin">
 	  <img src="../images/toque.jpg" alt="Logo Toque" />
<style>
.bg-light-admin {
background-color: #94282D; 
  
}
</style>

<div class="topnav sticky">

	<%
	String email = session.getAttribute("email").toString();
	%>
	<%-- <%String nom=session.getAttribute("userName").toString();%> --%>

	<center>
		<h2 style="color:#FFFAF0">Diablement Bon - Espace d'Administrateur</h2>
	</center>
	
		<h6 style="color:#FFFAF0 ; margin-left: 2%"><i class="fas fa-user-alt" style="color:#FF9999"></i>
			<%
			out.print(email);
			%> 
		</h6>
	
	<a href="adminHome.jsp" style="color:#FFFAF0"><i class="fas fa-home" style="color:#FF9999"></i> Accueil</a> 
	
	
	<a href="addNewProduct.jsp" style="color:#FFFAF0"><i class="fas fa-plus-square" style="color:#FF9999"></i>
		Ajout produit</a>  
		
	
	<a href="allProductEditProduct.jsp" style="color:#FFFAF0"><i class="fas fa-plus-square" style="color:#FF9999"></i>
		Edition produits</a>
		
	 
	<a href="allMessagesUsers.jsp" style="color:#FFFAF0"><i class="fa fa-edit" style="color:#FF9999"></i>
		Messages clients</a> 
		
	 
	<a href="../logout.jsp" style="color:#FFFAF0"><i class="fas fa-share-square" style="color:#FF9999"></i>
		Déconnexion</a> 
		
	

	<div class="search-container">
		<form action="searchHome.jsp" method="post">
			<input type="text" placeholder="Rechercher" name="search">
			<button type="submit">
				<i class="fa fa-search"></i>
			</button>
		</form>
	</div>
</div>

</nav>
</html>