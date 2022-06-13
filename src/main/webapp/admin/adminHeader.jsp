<%-- <%@page errorPage="../error.jsp"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/AjouterNvProduit-style.css"> 
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />


</head>
<br>

<div class="topnav sticky">

 <% String email=session.getAttribute("email").toString(); %> 
 <img src="../product-image/bigbearslogo.jpg">
<h2>   BIGBEARS SHOPPING ADMIN DASHBOARD</h2>

<h2><a href="">Bienvenue :<%=email%> <i class="fas fa-user-alt"></i></a></h2>
<a href="../home.jsp">Home Client <i class="fas fa-home"></i></a>
<a href="adminHome.jsp">Home Admin <i class="fas fa-home"></i></a>
<a href="AjouterNvProduit.jsp">Ajouter un nouveau produit <i class="fas fa-plus-square"></i></a>
<a href="AllProductEditProduct.jsp">Tous les produits et Modifier un produit <i class="fas fa-plus-square"></i></a>
<a href="../logout.jsp">Logout <i class="fas fa-share-square"></i></a>
<div class="adminHeader">
<form class="adminHeader" action="searchHome2.jsp" method="post">
<input type="text" placeholder="search" name="search">
<button  type="submit"><i class="fa fa-search"></i></button>
</form>
</div>
</div>
<body>

</body>
</html>