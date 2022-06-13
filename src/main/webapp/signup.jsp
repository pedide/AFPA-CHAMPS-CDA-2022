<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="com.projetafpa.model.Cart" %>	
<%@page import ="com.projetafpa.model.User" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>    

<%    
User auth = (User)request.getSession().getAttribute("auth");

%>    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/signup-style.css">
 <title>S'enregistrer</title>
<%@include file="includes/head.jsp"%>
</head>
<body>
<!-- <div id="container">
<div class="signUp">
<div class="card mx-auto my-5"> -->
			<div class="card-header text-center">S'enregistrer</div>
			<div class="card-body">
				<form action="signupAction.jsp" method="post">
					<div class="form-group">
						<label>Name</label> <input type="text" class="form-control" name="username"
							placeholder="Enter name" required>
					</div>
					<div class="form-group">
						<label>Phone number</label> <input type="text" class="form-control" name="mobileNumber"
							placeholder="Enter phone number" required>
			</div>
			<div class="form-group">
						<label>Email</label> <input type="email" class="form-control" name="email"
							placeholder="Enter your email adress" required>
			</div>
			<div class="form-group">
						<label>Password</label><input type="password" class="form-control" name="password"
							placeholder="****************" required>
							
			</div>
			<div class="form-group">
						<label>Security question</label> <select name="securityQuestion">
						<option value="Quelle est la marque de ta premiere voiture ?">Quelle est la marque de ta premiere voiture ?</option> 
						<option value="Quel est le nom de votre animal de compagnie ?">Quel est le nom de votre animal de compagnie ?</option>
						<option value="Dans quelle ecole primaire es tu allé ?">Dans quelle ecole primaire es tu allé ?</option>
						<option value="Dans quelle ville es tu née ?">Dans quelle ville es tu née ?</option>
			</select>
			<input type ="text" class="form-control"
				name="answer" placeholder="Enter your answer" required>			
			</div>				
			<div class="text-center">
			<button type="submit" class="btn btn-primary"value ="signup">Sign Up</button>
			</div>	
						
		    </form>
		    <div class="text-center">
		    <a href="Login.jsp"> <button type="submit" class="btn btn-primary"value ="signup">Login</button></a>
			</div>
<div class="whysign">
<%
String msg = request.getParameter("msg");
if("valid".equals(msg)){%>
<h1>Successfull registered </h1>

	<% } %>
	
<% if("invalid".equals(msg)){%>
<h1> Something went wrong ! Try Again ! </h1>

<% } %>

<h6></h6>
<p></p>
</div>
</body>
</html>