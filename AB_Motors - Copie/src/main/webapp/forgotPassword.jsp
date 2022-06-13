<%@page import="java.util.List"%>
<%@page import="com.ab_motors.model.cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ab_motors.connection.dbCon"%>
<%@page import="com.ab_motors.dao.productsDAO"%>
<%@page import="com.ab_motors.model.products"%>
<%@page import="com.ab_motors.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Users auth = (Users) request.getSession().getAttribute("auth");

if (auth != null) {
	response.sendRedirect("index.jsp");
}

ArrayList<cart> cart_list = (ArrayList<cart>) session.getAttribute("cart-list");
List<cart> cartProduct = null;

if (cart_list != null) {
	
	request.setAttribute("cart_list", cart_list);

}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="incloudes/head.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="incloudes/navbar.jsp"%>
	<div id='container'>
		<div class="signup">
			<div class="card mx-auto my-5">
				<div class="card-header text-center">User Login</div>
				<div class="card-body">
					<form action="forgot-password" method="post">
						<div class="form-group">
							<label>Email adress</label><input type="email"
								class="form-control" name="email" placeholder="Enter your email"
								required>
						</div>
						<div class="form-group">
							<label>Phone number</label><input type="text"
								class="form-control" name="mobileNumber"
								placeholder="Enter your phone number" required>
						</div>

						<div class="form-group">
							<label>Security question</label> <select name="securityQuestion">

								<option value="What was your first car?">What was your
									first car?</option>
								<option value="What is the name of your first pet?">What
									is the name of your first pet?</option>
								<option value="What elementary school did you attend?">What
									elementary school did you attend?</option>
								<option
									value="What is the name of the town where you were born?">What
									is the name of the town where you were born?</option>
							</select> <input type="text" class="form-control" name="answer"
								placeholder="Enter your answer" required>
						</div>
						<div class="form-group">
							<label>Password</label><input type="password"
								class="form-control" name="newpassword"
								placeholder="Enter new password to set" required>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-primary" value="signup">Sign
								up</button>
						</div>
					</form>
				</div>
			</div>
			<h2>
				<a href="">Login</a>
			</h2>
		</div>
		<div class="whyforgotPassword">
			<%String msg = request.getParameter("msg");
		  if("valid".equals(msg)){%>
			<h1>Password changed successfully !</h1>
			<%}
		  if("invalid".equals("msg")){%>
			<h1>Some thing went wrong ! Try again</h1>
			<%}%>


			<h2>Xprod</h2>
			<p>Welcome to xprod shopping. Please register to finish your
				shopping.</p>
		</div>


		<%@include file="incloudes/footer.jsp"%>
</body>
</html>