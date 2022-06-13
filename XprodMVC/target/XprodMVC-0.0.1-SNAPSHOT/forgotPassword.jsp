<%@page import="java.util.*"%>
<%@page import="com.xprodmvc.model.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% User auth = (User)request.getSession().getAttribute("auth");
    if ( auth !=null) {
    
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
<!-- <link rel="stylsheet" href="/css/signup-style.css"> -->
<meta charset="UTF-8">
<title>Forgot Password</title>
<%@include file="includes/head.jsp"%>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div id='contenair'>
<!-- <div class="signup"> -->

<div class="card w-50 mx-auto my-5">
				<div class="card-header text-center"><h1>Bags Boutique</h1></div>
				<div class="card-body"><h3>Mot de passe oublié</h3>
					<form action="forgot-password" method="post">
					
					
						  
						<div class="form-group">
							<label>Numéro Téléphone</label> <input type="tel" 
							
							class="form-control" name="mobileNumber"
								placeholder="Enter number phone" required>
								
                        </div>
                        
                        <div class="form-group">
								<label>Adresse Email </label> <input type="Email" 
								class="form-control"name="email" 
								placeholder="enter your email" required>
						</div>
						
						
							  <div class="form-group">
								<label>Security question</label> <select  
								 name="securityQuestion" >
								 <option value="what was your first car ?">Quel était votre première voiture ?</option>
								 <option value="what is the name of your first pet ?">Quel est le nom de votre premier animal de compagnie ?</option>
								 <option value="what elementary school did you attend ?">Quelle école primaire as-tu fréquentée ?</option>
								 <option value="what is the name of the town where you were born ?">Quel est le nom de la ville où tu es né ?</option>
								
							</select>
							<input type="text" class="form-control"
							name="answer" placeholder="Enter your answer">
							</div>
							
								<div class="form-group">
								<label>Nouveau mot de passe</label> <input type="password"
									class="form-control" name="newPassword"
									placeholder="Enter new password to set" required>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary" value="signup">Sign up</button>
							</div>
					</form>
					<h3><a href="login.jsp">Connection</a></h3>
					<h2><a href="signup.jsp">Inscription</a></h2>
				</div>
			
			
				</div>
			</div>

			
		</div>
		
<!-- <h2><a href="login.jsp">Login</a></h2>
</div><h2><a href="signup.jsp">signup</a></h2> -->
<div class="whyforgotPassword">
<%
String msg= request.getParameter("msg");
		if("valid".equals(msg)){%> 
		
		<h1>Le mot de passe a été changé avec succès !</h1>
	
	<%} %>
		<% if("invalid".equals(msg)){%>
	
		<h1>Quelque chose a mal tourné ! Réessayer !</h1>
	
	<%}

%>
<!-- <h1>Password changed successfully !</h1>
<h1>Some thing went wrong! Try again !</h1>
    <h1>Xprod shopping !</h1>
    <p>Welcome to Xprod</p> -->
</div>
</div>
<%@include file="includes/footer.jsp"%>
</body>
</html>