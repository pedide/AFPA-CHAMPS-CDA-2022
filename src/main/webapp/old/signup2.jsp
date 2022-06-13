<%@page import="com.gaiaconsulting.model.Cart"%>
<%@page import="com.gaiaconsulting.model.User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
User auth = (User) request.getSession().getAttribute("auth");

if (auth != null) {
	response.sendRedirect("index.jsp");
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if (cart_list != null) {

	//total = pDao.getTotalCartProducts(cart_list);

	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
 <style>
// Remy function
@function remy($value) {
  @return ($value / 16px) * 1rem;
}

body {
  font: 100% / 1.414 "Open Sans", "Roboto", arial, sans-serif;
  background: #e9e9e9;
}
a,
[type="submit"] {transition: all .25s ease-in;}
.signup__container {
  position: absolute;
  top: 50%;
  right: 0;
  left: 0;
  margin-right: auto;
  margin-left: auto;
  transform: translateY(-50%);
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
  width: remy(800px);
  height: remy(480px);
  border-radius: remy(3px);
  box-shadow: 0px remy(3px) remy(7px) rgba(0,0,0,.25);
}
.signup__overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0,0,0,.76);
}
.container__child {
  width: 50%;
  height: 100%;
  color: #fff;
}
.signup__thumbnail {
  position: relative;
  padding: 2rem;
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  background: url(http://ultraimg.com/images/spectre-login.jpg);
  background-repeat: no-repeat;
  background-position: top center;
  background-size: cover;
}
.thumbnail__logo,
.thumbnail__content,
.thumbnail__links {
  position: relative;
  z-index: 2;  
}
.thumbnail__logo {align-self: flex-start;}
.logo__shape {fill: #fff;}
.logo__text {
  display: inline-block;
  font-size: .8rem;
  font-weight: 700;
  vertical-align: bottom;
}
.thumbnail__content {align-self: center;}
h1,
h2 {
  font-weight: 300;
  color: rgba(255,255,255,1);
}
.heading--primary {font-size: 1.999rem;}
.heading--secondary {font-size: 1.414rem;}
.thumbnail__links {
  align-self: flex-end;
  width: 100%;
}
.thumbnail__links a {
  font-size: 1rem;
  color: #fff;
  &:focus,
  &:hover {color: rgba(255,255,255,.5);}
}
.signup__form {
  padding: 2.5rem;
  background: #fafafa;
}
label {
  font-size: .85rem;
  text-transform: uppercase;
  color: #ccc;
}
.form-control {
  background-color: transparent;
  border-top: 0;
  border-right: 0;
  border-left: 0;
  border-radius: 0;
  &:focus {border-color: #111;}
}
[type="text"] {color: #111;}
[type="password"] {color: #111;}
.btn--form {
  padding: .5rem 2.5rem;
  font-size: .95rem;
  font-weight: 600;
  text-transform: uppercase;
  color: #fff;
  background: #111;
  border-radius: remy(35px);
  &:focus,
  &:hover {background: lighten(#111, 13%);}
}
.signup__link {
  font-size: .8rem;
  font-weight: 600;
  text-decoration: underline;
  color: #999;
  &:focus,
  &:hover {color: darken(#999, 13%);}
}
</style> 
<head>
<meta charset="ISO-UTF-8">
<%@include file="../includes/navbar.jsp"%>

<!-- <link rel="stylesheet" href="css/signup-style.css "> -->

<title>Sign up</title>

</head>
<body>

	<div id="container ">
		<h4 align=center >Please register to finish your
						shopping !</h4></center>
		<div class="container">
		
				
			<div class="signup">
				<div class="card mx-auto my-5">
					
					<div class="card-header text-center">Register</div>
					<div class="card-body">
						<form action="register-user" method="post">
							<div class="form-group">
								<label>Name</label><input type="text" name="name"
									class="form-control" placeholder="Enter name" required>
								<label>Email adress</label> <input type="email"
									class="form-control" name="email"
									placeholder="Enter  your email" required>
							</div>
							<div class="form-group">
								<label>Password</label> <input type="password"
									class="form-control" name="password" placeholder="*********"
									required>
							</div>
							<div class="form-group">
								<label>Phone number</label> <input type="text"
									class="form-control" name="mobileNumber"
									placeholder="Enter the phone number" required>
							</div>
							<div class="form-group">
								<label>Security question</label> <select name="securityQuestion">
									<option value="What was your first car ?">What was
										your first car ?</option>
									<option value="What is the name of your first pet ?">What
										is the name of your first pet ?</option>
									<option
										value="What is the name of the town where you were born ?">What
										is the name of the town where you were born ?</option>
									<option
										value="What is the name of your elementary school did you attend">What
										is the name of your elementary school did you attend</option>
								</select> <input type="text" class="form-control" name="answer"
									placeholder="Enter your answer" required>
							</div>
							<div class="signup">
							<button type="submit" class="btn btn-success">Sign
									up</button>
									
							</div>
						</form>
						<h4>
							<p>Already have an account?</p><a href="login.jsp"> Sign in →</a>
						</h4>
							<div class="whysignLogin">
					<%
					String msg = request.getParameter("msg"); // msg valide systématiquement !!! pas normal 
					if ("valid".equals(msg)) {
					%>
					<h1>SuccessFull Registered</h1>
					<%
					}
					%>
					<%
					if ("wrong".equals(msg)) {
					%>
					<h1>Some things went wrong ! Try again</h1>
					<%
					}
					%>

				</div>
						
					</div>

				</div>
			

			</div>

		</div>

	</div>
<footer>
	<%@include file="includes/footer.jsp"%>
</footer>
</body>

</html>