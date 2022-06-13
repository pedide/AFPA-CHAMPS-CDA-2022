<%@ page errorPage="../error.jsp" %>
<%@ page import="com.xprodmvc.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style><%@include file="../css/home-style.css"%></style>
<title>Admin Header</title>

<nav class="navbar navbar-expand-lg navbar-light bg-light-admin">
	<%
	String email = session.getAttribute("email").toString();
	%>
	<img src="../images/toque.jpg" alt="Logo Toque" />
	<h3 style="margin-left: 2% ; vertical-align:middle">Diablement Bon
	<br>Espace de Travail d'Administrateur</h3>
 
 <style>
.bg-light-admin {
  background-color: #94282D;
}
</style>
 	
	
	
	
 	<div class="container"> 

  <div class="container-fluid">

  	<div class="d-flex">

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto">
     
     	<li class="nav-item">
          <a class="nav-link active" aria-current="page" href="" style="color:#FFFAF0"><i class="fas fa-user-alt" style="color:#FF9999"></i> 
          <%
			out.print(email);
			%> </a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="adminHome.jsp" style="color:#FFFAF0"><i class="fas fa-home" style="color:#FF9999"></i> 
          Accueil</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="addNewProduct.jsp" style="color:#FFFAF0"><i class="fas fa-plus-square" style="color:#FF9999"></i> 
          Ajout produit</a>
        </li>
        
        <li class="nav-item">
        	<a href="allProductEditProduct.jsp" style="color:#FFFAF0"><i class="fas fa-plus-square" style="color:#FF9999"></i>
			Edition produits</a>
        </li>
        <li class="nav-item">
        	<a href="allMessagesUsers.jsp" style="color:#FFFAF0"><i class="fas fa-plus-square" style="color:#FF9999"></i>
			Messages clients</a> 
        </li>
        <li class="nav-item">
        	<a href="../logout.jsp" style="color:#FFFAF0"><i class="fas fa-share-square" style="color:#FF9999"></i>
			Déconnexion</a> 
        </li>
       </ul>  
      <div class="search-container">
			<form action="searchHomeUser.jsp" method="post">
				<input type="text" placeholder="Rechercher" name="search">
				<button type="submit"><i class="fa fa-search"></i></button>
			</form>
      	
		</div>
		     
    </div>
    </div>
    </div>
   </div> 

</nav>