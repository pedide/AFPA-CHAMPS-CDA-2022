<%@page import="java.util.ArrayList"%>
<%@page import="com.gaiaconsulting.model.User"%>
<%@page import="com.gaiaconsulting.model.Cart"%>
<%@page import="java.util.List"%>
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

	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="">
<meta charset="UTF-8">
<title>ForgotPassword</title>
</head>
<body>
	<div id='container'>
		<div class="signup">
			<div class="card mx-auto my-5">
				<div class="card-header text-center">Register</div>
				<div class="card-body">
					<form action="forgot-password" method="post">
						<div class="form-group">
							<label>Email adress</label> <input type="email"
								class="form-control" name="email"
								placeholder="Enter  your email" required>
						</div>

						<div class="form-group">
							<label>Phone number</label> <input type="text"
								class="form-control" name="mobileNumber"
								placeholder="Enter the phone number" required>
						</div>
						<div class="form-group">
							<label>Security question</label> <select name="securityQuestion">
								<option value="What was your first car ?">What was your
									first car ?</option>
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
						<div class="form-group">
							<label>New Password</label> <input type="password"
								class="form-control" name="password"
								placeholder="Enter new password to set" required>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-success" value="signup">Sign
								up</button>
						</div>
					</form>
					<h4>
						<a href="login.jsp">Login</a>
					</h4>
				</div>
			</div>
			<h2>
				<a href="">Login</a>
			</h2>
		</div><h2><a href="signup.jsp">Sign up</a></h2>
		<div class="whyforgotPassword">
		<%String msg=request.getParameter("msg");
		if("done".equals(msg)){
		%>
			<h1>Password changed successfully</h1>
			<% }%>
			<%if ("invalid".equals(msg)){%>
			<h1>Some thing went wrong ! Try again !</h1>
			<%} %>
			<h1>Xprod shopping</h1>
			<p>Welcome to Xprod</p>
		</div>
	</div>
</body>
</html>