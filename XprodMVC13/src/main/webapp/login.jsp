<%@ page import="com.xprodmvc.model.User"%>
<%@ page import="com.xprodmvc.model.Cart"%>
<%@ page import="java.util.*"%>

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
<link rel="stylesheet" href="css/login-style.css"> 

<title>Diablement Bon Login</title>

<body>
<%@include file="includes/navbar.jsp"%>

<div class="register-photo">
    <div class="form-container">
        <div class="image-holder"></div>
        <form action="user-login" method="post">
            <h2 class="text-center"><strong>Nous sommes heureux de vous revoir !</strong></h2>
            <div class="form-group">
            	<label>Adresse email :</label><input class="form-control" type="email" name="login-mail" placeholder="Email"></div>
<!--        <div class="form-group"><input class="form-control" type="Username" name="Username" placeholder="Username"></div> -->
            <div class="form-group">
            	<label>Mot de passe :</label><input class="form-control" type="password" name="login-password" placeholder=" ***************">
            </div>
            	<div class="form-group"><button class="btn btn-success btn-block btn-info" type="submit">Connecter</button></div>
            <hr>
            <div>
				<h6>Je n'ai pas de compte, <a href="signup.jsp">je m'inscris.</a></h6>
				<h6><a href="forgotPassword.jsp">Mot de passe oublié ?</a></h6>
			</div>
		</form>
    </div>
</div>
<div class="whysignLogin">
		<%
		String msg = request.getParameter("msg");
		if ("notexist".equals(msg)) {//si le msg est not exist
		%>
		<h1>Nom d'utilisateur ou le mot de passe sont incorrects.</h1>
		<%
		}
		%>
		<%
		if ("invalid".equals(msg)) {
		%>
		<h1>Il y a une erreur. Merci d'essayer à nouveau.</h1>
		<%
		}
		%>

	</div>

<footer>
	<%@include file="includes/footer.jsp"%>
</footer>
</body>
</html>