<%@ page import="com.xprodmvc.model.User"%>
<%@ page import="java.util.*"%>
<%@ page import="com.xprodmvc.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	response.sendRedirect("index.jsp");
}
//je rajoute ma liste de produits
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;//je cree un panier de produits

if (cart_list != null) {
	//le nb produits s'affiche à coté btn de login
	request.setAttribute("cart_list", cart_list);//on recuper notre liste de produits
}
%>
<html>
<head>
	<meta charset="UTF-8">
	<title>SignUp</title>
	<link rel="stylesheet" href="css/signup-style.css">
	<%@include file="includes/head.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<h1>Xprod</h1>
		<p>Bienvenue à Xprod. Merci de vous enregistrer pour finir vos
			achats.</p>
<!-- 		<div class="signup"> -->
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">
				<h3>Inscription</h3>
				<p>Créer votre compte et accédez à nos services.</p>
			</div>
			<div class="card-body">
				<form action="user-register" method="post">
					<div class="form-group">
						<label>Nom :</label> <input type="text"
							class="form-control" name="name"
							placeholder="Entrer votre nom" required>
					</div>
					<div class="form-group">
						<label>Adresse email :</label> <input type="email"
							class="form-control" name="login-mail"
							placeholder="Entrer votre adresse email" required>
					</div>
					<div class="form-group">
						<label>Numéro de téléphone :</label> <input type="text"
							class="form-control" name="mobileNumber"
							placeholder="Entrer votre numéro de téléphone" required>
					</div>
					<div class="form-group">
						<label>Mot de passe :</label> <input type="password"
							class="form-control" name="login-password"
							placeholder="***************" required>
					</div>
					<div class="form-group">
						<label>Questions de sécuritées :</label>
						<select name="securityQuestion">
							<option value="Quelle est la marque de votre première voiture ?">Quelle est la marque de votre première voiture ?</option>
							<option value="Quelle est votre couleur favorite ?">Quelle est votre couleur favorite ?</option>
							<option value="Dans quelle ville êtes-vous né ?">Dans quelle ville êtes-vous né ?</option>
							<option value="Quel est le nom de votre 1er animal de compagnie?">Quel est le nom de votre 1er animal de compagnie?</option>
						</select>
						<input type="text" class="form-control" name="answer"
								placeholder="Entrer votre réponse" required>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary" value="signup">Je m'inscris</button>
					</div>
				</form>
				<div>J'ai déjà un compte, <a href="login.jsp">je me connecte.</a></div>
				</div>
			</div>
<!-- 		</div> -->
		<div class="whysign">
				<%
				String msg = request.getParameter("msg");
				if ("valid".equals(msg)) {//si mon message est valide
				%>
				<h1>L'enregistrement est fini avec succèes</h1>
				<%
				}
				%>
				<%
				if ("invalid".equals(msg)) {//si mon message est invalide
				%>
				<h1>Il y a des erreurs. Merci de recommencer !</h1>
				<%
				}
				%>
		</div>
	</div>
<footer>
	<div><%@include file="includes/footer.jsp"%></div>
</footer>
</body>
</html>