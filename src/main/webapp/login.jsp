<%@page import="com.xprodmvc.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.xprodmvc.model.User" %>
    
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
	<title>XPROD login</title>
	<%@include file = "includes/head.jsp" %>
	<style>
		.btn-primary {
		  	
		  	background-color: orange;
		}
	</style>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
	<div class = "container">
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
					<div class = "text-center">
						<button type = "submit" class = "btn btn-primary">
							Se connecter
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<footer>
		<%@include file = "includes/footer.jsp" %>
	</footer>
</body>

</html>