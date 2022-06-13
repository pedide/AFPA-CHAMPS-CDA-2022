<%@page import="com.xprodmvc.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.xprodmvc.dao.ProductsDao"%>
<%@page import="com.xprodmvc.connection.DbCon"%>
<%@page import="java.util.List"%>
<%@page import="com.xprodmvc.model.Product"%>
<%@page import="com.xprodmvc.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Users auth = (Users) request.getSession().getAttribute("auth");

if (auth != null) { 
	request.setAttribute("auth", auth);
	response.sendRedirect("login.jsp");
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
<title>BigBears/OubliMotDePasse</title>
<%@include file="includes/head.jsp"%>
<link rel="stylesheet" href="css/home-style2-forgotpassword.css"> 
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<meta charset="UTF-8">


</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div id='container'>
		<div class="signup">
			<div class="card w-50 mx-auto my-5">
				<div class="card-header text-center">Oubli de mot de passe</div>
				<div class="card-body">
					<form action="forgot-password" method="post">
						<div class="form-group ">
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
							<label>New Password</label> <input type="password"
								class="form-control" name="newmot_de_passe"
								placeholder="Enter new password to set" required>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-primary" value="signup">Changer son mot de passe
							</button>
						</div>
						<h2>
							<a href="signup.jsp">S'enregistrer</a>
						</h2>
						<h2>
							<a href="login.jsp">Se connecter</a>
						</h2>
					</form>
				</div>
			</div>

		</div>

	</div>
	<div class="whyforgotpassword">
		<%
		String msg = request.getParameter("msg");
		if ("valid".equals(msg)) {
		%><h1>Mot de passe changé</h1>
		<%
		}
		%>
		<%
		if ("invalid".equals(msg)) {
		%>
		
		<h1>Quelque chose s'est mal passé</h1>
		<%
		}
		%>	
	</div>
	<%@include file="includes/footer2.jsp"%>
</body>
</html>