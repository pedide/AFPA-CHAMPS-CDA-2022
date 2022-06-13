<%@page import="java.text.DecimalFormat"%>
<%@ page import="com.xprodmvc.model.Users"%>
<%@ page import="com.xprodmvc.model.Cart"%>
<%@ page import="com.xprodmvc.dao.ProductsDao"%>
<%@ page import="com.xprodmvc.connection.DbCon"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
Users auth = (Users) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if (cart_list != null) {

	ProductsDao pDao = new ProductsDao(DbCon.getConnection());
	cartProduct = pDao.getCartProduct(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);

}
%>
<!DOCTYPE html>
<html>
<head>
<title>Big Bears</title>
   <link rel="stylesheet" href="css/home-style2.css">  
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">

<%@include file="includes/head.jsp"%>
</head>

<body>
	<%@include file="includes/navbar.jsp"%>
	

	<div class="container">
	<h1>PANIER</h1>
		<div class="d-flex py-3">
			<h3>Prix total: ${(total>0)?dcf.format(total):0} €</h3>
			<!-- <a class="mx-3 btn btn-primary" href="cart-check-out">Valider la
				Commande</a> -->

				<% if (auth == null) {
						%> <a class="mx-3 btn btn-primary" href="login.jsp">Valider la
									Commande</a>
				<%}else{
				%>
					<form action="cart-check-out" method="post">
					
					
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
				data-label="Checkout & Pay"
				></script>
				</form>
				<%} %> 
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Nom</th>
					<th scope="col">Categorie</th>
					<th scope="col">Prix</th>
					<th scope="col">Quantité</th>
					<th scope="col">Acheter maintenant</th>
					<th scope="col">Annuler</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
				%>
				<tr>
					<td><%=c.getName()%></td>
					<td><%=c.getCategory()%></td>
					<td><%=dcf.format(c.getPrice())%>€</td>
					<td>
						<form action="order-now" method="post" class="form-inline">
							<input type="hidden" name="id" value="<%=c.getIdProd()%>"
								class="form-input">
							<div class="form-group d-flex justify-content-between w-50">
								<a class="btn btn-sm btn-decre"
									href="quantity-inc-dec?action=dec&id=<%=c.getIdProd()%>"><i
									class="fas fa-minus-square"></i></a> <input type="text"
									name="quantity" class="form-control w-50"
									value="<%=c.getQuantite()%>" readonly> <a
									class="btn btn-sm btn-incre"
									href="quantity-inc-dec?action=inc&id=<%=c.getIdProd()%>"><i
									class="fas fa-plus-square"></i></a>
							</div>
					</td>
					
					<td><button type="submit" class="btn btn-primary btn-on">Acheter</button></td>
					</form>
					<td><a href="remove-from-cart?action=delete&id=<%=c.getIdProd()%>"
						class="btn btn-on btn-danger">Enlever</a></td>

				</tr>
				<%
				}
				}
				%>
				
			</tbody>
		</table>
	</div>

	<%@include file="includes/footer2.jsp"%>
</body>
</html>