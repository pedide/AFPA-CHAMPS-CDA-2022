<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="includes/navbar.jsp"%>
		<title>Hotel Login</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.0/TweenMax.min.js" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/loginRegisterForgotPassword-style.css">
	</head>
	<body>

		<div class="container">
			<div class="card w-50 mx-auto my-50 container-css-1">
				<div class="container-css-2">
					<div class="container-title">						
						<h2 class="text-germania-white">Hotel Paris Luxe *****</h2>
						<h2 class="text-germania-white">SE CONNECTER</h2>
					</div>
					<div class="card-body pdt-30">
						<form action="user-login" method="post">				
							<div class="form-group">
								<label class="text-white child-left">Email</label> 
								<input type="email" class="form-control" name="login-mail" placeholder="Enter your Email" required>
							</div>
							<div class="form-group pdt-20">
								<label class="text-white child-left">Mot de passe</label> 
								<input type="password" class="form-control" name="login-password" placeholder="********" required>
							</div>
							<div class="text-center pdt-20">
								<button type="submit" class="btn button">Se connecter</button>
							</div>
						</form>
						<div class="container-footer">
							<h5 class="text-grey">
								Don't have an account? <a class="text-link-gold" href="register.jsp">  Register</a>
							</h5>
							<h5 class="text-grey">
								Forgot your password ? <a class="text-link-gold" href="forgot_password.jsp">Create a new password</a>
							</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div  style="text-align: center; width:70em; background: black; margin: auto; padding: 0.5em;  margin-top: 4em;">
		<%
		String msg = request.getParameter("msg");
		if ("notexist".equals(msg)) {
		%>
		<h5>Incorrect username or password</h5>
		<%
		}
		%>
		<%
		if ("invalid".equals(msg)) {
		%>
		<h5>Something went wrong try again</h5>
		<%
		}
		%>
										<%
		String msg2 = request.getParameter("msg");
		if ("ErrorPlsLogin".equals(msg2)) {
		%>
		<h3 style="color: red">Pour accéder a ce service, vous devez vous connecter ou créer un compte.</h3>
		<%
		}
		%>
		
	</div>	
	</body>
</html>