<%@ page import="com.ab_motors.connection.dbCon"%>
<%@ page import="com.ab_motors.model.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.ab_motors.dao.productsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Users auth = (Users) request.getSession().getAttribute("auth");

if (auth != null) {
	request.setAttribute("auth", auth);
}
productsDAO pd = new productsDAO(dbCon.getConnection());
List<products> products = pd.getAllProducts();

ArrayList<cart> cart_list = (ArrayList<cart>) session.getAttribute("cart-list");
List<cart> cartProduct = null;

if (cart_list != null) {
	cartProduct = pd.getCardProducts(cart_list);
	request.setAttribute("cart_list", cart_list);

}
%>
<!DOCTYPE html>
<html>
<head>
<title>AB motors</title>

<link rel="stylesheet" href="css/homestyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
<%@include file="incloudes/navbar.jsp"%>
</head>

<body>
	<div class="hero">
		<h1>Bienvenue sur AB Shopping</h1>
		<br>
	</div>
	<br>
    
    
    <div class="left-div">
    <div class="hero1">
    <h1>Ventes de Produits pour vos voitures</h1><br>
	<h3>Vous trouverez <a href="index.jsp">ici</a> tout types de produits pour vos véhicules.</h3>
	</div></div>
	
	<div class="right-div">
	<div class="hero2">
	<h1>Vente de véhicule d'occasion</h1><br>
	<h3>
		Vous pouvez aussi accédez à notre vente de véhicules d'occasions.<br>

		Pour cela <a href="signup.jsp">créez un compte</a> et <a href="login.jsp">connectez vous.</a><!-- <br> Vous aurez accés
		à notre page Vente de véhicules.<br> 
		Jettez y un coup d'oeil.<br>
		Et si un véhicule vous interresse faite une demande de rendez-vous.<br>
		Une réponse vous sera envoyer dans les 24h qui suivent. -->
		</h3>
		</div></div>
</body>
</html>