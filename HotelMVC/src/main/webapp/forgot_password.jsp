<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="includes/navbar.jsp"%>

<title>Forgot Password</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.0/TweenMax.min.js" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/loginRegisterForgotPassword-style.css">
</head>
<body style="margin-top: 150px">

	<div class="container" style="size: 100%">
			<div id="signup">
	
		<div class="card w-50 mx-auto my-50">

			<div style="display: flex; justify-content: center;">
				<div style="background-color: rgba(0, 0, 0, 0.50); text-align: center; padding-left: 40px; padding-right: 40px">
					<div style="text-align: center;">

						<h2 class="text-germania-white">Hotel Paris Luxe *****</h2>
						<h2 class="text-germania-white">Créer un nouveau mot de passe</h2>
					</div>

					<div class="card-body pdt-30">
						<form action="forgot-password" method="post">

							<div>

								<div class="form-group col-left">
									<label class="text-white child-left">Email</label> <input
										type="email" class="form-control" name="login-mail"
										placeholder="Enter your Email" required>
								</div>
								<div class="form-group col-right">
									<label class="text-white child-left"
										style="display: inline-block;">Phone Number</label> <input
										type="number" class="form-control" name="mobileNumber"
										placeholder="Enter your mobile number" required>
								</div>
							</div>

							<div>
								<div class="form-group col-left">
									<label class="text-white child-left">Nouveau mot de passe</label> <input
										type="password" class="form-control" name="newPassword"
										placeholder="Enter new password" required>
								</div>
								<div class="form-group col-right">
									<label class="text-white child-left">Confirmez le nouveau mot de passe</label> <input
										type="password" class="form-control" name="confirm-password"
										placeholder="Confirm new password" required>
								</div>
							</div>
							
							<div>
								<div class="form-group col-left">
									<label class="text-white child-left">Security question</label> 
									<select class="form-control" name="securityQuestion">
										<option value="What was your first car">What was your first car ?</option>
										<option value="What was the name of your first pet">What was the name of your first pet ?</option>
										<option value="What was the name of your first teacher">What was the name of your first teacher ?</option>
										<option value="What is the name of the town you were born">What is the name of the town you were born ?</option>
									</select>
								</div>
								<div class="form-group col-right">
									<label class="text-white child-left">Answer</label> 
									<input type="text" class="form-control" name="answer" placeholder="Enter your answer" required>
								</div>
							</div>


							<div class="text-center pdt-20">
								<button type="submit" class="btn button" style="width: 150px;">Change password</button>
							</div>
						</form>
						<div style="margin-top: 40px">
							<h5 class="text-grey">Remember your password? <a class="text-link-gold" href="loginProjet.jsp"> Login</a>
							</h5>
	
						</div>



						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<div class="whysignLogin">
		<%
		String msg = request.getParameter("msg");
		if ("notexist".equals(msg)) {
		%>
		<h1>Incorrect Username or password</h1>
		<%
		}
		%>
		<%
		if ("invalid".equals(msg)) {
		%>
		<h1>Something went wrong try again</h1>
		<%
		}
		%>

	</div>

</body>
</html>