<%@page errorPage="error.jsp" %>
<%@page import="com.pokepok.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.pokepok.model.User" %>
    
<%
	User auth = (User)request.getSession().getAttribute("auth");
	if(auth != null){
		response.sendRedirect("index.jsp");
	}
	
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	List<Cart> cartProduct = null;

	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
%>
    
<!DOCTYPE html>
<html>
<head>
	<title>POKEPOK login</title>
	<link rel ="stylesheet" href="css/signup-style.css">
	<%@include file = "includes/head.jsp" %>
	<style>

	</style>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class = "background" style = "background-image : url(background/fondEcranPoke.png);">
		<div class ="headBG" >
				<a href="index.jsp"><img src= "background/logo.png"/></a>
			</div>
	<div class = "container">
		<div class="whysignLogin">
		<%
		String msg = request.getParameter("msg");
		if("notexist".equals(msg)){
		%>
			<h1>Utilisateur ou Mot de Passe incorrect</h1>
		<%}
		if("invalid".equals(msg)){
		%>
			<h1>Une erreur s'est produite! Try Again!</h1>
		<%} %>
		
		<!-- <p style="color:#c8bf37;">Bienvenue sur Pokepok shopping</p> -->
	</div>
		<div class = "card w-50 mx-auto my-5">
			<div class = "card-header text-center">
				Utilisateur Login
			</div>
			<div class="card-body">
				<form action="user-login" method="post">
					<div class = "form-group">
						<label>
							Adresse email
						</label>
						<input  type = "email" class = "form-control" name = "login-mail" placeholder = "Entrer votre email" required>
						
					</div>
					<div class = "form-group">
						<label>
							Mot de Passe
						</label>
						<input  type = "password" class = "form-control" name = "login-password" placeholder = "Entrer votre mot de passe" required>
						</div>
						<h6><a href= "forgotPassword.jsp" >Mot de passe oublié?</h6>
					
					<div class = "text-center">
						<button type = "submit" class = "btn btn-connect">
							Se connecter
						</button>
						<a href="signup.jsp" class="btn btn-sign">S'inscrire</a>
					</div>

				</form>
					
			</div>
		</div>
	</div>

</div>	
</body>
<footer>
		<%@include file = "includes/footer.jsp" %>
	</footer>
</html>