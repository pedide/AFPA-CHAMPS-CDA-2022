<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@include file="includes/navbar.jsp"%>		
		<title>Hotel Register</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.0/TweenMax.min.js" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/loginRegisterForgotPassword-style.css">
				
		<script type="text/javascript">
			var check = function() {
				if (document.getElementById('login-password').value ==
				    document.getElementById('confirm-password').value) {
				    document.getElementById('message').style.color = '#7cfc00';
				    document.getElementById('message').innerHTML = 'Matching';
				    document.getElementById('confirm-password').style.border = '2px solid #7cfc00';
			
				} else {
				    document.getElementById('message').style.color = '#ff0000';
				    document.getElementById('message').innerHTML = ' Not matching';
				    document.getElementById('confirm-password').style.border = '2px solid #ff0000';
				  }
				}	
		</script>
	</head>
	<body>
		<div class="container">
			<div id="signup">
				<div class="card w-50 mx-auto my-50">
					<div style="display: flex; justify-content: center;">
						<div style="background-color: rgba(0, 0, 0, 0.50); text-align: center; padding-left: 40px; padding-right: 40px">
							<div style="text-align: center;">	
								<h1 class="title-germania-gold">Hotel Georges V *****</h1>
								<h2 class="text-germania-white">Créer un compte</h2>
							</div>	
							<div class="card-body pdt-30">
								<form action="user-register" method="post">
									<div>
										<div class="form-group col-left">
										<label class="text-white child-left">First Name</label> <input
											type="text" class="form-control" name="firstname"
											placeholder="Enter your first name" required>
									</div>
									<div class="form-group col-right"
										style="width: 50%; display: inline-block; float: right; padding-left: 5px">
										<label class="text-white child-left">Last Name</label> <input
											type="text" class="form-control" name="lastName"
											placeholder="Enter your last name" required>
									</div>
								</div>
	
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
										<label class="text-white child-left">Mot de passe</label> <input
											id="login-password" type="password" class="form-control" name="login-password" onkeyup='check();'
											placeholder="********" required>
									</div>
									<div class="form-group col-right">
										<label class="text-white child-left">Confirmez le mot de passe 	
										</label> 
										<span style="display: inline;float: right" id='message'></span>
										<input 
											name="confirm-password" type="password" class="form-control" id="confirm-password" name="confirm-password" onkeyup='check();'
											placeholder="********" required>							
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
									<button type="submit" class="btn button" style="width: 100px;">Créer</button>
								</div>
							</form>
							<div style="margin-top: 40px">
								<h5 class="text-grey">
									Already have an account? <a class="text-link-gold" href="login.jsp"> Login</a>
								</h5>
								<h5 class="text-grey">
									Forgot your password ? <a class="text-link-gold"
										href="forgotpassword.jsp">Create a new password</a>
								</h5>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>