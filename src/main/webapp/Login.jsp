<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="com.projetafpa.model.Cart" %>	
<%@page import ="com.projetafpa.model.User" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
    
<%
User auth = (User)request.getSession().getAttribute("auth");

if (auth !=null){
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
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet" href="css/login.css">
<title>Login Page</title>
</head>
<body>

    <section class="showcase">
      <header>       
        <h2 class="logo">Ratp</h2>
        <div class="toggle"></div>
      </header>
      <div class="bloc">
	<video autoplay="autoplay" muted="" loop="infinite" src="video/escalator.mp4"></video>
 
      <div class="overlay"></div>
      <div class="text">
        <h2>RATP Connect </h2>
        <h3>Explorer Paris et l'île de France</h3>
        <p>Bienvenue sur votre espace de connexion, vous pourrez
		consulter vos achats, plannings, etc....</p>
		
		<form action="user-login" method="post">
		
			<div class="form-group">
						<label>Identifiant</label>
						<input type="email"
							class="form-control" name="email"
							placeholder="Entrer votre identifiant" required>
							</div>
					<div class="form-group">
						<label>Mot de passe</label> 
						<input type="password" class="form-control" name="password"
							placeholder="****************"required>
							</div>
							
							<div class="text-center">
							<button type="submit" class="btn btn-primary btn-lg">Se connecter</button>
							</div>
							
        <!-- <a href="">Se connecter</a> -->
        <a href="ForgotPassword.jsp">Mot de passe oublié</a>
        <a href="signup.jsp">S'enregistrer</a>
      </div>
      <ul class="social">
        <li><a href="https://fr-fr.facebook.com/RATPofficiel"><img src="https://i.ibb.co/x7P24fL/facebook.png"></a></li>
        <li><a href="https://twitter.com/clientsratp"><img src="https://i.ibb.co/Wnxq2Nq/twitter.png"></a></li>
        <li><a href="https://www.instagram.com/ratp/?hl=fr"><img src="https://i.ibb.co/ySwtH4B/instagram.png"></a></li>
      </ul>
    </section>
    <div class="menu">
      <ul>
        <li><a href="#">Menu</a></li>
        <li><a href="#">Nouveautés</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </div>
    <script>
    const menuToggle = document.querySelector('.toggle');
    const showcase = document.querySelector('.showcase');

    menuToggle.addEventListener('click', () => {
      menuToggle.classList.toggle('active');
      showcase.classList.toggle('active');
    })
    </script>
    	<%
	String msg = request.getParameter("msg");
	if("notexist".equals(msg)){%>
			<h1>Incorrect Username or Password</h1>
		
		
	<%} %>
	<% 
	if ("invalid".equals(msg)){%>
	<h1>Something went wrong ! Try Again !</h1>
	
	<%}%>

</body>
</html>