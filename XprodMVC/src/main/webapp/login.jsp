
<%@page import="com.xprodmvc.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.util.*" %>
	<%@page import="com.xprodmvc.model.*"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<% User auth = (User)request.getSession().getAttribute("auth");
    if ( auth !=null) {
        System.out.println("fffffffffffffffffffffffffffffffffffffkmlkmkmkmkmlkmlklmk");    
    response.sendRedirect("index.jsp");

    }
    
    ArrayList<Cart> cart_list =(ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    
    if(cart_list !=null){

    	request.setAttribute("cart_list", cart_list);
    }%>
     <!DOCTYPE html>
<html>
<head>

<style><%@include file="../css/signup-style.css"%></style>
<%-- <%@include file="includes/head.jsp"%> --%>

<!-- <link rel="stylsheet" href="css/signup-style.css"> -->
</head>

<title>BAGS BOUTIQUE</title>

<body>
<!-- 
<video src="https://ak.picdn.net/shutterstock/videos/1076499071/preview/stock-footage-beautiful-female-customer-using-d-augmented-reality-digital-interface-in-modern-shopping-center.webm" id="video" autoplay loop muted class="video"></video>
 -->
<!-- <body style="background-image:url('https://archzine.fr/wp-content/uploads/2016/03/grand-sac-%C3%A0-main-extravagant-mode-de-femme-moderne.jpg? center w=0&h=0" width="100" height="100")"></body> -->
<%@include file="includes/navbar.jsp" %>
	<div class="container">
		<div class="card-fluid  w-50 mx-auto my-5 form-login" >
			<div class="card-header  text-center color:white" ><h1>Bags Boutique</h1></div>
			<div class="card-body "><h3>Connection</h3>
				<form action="user-login" method="post">
					<div class="form-group">
						<label>Adresse Email </label> <input type="Email"
							class="form-control" name="log-mail"
							placeholder="enter your email" required>
					</div>
					
					<div class="form-group">
						<label>Mot de Passe</label> <input type="password"
							class="form-control" name="log-password"
							placeholder="**********************" required>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">login</button>
					</div>
				</form>
				
			</div>
				<h4><a href="signup.jsp">Inscription</a></h4>
				<h4><a href="forgotPassword.jsp">Mot de passe oublié?</a></h4>
				
		</div>
	</div>
	<div class="whysingLogin">
	<%
	String msg = request.getParameter("msg");
	if("notexist".equals(msg)){%>
	       <h1>Nom d'utilisateur ou mot de passe incorrect</h1>
	
	 <% }%>
	 <%
	 if("invalid".equals(msg)){
		 
		 %>
	
	<h1>Quelque chose s'est mal passé ! Réessayer !</h1>
	<% }
	 %>
	
	<!-- <h1>Xprod shopping</h1>
	<p>Welcome to Xprod shopping</p> -->
	</div>
	<%@include file="includes/footer.jsp"%>
</body>
</html>