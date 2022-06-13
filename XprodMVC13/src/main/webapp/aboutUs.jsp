<%@ page import="com.xprodmvc.model.User"%>
<%@ page import="com.xprodmvc.model.Cart"%>
<%@ page import="java.util.*"%>
<%@ page import="java.nio.charset.StandardCharsets"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<title>AboutUs</title>
<link rel="stylesheet" href="./css/aboutUs-style.css">

<%@include file="includes/head.jsp"%>
<body>
<%@include file="includes/navbar.jsp"%>

<div class="hero">
	<h1>Vous avez un événement ? </h1>
	<h5>DIABLEMENT BON VOUS ACCOMPAGNE</h5>
	<p>Qu’ils soient personnels ou professionnel, 
				vos événements méritent d’être exceptionnels. 
				Nous vous accompagnons dans chacune de vos célébrations et vous proposons des offres gourmandes 
				et personnalisées.</p>
</div>

<footer>
	<div><%@include file="includes/footer.jsp"%></div>
</footer>
</body>
</html>