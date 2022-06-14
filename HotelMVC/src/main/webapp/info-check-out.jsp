<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hotelmvc.model.*"%>
<%@page import="com.hotelmvc.dao.*"%>
<%@page import="com.hotelmvc.connection.DbCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
User auth = (User) request.getSession().getAttribute("auth");
int uid = auth.getIduser();
System.out.println("please"+ uid);



String roomId = request.getParameter("id");

String qty = "1";
System.out.println("L'ID de la room : " + roomId );

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
} 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Check Out</title>
<%@include file="includes/navbar.jsp"%> 


</head>
<body style="margin-top: 8em;">
	<div style="text-align: center">
		<h2>Informations Facturation</h2>
		<p>Bienvenue <%=auth.getUsername()%> please register your contact info </p>
	</div>

	<div id="container" style="max-width: 50em; margin: auto; border: 1px solid black; padding: 2em">
		<div id="checkout">
			<div class="card w-50 mx-auto my-50">
				<div class="card-header text-center">User Register Delivery Address</div>
				<div class="card-body">
					<form action="reservation-now?quantity=<%=qty%>&id=<%=roomId%>" method="post">
						<div class="form-group">
							<label>Nom</label> 
							<input type="text" class="form-control" name="lastname"  value ="" placeholder="Enter name" required>
						</div>
						<div class="form-group">
							<label>Prénom</label> 
							<input type="text" class="form-control" name="firstname" value ="" placeholder="Enter name" required>
						</div>
						<div class="form-group">
							<label>Adresse email</label> 
							<input type="text" class="form-control" name="email" value ="<%=auth.getUserEmail()%>" placeholder="Enter your mobile number" required>
						</div>

						<div class="form-group">
							<label>Numéro de téléphone</label> 
							<input type="text" class="form-control" name="mobileNumber"  value ="" placeholder="Enter your mobile number" required>
						</div>
						<div class="form-group">
							<label>Adresse</label> 
							<input type="text" class="form-control" name="address" value ="" placeholder="ex: 12 rue du Lac" required>
						</div>
						<div class="form-group">
							<label>Code postal</label> 
							<input type="text" class="form-control" name="cp" value ="" placeholder="ex: 77600" required>
						</div>
						<div class="form-group">
							<label>Ville</label> 
							<input type="text" class="form-control" name="city" value ="" placeholder="ex: Paris" required>
						</div>
						<div class="form-group">
							<label>Region</label> 
							<input type="text" class="form-control" name="state" value ="" placeholder="ex: Ile de France" >
						</div>
						<div class="form-group">
							<label>Pays</label> 
							<input type="text" class="form-control" name="country" value ="" placeholder="ex: France" required>
						</div>

						<div class="text-center">
							<button type="submit" class="btn btn-primary">Valider l'adresse de facturation</button>
						</div>

					</form>
				</div>
			</div>
			<%
			String msg = request.getParameter("msg");
			if ("valid".equals(msg)) {
			%>
			<h1>Some thing went wrong</h1>
			<%
			}
			%>
			<%
			if ("invalid".equals(msg)) {
			%>
			<h1>Some thing went wrong</h1>
			<%
			}
			%>
		</div>

	</div>
</body>
<footer>
</footer>
</html>