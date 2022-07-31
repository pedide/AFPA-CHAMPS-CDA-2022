<%@page errorPage="error.jsp" %>
<%@page import="com.pokepok.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pokepok.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<title>Mot de Passe Oublié</title>
<link rel="stylesheet" href="css/signup-style.css">
<style type="text/css">
.btn-valide {
	font-size: 1rem;
	background-color: orange;
	margin-left: 10px;
	color: white;
	border-color: #007bff;
}

.btn-valide:hover {
	background-color: #007bff;
	color: white;
}
.welcome{
	text-align : center;
}
</style>
<%@include file="includes/head.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div id="container">
		<div class="whyforgotPassword">
		<h2 class = "welcome">Bienvenue sur Xprod Shopping</h2>
		<%
		String msg = request.getParameter("msg");
		
		if("valid".equals(msg)){%>
			<h1>Le Mot de Passe a été changé avec succes</h1>
		<%}
		if("invalid".equals(msg)){%>
			<h1>Une erreur s'est produite! Try again!!</h1>
		<%}%>	
		
			
		</div>
		<div class="signup">
			<div class="card w-50 mx-auto my-5">
				<div class="card-header text-center">Réinitialisation du Mot de Passe</div>
				<div class="card-body2">
					<form action="forgot-password" method="post">
						<div class="form-group">
							<label>Adresse email</label> <input type="email"
								class="form-control" name="EMAIL"
								placeholder="Entrer votre email" required> <label>Telephone</label>
							<input type="text" class="form-control" name="mobileNumber"
								placeholder="**********" required>
						</div>
						<div class="form-group">
							<label>Question de sécurité</label> <br> <select
								name="securityQuestion">
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
						<div class="form-group">
							<label>Nouveau Mot de Passe</label> <input type="password"
								class="form-control" name="newPassword"
								placeholder="Entrer votre nouveau mot de passe" required>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-valide" value="valider">Valider</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	
	</div>
</body>
<%@include file="includes/footer.jsp"%>
</html>