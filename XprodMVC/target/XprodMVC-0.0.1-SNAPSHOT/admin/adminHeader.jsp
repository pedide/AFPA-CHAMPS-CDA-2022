<%@page errorPage="../error.jsp" %>
<%@page import="com.xprodmvc.model.User"%>
<%@page import="com.xprodmvc.model.*"%>
<%@page import="com.xprodmvc.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" /> 

<title> ADMINISTRATEUR </title>
</head>
<!-- Header -->
<br>
<div class="topnav sticky">

<%String email = session.getAttribute("email").toString(); %>

<center><h2>XPROD SHOPPING ADMIN </h2></center>
<h2><a href=""><%out.print(email);%><i class="fas fa-user-alt" style=" color: #ff7f50"></i></a></h2>
<a href="adminHome.jsp">ACCUEIL<i class="fa fa-home" style=" color: #ff7f50 	"></i></a>
<a href="addNewProduct.jsp">AJOUTER DES PRODUITS <i class="fas fa-plus-square" style=" color: #ff7f50"></i></a>
<a href="AllProductEditProduct.jsp">EDITER PRODUITS<i class="fas fa-plus-square" style=" color: #ff7f50"></i></a>
<!-- <a href="">Message  <i class="fab fa-elementor"></i></a>
<a href="">Add New Product <i class="fas fa-plus-square"></i></a>
<a href="">Add New Product <i class="fas fa-plus-square"></i></a> -->
<a href="messagerie.jsp" >MESSAGERIE <i class="fas fa-envelope" style=" color: #ff7f50"></i></a>
<a href="../logout.jsp">LOGOUT<i class="fas fa-sign-out-alt" style=" color: #ff7f50" ></i>
</a>
<div class="search-container">
<form action="searchHome.jsp" method="post">
<input type="text" placeholder="search" name="search">
<button type="submit"><i class="fa fa-search" style=" color: #ff7f50"></i></button>


</form>
</div>

</div>

<body>

</body>
</html>