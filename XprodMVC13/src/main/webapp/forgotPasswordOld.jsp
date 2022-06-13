<%@page import="com.xprodmvc.model.User"%>
<%@page import="com.xprodmvc.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
<%@include file="includes/head.jsp"%>

<!-- <link rel="stylesheet" href="css/signup-style.css"> -->

<title>ForgotPassword</title>
</head>
<body>
<%@include file="includes/navbar.jsp"%>

	<div id="container">
		<div class="signup">
			<div class="card w-50 mx-auto my-5">
				<div class="card-header text-center">User Login</div>
				<div class="card-body">
					<form action="forgot-password" method="post">
						<div class="form-group">
							<label>Adresse email:</label> <input type="email"
								class="form-control" name="login-mail"
								placeholder="Entrez votre adresse email" required>
						</div>
						<div class="form-group">
							<label>Numéro de téléphone:</label> <input type="text"
								class="form-control" name="mobileNumber"
								placeholder="Entrez votre numéro de téléphone" required>
						</div>

						<div class="form-group">
							<label>Questions de sécurité:</label> 
							<select name="securityQuestion">
								<option value="Quel était votre 1ère voiture ?">Quelle était votre 1ère voiture ?</option>
								<option value="Quel était le nom de votre animal de companie ?">Quel était le nom de votre animal de companie ?</option>
								<option value="Quel était votre école primaire ?">Quel était votre école primaire ?</option>
								<option value="Dans quelle ville êtes vous né ?">Dans quelle ville êtes vous né ?</option>
							</select> <input type="text" class="form-control" name="answer"
								placeholder="Entrez votre réponse" required>
						</div>
						<div class="form-group">
							<label>Nouveau mot de passe :</label> <input type="password"
								class="form-control" name="new-password"
								placeholder="Entrez votre nouveau mot de passe" required>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-primary" value="signup">S'enregistrer</button>
						</div>
					</form>
				</div>
				<h4>
					<a href="login.jsp">Login</a>
				</h4>

				<h4>
					<a href="signup.jsp">Entregistrer</a>
				</h4>
			</div>
		</div>
		<div class="whyforgotPassword">
			<%
			String msg = request.getParameter("msg");
			if ("valid".equals(msg)) {
			%>
			<h1>Le mot de passe a été changé avec succès!</h1>
			<%
			}
			%>
			<%
			if ("invalid".equals(msg)) {
			%>
			<h1>Il y a une erreur, merci de recommencer!</h1>
			<%
			}
			%>

			<h1>Diablement Bon shopping</h1>
			<p>Bienvenue dans Diablement Bon</p>
		</div>
	</div>

</body>
<footer>
	<div><%@include file="includes/footer.jsp"%></div>
</footer>
</html>