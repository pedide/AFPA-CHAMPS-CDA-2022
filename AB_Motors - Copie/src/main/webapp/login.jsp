<%@page import="com.ab_motors.connection.dbCon"%>
<%@page import="com.ab_motors.dao.productsDAO"%>
<%@page import="com.ab_motors.model.cart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ab_motors.model.Users"%>
<% Users auth = (Users)request.getSession().getAttribute("auth");
    
    if(auth!=null){
    	response.sendRedirect("index.jsp");
    }
    productsDAO pd = new productsDAO(dbCon.getConnection());
    ArrayList<cart> cart_list = (ArrayList<cart>)session.getAttribute("cart-list");
    List<cart> cartProduct = null;

    if (cart_list != null) {
        cartProduct=pd.getCardProducts(cart_list);
        request.setAttribute("cart_list", cart_list);

    }	 
    %>
<!DOCTYPE html>
<html>
<head>
<title>login</title>
<%@include file="incloudes/head.jsp"%>
</head>
<body>
	<%@include file="incloudes/navbar.jsp"%>
	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Login</div>
			<div class="card-body">
				<form action="user-login" method="post">
					<div class="form-group">
						<label>Email adress</label><input type="email"
							class="form-control" name="login-mail"
							placeholder="enter your email" required>
					</div>
					<div class="form-group">
						<label>Password</label><input type="password" class="form-control"
							name="login-password" placeholder="*************" required>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Login</button>
					</div>
			</div>
			</form>
			<h3>
				<a href="signup.jsp">SingUp</a>
			</h3>
			<h3>
				<a href="forgotPassword.jsp">Forgot password?</a>
			</h3>
		</div>
	</div>
	<%@include file="incloudes/footer.jsp"%>
</body>
</html>