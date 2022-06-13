<%@ page import="com.xprodmvc.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
Users auth = (Users) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
	response.sendRedirect("index.jsp");
}
%>
<!DOCTYPE html>
<html>
<head> 


</head>
<title>Connexion</title>
<%@include file="includes/head.jsp"%>
<link rel="stylesheet" href="css/home-style2-signup.css"> 
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">Se connecter</div>
			<div class="card-body">
				<form action="user-login" method="post">
					<div class="form-group">
						<label>Adresse Email</label> <input  type="email"
							class="form-control" name="email"
							placeholder="Entrez votre Email" required>
					</div>
					<div class="form-group">
						<label>Mot de passe</label> <input type="password"
							class="form-control" name="mot_de_passe"
							placeholder="*************" required>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Se connecter</button>
					</div>
					<h2><a href="forgotPassword.jsp">Oubli de mot de passe ? </a></h2>
					<h2>
							<a href="signup.jsp">S'enregistrer</a>
						</h2>
				</form>
			</div>
		</div>
	</div>
	</body>
	<footer>
	<%@include file="includes/footer2.jsp"%>
</footer>
</html>