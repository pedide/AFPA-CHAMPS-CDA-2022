<%-- <%@page errorPage="error.jsp" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>

<title>Admin Header</title>
</head>
<!--  Header -->
<br>
<div class="topnav sticky">

<%String email = session.getAttribute("email").toString(); %>
 <%--<%String nom = session.getAttribute("username").toString(); %>--%>	

	<center>
	<h2>Xprod shopping admin dashboard</h2>
	</center>
	<h2><a href=""><%out.println(email); %><i class="fas fa-user-alt"></i></a></h2>
		<a href="../index.jsp">Home<i class="fas fa-institution"></i></a> 
	<a href="addNewProduct.jsp">Add New Product<i class="fas fa-plus-square"></i></a>
	
	<a href="allProductEditProduct.jsp">All Product & Edit Product<i class="fas fa-plus-square"></i></a>
	<a href="../logout.jsp">Logout<i class="fas fa-share-square"></i></a>
	<div class="search-container">
	<form action="../searchHome.jsp" method="post"> <!-- action search qui renvoie vers la page search.jsp -->
	<input type="text" placeholder="search" name="search">
	<button type="submit"><i class= " fa fa-search"></i> </button> 
	</form>		
	</div>

<body>
</body>
</html>