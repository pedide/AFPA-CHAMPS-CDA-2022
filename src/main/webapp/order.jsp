<%@page import="java.text.DecimalFormat"%>
<%@ page import="com.xprodmvc.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.xprodmvc.connection.DbCon"%>
<%@ page import="com.xprodmvc.dao.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);

Users auth = (Users) request.getSession().getAttribute("auth");
List<Order> orders = null;
if (auth != null) {
	request.setAttribute("auth", auth);
	OrderDao orderDao = new OrderDao(DbCon.getConnection());
	orders = orderDao.userOrders(auth.getIdUser());

} else {
	  response.sendRedirect("login.jsp");
}	
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
 List<Cart> cartProduct = null;

if (cart_list != null) {
	ProductsDao pDao = new ProductsDao(DbCon.getConnection());
	cartProduct = pDao.getCartProduct(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	System.out.print(total);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Commandes</title>
<%@include file="includes/head.jsp"%>
<link rel="stylesheet" href="css/home-style2-cart2.css"> 
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
</head>

<body>
	<%@include file="includes/navbar.jsp"%>
	<h1>COMMANDES</h1>
	<h3>Prix total: ${(total>0)?dcf.format(total):0} €</h3>
	<div class="container">
	
		<div class="cart-header my-3">

				<form class="cart-check-out" action="cart-check-out" method="post">				
					
				<script 
				src="https://checkout.stripe.com/checkout.js"
				class="mx-3 stripe-button"
				data-key="pk_test_51KsMM1G7jkpgEBMIW7sYV8FjcYrZmiFt62fHdxh4CztUGVDvJq98TYctvYTK7Dp6dqiwXNslZl344K9kfNkO5ofF00MnrNGVlE"
				data-name="Big Bears E-shop"
				data-description="Checkout with BigBears payment"
				data-image="product-image/bigbears.jpg"
				data-amount=${dcf.format(total*100)}
				data-local="auto"
				data-currency="eur"
				data-billing-adresse="true"
				data-label="Payer"
				></script>
				</form>
		
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Nom</th>
					<th scope="col">Categorie</th>
					<th scope="col">Quantité</th>
					<th scope="col">Prix</th>
					<th scope="col">Annuler</th>
				</tr>
			</thead>
			
			<tbody>
				<%
				if (orders != null) {
					for (Order o : orders) {
				%>
				<tr>
					<td><%=o.getDate()%></td>
					<td><%=o.getName()%></td>
					<td><%=o.getCategory()%></td>
					<td><%=o.getQuantity()%></td>
					<td><%=dcf.format(o.getPrice())%></td>
					<td><a class="btn btn-sm btn-danger"
						href="cancel-order?id=<%=o.getIdOrder()%>">Annuler La Commande</a></td>
				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
	</div>
	<br><br><br><br><br><br><br>
	<%@include file="includes/footer2.jsp"%>
</body>
</html>