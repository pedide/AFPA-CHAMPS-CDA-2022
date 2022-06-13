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

<head>
<meta charset="ISO-UTF-8">
<%@include file="../includes/navbar.jsp"%>

<link rel="stylesheet" href="../signup-style.css "> 

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
							<p>Vous avez déjà un compte chez nous ?</p><a href="login.jsp"> connecter vous à votre espace personnel  →</a>
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