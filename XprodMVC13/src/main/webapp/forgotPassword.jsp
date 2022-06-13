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
<meta charset="UTF-8">
<title>ForgotPassword</title>
</head>
<body>
<%@include file="includes/navbar.jsp"%>

<div id="container" class="container d-flex justify-content-center my-5" >
    <div class="row my-2 mx-2 main" style="background:#FFFAF0">
        <!--left-column-->
        	<div class="col-md-4 col-12 mycol">
            <!--image-->
            <img src="product-image/macarons.jpg">
        	</div>
        <!--right-column-->
        <div class="col-md-8 col-12 xcol">
            <h2 class="title pt-5 pb-3">Bienvenue à Diablement Bon.</h2>
            <h4 class="title pt-5 pb-3">Merci de compléter les champs afin de changer votre mot de passe.</h4>
					<form action="forgot-password" method="post" class="myform">
						<div class="row rone">
						    <div class="form-group col-md-6 fone py-3">
                        		<input type="email" class="form-control lm" name="login-mail"
									placeholder="Entrer votre adresse email" required>
                			</div>
                			<div class="form-group col-md-6 ftwo py-3">
                        		<input type="text" class="form-control jk" name="mobileNumber"
									placeholder="Entrer votre numéro de tél" required>
                    		</div>
           
                		</div>
					<div class="row rtwo">
						<div class="form-group col-md-12 fthree py-3">
							<select name="securityQuestion">
								<option value="Quelle est la marque de votre première voiture ?">
									Quelle est la marque de votre première voiture ?</option>
									
								<option value="Quelle est votre couleur favorite ?">
									Quelle est votre couleur favorite ?</option>
									
								<option value="Dans quelle ville êtes-vous né ?">
									Dans quelle ville êtes-vous né ?</option>
									
								<option value="Quel est le nom de votre 1er animal de compagnie?">
									Quel est le nom de votre 1er animal de compagnie?</option>
							
							</select> 
							<input type="text" class="form-control" name="answer"
								placeholder="Choisir votre question et répondez." required>
						</div>
						<div class="form-group col-md-6 ffour py-3">
							<input type="password" class="form-control" name="new-password"
								placeholder="Entrer un nouveau mot de passe" required>
						</div>
					</div>
					<div class="row rthree">
                               <div class="form-group col-md-6 fseven py-3">
                        <button type="submit" class="btn btn-success btn-block btn-info" value="signup">S'enregistrer</button></div>
                	</div>
				</form>
                    <div class="form-group col-md-6 feight py-3">
                        <p class="text-muted">J'ai déjà un compte, <br><a href="login.jsp">je me connecte.</a></p>
                    </div>	

			</div>
		</div>
		<div class="whyforgotPassword">
			<% String msg = request.getParameter("msg");
				if ("valid".equals(msg)) {
			%>
			<h1>Le mot de passe a été changé avec succès!</h1>
			<%}%>
			<% if ("invalid".equals(msg)) {%>
			
			<h1>Il y a une erreur, merci de recommencer!</h1>
			<%}%>

		</div>
	</div>
	
</body>
<footer>
	<div><%@include file="includes/footer.jsp"%></div>
</footer>
</html>