<%@page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.pokepok.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.pokepok.model.User"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
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
<meta charset="UTF-8">
<title>Enregistrement</title>
<link rel="stylesheet" href="css/signup-style.css">
<%@include file="includes/head.jsp"%>
<style type="text/css">
body{
	font:em Helvetiva;
	background-image: url(background/fondEcranPoke.png)!important;
	background-attachment:fixed;
}
.signup{
	background-color:#ffffffc4;

</style>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div id="container">
		<div class="whysign w-100 text-center">
			<p>
				Bienvenue sur Xprod shopping.<br> Veuillez vous enregistrer
				afin de pouvoir passer commande ou finaliser votre achat
			</p>
			<%
			String msg = request.getParameter("msg");
			if ("valid".equals(msg)) {
			%>
			<h1>Inscription réussie</h1>

			<%
			}
			%>
			<%
			if ("invalid".equals(msg)) {
			%>
			<h1>Ouups, une erreur s'est produite ! Try again</h1>
			<%
			}
			%>


			
		</div>
		<div class="signup">
			<div class="card">
				<div class="card-header text-center">Inscription</div>
				<form action="signupAction.jsp" method="post">
				<div class="card-body">
						<div class="form-group">
							<label>Nom</label> <input type=text "  class="form-control"
								name="USERNAME" placeholder="Entrer votre nom" required>
							<label>Adresse email</label> <input type="email"
								class="form-control" name="EMAIL"
								placeholder="Entrer votre email" required> <label>Telephone</label>
							<input type="text" class="form-control" name="mobileNumber"
								placeholder="Entrer vote téléphone" required>
						</div>
						<div class="form-group">
							<label>Mot de Passe</label> <input type="password"
								class="form-control" name="PASSWORD"
								placeholder="Entrer votre mot de passe" required>
						</div>
						<div class="form-group">
							<label>Question de sécurité</label> <br> <select
								name="securityQuestion" style="width:100%; text-align:center;">
								<option value="Quelle était votre première voiture?">Quelle
									était votre première voiture?</option>
								<option
									value="Quel était le nom de votre premier animal de compagnie?">Quelle
									était le nom de votre premier animal de compagnie?</option>
								<option value="Quel est le nom de votre collège?">Quel
									est le nom de votre collège?</option>
								<option value="Quel est le nom de ville où vous êtes né(e)?">Quel
									est le nom de ville où vous êtes né(e)?</option>
							</select> <input type="text" class="form-control my-2" name="answer"
								placeholder="Entrer votre réponse" required>
						</div>
				</div>
				<div class="card-body">
					<div class="form-group">
							<label>Adresse</label> 
							<input type=text "  class="form-control"name="adress" placeholder="Entrer votre adresse" required>
							<label>Ville</label> 
							<input type="text" class="form-control" name="city" placeholder="Entrer votre ville" required>
							<label>Code Postal</label> 
							<input type="text" class="form-control" name="cp"  placeholder="Entrer votre code postal" required>
							<label>Département</label> 
							<input type="text" class="form-control" name="state"  placeholder="Entrer votre département" required> 
							<label>Pays</label> 
							<input type="text" class="form-control" name="country" placeholder="Entrer votre pays" required>
					</div>
				</div>
				
				<div class="text-center">
							<button type="submit" class="btn btn-insc" value="signup">S'inscrire</button>
				</div>
				</form>
			</div>
		</div>

	</div>

</body>	
<%@include file="includes/footer.jsp"%>
</html>