<%@page import="java.util.*"%>
<%@page import="com.xprodmvc.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	
	
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

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signup.css" /> --%>


<style><%@include file="../css/signup-style.css"%></style>


<head>
<meta charset="UTF-8">

<title>Inscription</title>

</head>


<%@include file="includes/navbar.jsp"%>
<body>

	
	
	
<!-- <video Style="background-video"   preload="auto" autoplay="true" loop="loop" muted="muted" volume="0" width="100%" height="100%"  src="https://ak.picdn.net/shutterstock/videos/1076499071/preview/stock-footage-beautiful-female-customer-using-d-augmented-reality-digital-interface-in-modern-shopping-center.webm" type="video/webm">
</video> -->
<!-- 
<video src="https://ak.picdn.net/shutterstock/videos/1076499071/preview/stock-footage-beautiful-female-customer-using-d-augmented-reality-digital-interface-in-modern-shopping-center.webm" id="video" autoplay loop muted class="video"></video>
 -->


<div class="container-">
			<div class="card-fluid w-50 mx-auto my-5 form-login" >
				<div class="card-header text-center" ><h3>S'inscrire</h3></div>
				<div class="card-body">
					<form action="user-register" method="post">
					
						<div class="form-group">
							<label>Nom</label> <input type="text" 
							class="form-control" name="name"
							placeholder="Enter Name" required>
								 
						</div>
						  
						<div class="form-group">
							<label>Numéro de Téléphone</label> <input type="tel" 
							
							class="form-control" name="mobileNumber"
								placeholder="Enter number phone" required>
								
                        </div>
                        
                        <div class="form-group">
								<label>adresse Email </label> <input type="Email" 
								class="form-control"name="email" 
								placeholder="enter your email" required>
						</div>
						
							<div class="form-group">
								<label>Mot de Passe</label> <input type="password"
									class="form-control" name="logPassword"
									placeholder="**********************" required>
							</div>
							  <div class="form-group">
								<label>question de Securité</label>	<label>Security question</label> 
								<select   name="securityQuestion" >
								 <option value="what was your first car ?">Quel était votre première voiture ?</option>
								 <option value="what is the name of your first pet ?">Quel est le nom de votre premier animal de compagnie ?</option>
								 <option value="what elementary school did you attend ?">Quelle école primaire as-tu fréquentée ?</option>
								 <option value="what is the name of the town where you were born ?">Quel est le nom de la ville où tu es né ?</option>
							<input type="text" class="form-control" name="answer" placeholder="Enter your answer">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary" value="signup">Sign up</button>
							</div>
					</form>
					<h4>
				<a href="login.jsp">Login</a>
			</h4>
				</div>
			</div>

			
		</div>
		<div class="whysign">
		<%
		String msg = request.getParameter("msg");
		if("valid".equals(msg)){%> 
		
			<h1>Successful Registered</h1>
		
		<%} %>
			<% if("invalid".equals(msg)){%>
		
			<h1>some thing went wrong</h1>
		
		<%} %>
		
		
		
			
			<!-- <h1>Some think were wrong ! try again !</h1> -->

		<!-- 	<h2>Xprod Shopping</h2>
			<p>Welcome to xprod shopping.Please register to finish your
				shopping</p> -->
		</div>
	
	
	
	<%@include file="includes/footer.jsp"%>
</body>
</html>