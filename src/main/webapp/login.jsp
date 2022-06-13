
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.gaiaconsulting.model.Cart"%>
<%@page import="com.gaiaconsulting.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	User auth = (User) request.getSession().getAttribute("auth");
	
	if(auth !=null){
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
<title>XPROD login</title>
	<%@include file="includes/navbar.jsp"%>
</head>
<body>

	<div class="container">

		<div class="container">
			<div class="card w-50 mx-auto my-5">
				<div class="card-header text-center">User login</div>
				<div class="card-body">
					<form action="user-login" method="post">
						<div class="form-group">
							<label>Email adress</label> 
							<input type="email"	class="form-control" name="email"
								placeholder="Enter  your email">
						</div>
						<div class="form-group">
							<label>Password</label> 
							<input type="password" class="form-control" name="password"
								placeholder="*********" required>
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-primary">login</button>
						</div>
						
					</form>
						<h4><a href="signup.jsp">Sign up</a></h4>
						<h4><a href="forgotPassword.jsp">Forgot password</a></h4>
				</div>
			</div>
		</div>
</div>
<div class="whysignLogin">
<%String msg = request.getParameter("msg");
if("notexist".equals(msg)){%>
	<h1>Incorrect Username or password</h1>
<%}%>
<%if("invalid".equals(msg)){%>
	<h1>Some thing went wrong try again</h1>
<%}%>


</div>
<div>
			
</div>

	
</body>
	<footer><%@include file="includes/footer.jsp"%>
		</footer>
</html>