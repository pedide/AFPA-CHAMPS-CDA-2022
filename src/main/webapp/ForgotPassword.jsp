<%@page import="com.projetafpa.connection.DbCon"%>
<%@page import="com.projetafpa.model.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
<meta name="viewport" content="">
<link rel="stylesheet" href="css/signup-style.css">

<title>RATP Mot de passe oublié</title>
<link rel="stylesheet" href="">
</head>
<body>
	<header>
<img class="logo" src="" alt="logo">
</header>
				<form action="forgot-password" method="post">
					<div class="form-group">
						<label>Nom</label> <input type="text" class="form-control" name="username"
							placeholder="Entrer votre nom" required>
					</div>
					<div class="form-group">
						<label>Numero de tél</label> <input type="text" class="form-control" name="mobileNumber"
							placeholder="Entrer votre numero de téléphone" required>
			</div>
			<div class="form-group">
						<label>Email</label> <input type="email" class="form-control" name="email"
							placeholder="Entrer votre adresse email" required></div>
							
			<div class="form-group">
						<label>Question de sécurité</label> <select name="securityQuestion">
						<option value="Quelle est la marque de ta premiere voiture ?">Quelle est la marque de ta premiere voiture ?</option> 
						<option value="Quel est le nom de votre animal de compagnie ?">Quel est le nom de votre animal de compagnie ?</option>
						<option value="Dans quelle ecole primaire es tu allé ?">Dans quelle ecole primaire es tu allé ?</option>
						<option value="Dans quelle ville es tu née ?">Dans quelle ville es tu née ?</option>
			</select>
			
		
			<input type ="text" class="form-control"
				name="answer" placeholder="Enter your answer" required>			
			</div>				
			<div class="form-group">
						<label>Nouveau mot de passe</label><input type="password" class="form-control" name="newPassword"
							placeholder="Enter the new password to set" required>
			</div>
						
			<div class="text-center">
			<button type="submit" class="btn btn-primary"value ="signup">Enregistrer nouveau mot de passe</button>
			</div>			
		    
		    <div class="text-center">
			<button type="button" class=""> <a href="Login.jsp">Se Connecter</a></button>
			</div>
			
			<div class="text-center">
			<button type="submit" class="btn btn-primary"value ="signup">S'enregistrer</button>
			</div>
			</form>				
		   
		    
<div class="whyforgotPassword">

<%
String msg=request.getParameter("msg");
if ("valid".equals(msg)){%>

<h1>Password changed successfully</h1>
<%} %>

<%if ("invalid".equals(msg)){%>
<h1>something went wrong! Try again!</h1>
<%}%>

</div>
</body>
</html>