<%@page import="com.xprodmvc.connection.DbCon"%>
<%@page import="java.util.*"%>
<%@page import="com.xprodmvc.dao.ProductsDao"%>
<%@page import="com.xprodmvc.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Users auth = (Users) request.getSession().getAttribute("auth");
 
if (auth != null) {
	request.setAttribute("auth", auth);
}

ProductsDao pd = new ProductsDao(DbCon.getConnection());
List<Product> produits = pd.getAllProducts();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Enregistrement</title>
</head>
<meta charset="UTF-8">
<%@include file="includes/head.jsp"%>
<link rel="stylesheet" href="css/home-style2-signup.css"> 
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">



<body>
	<%@include file="includes/navbar.jsp"%>
	<div id="container">
		<div class="sign-up">
			<div class="card w-50 mx-auto my-5">
				<div class="card-header text-center">ENREGISTREZ-VOUS</div>
				<div class="card-body">
					<form action="signupAction.jsp" method="post">
						<div class="form-group">
							<label>Nom</label><input type="text" class="form-control"
								name="nom" placeholder="Entrez votre Nom" required>
						</div>
						<div class="form-group">
							<label>Adresse Email</label> <input type="email"
								class="form-control" name="email"
								placeholder="Entrez votre Email" required>
						</div>
						<div class="form-group">
							<label>Numero de téléphone</label> <input type="text"
								class="form-control" name="numerotel"
								placeholder="Entrez votre Numero de téléphone" required>
						</div>

						<div class="form-group">
							<label>Mot de passe</label> <input type="password"
								class="form-control" name="mot_de_passe"
								placeholder="*************" required>
						</div>
						<div class="form-group">
							<label>Question secrete</label> <select name="questionsecrete">
								<option value="Quelle a été votre premiere voiture">Quelle
									a été votre premiere voiture</option>
								<option value="Votre lieu de naissance">Votre lieu de
									naissance</option>
								<option value="Premier jeu vidéo">Premier jeu vidéo</option>
								<option value="Premier lieu de vacances">Premier lieu
									de vacances</option>
							</select> <input type="text" class="form-control"
								name="reponsesecrete" placeholder="Entrez votre réponse"
								required>
						</div>
						<div class="form-group">
							<label>Situation</label> <select name="situation">
								<option value="Client">Client</option>
								<option value="Visiteur">Visiteur</option>
							</select> 
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-primary" value="signup">S'enregistrer
							</button>
						</div>
					</form>
				
					<h2><a href="forgotPassword.jsp">Oubli de mot de passe?</a></h2>
					<h2>
				<a href="login.jsp">Se connecter</a>
			</h2>
			
				</div>
			</div>
			
		</div>
		<div class="why-sign">
			<%
			String msg = request.getParameter("msg");

			if ("valid".equals(msg)) {
			%><h2>Enregistrement reussi</h2>
			<%
			}
			if ("invalid".equals(msg)) {
			%><h2>Quelque chose s'est mal passé! Réessayer!</h2>
			<%
			}
			%>

		</div>
	</div>
	<%@include file="includes/footer2.jsp"%>
</body>

</html>