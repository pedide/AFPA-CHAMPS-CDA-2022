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
<link rel="stylesheet" href="css/signup-style.css">
<title>SignUp</title>
<%@include file="includes/head.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div id="container">
		<h2>Xprod</h2>
		<p>Bienvenue à Xprod. Merci de vous enregistrer pour finir vos
			achats.
		<div class="signup">
			<div class="card w-50 mx-auto my-5">
				<div class="card-header text-center">User Login</div>
				<div class="card-body">
					<form action="user-register" method="post">
						<div class="form-group">
							<label>Name:</label> <input type="text" name="name"
								class="form-control" placeholder="Entez votre nom" required>
						</div>
						<div class="form-group">
							<label>Adresse email:</label> <input type="email"
								class="form-control" name="login-mail"
								placeholder="Entrez votre adresse email" required>
						</div>
						<div class="form-group">
							<label>Numéro de téléphone:</label> <input type="text"
								class="form-control" name="mobileNumber"
								placeholder="Entrez votre numéro de téléphone" required>

							<!-- 								<input type="tel"  -->
							<!--                             pattern="[0-9]{2} [0-9]{2} [0-9]{2} [0-9]{2} [0-9]{2}" -->
							<!--                             class="form-control" name="phoneNumber" -->
							<!--                                 placeholder="Entez votre numéro de téléphone" required> -->
							<!--                                 <small>Format: 01-23-46-78-56</small> -->
						</div>
						<div class="form-group">
							<label>Mot de passe :</label> <input type="password"
								class="form-control" name="login-password"
								placeholder="***************" required>
						</div>
						<div class="form-group">
							<label>Questions de sécurité:</label> <select
								name="securityQuestion">
								<option value="Quel a été votre 1ère voiture ?">Quel a
									été votre 1ère voiture ?</option>
								<option value="Quel était le nom de votre animal de companie ?">Quel
									était le nom de votre animal de companie ?</option>
								<option value="Quel était votre école primaire ?">Quel
									était votre école primaire ?</option>
								<option value="Dans quel ville êtes vous né ?">Dans
									quel ville êtes vous né ?</option>
							</select> <input type="text" class="form-control" name="answer"
								placeholder="Entrer votre réponse" required>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-primary" value="signup">S'enregistrer</button>
						</div>
					</form>
				</div>

				<h4>
					<a href="login.jsp">Login</a>
				</h4>
			</div>
		</div>
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