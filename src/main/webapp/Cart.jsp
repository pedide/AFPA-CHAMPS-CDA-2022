<%@page import="com.stripe.model.checkout.Session.TotalDetails"%>
 <%@page import="java.text.DecimalFormat"%>
<%@page import="com.projetafpa.model.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.projetafpa.dao.*"%>
<%@page import="com.projetafpa.connection.DbCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
DecimalFormat dcf = new DecimalFormat("#.##");// pour les deux chiffres apres la virgules
request.setAttribute("dcf", dcf); 
User auth = (User) request.getSession().getAttribute("auth");

if (auth != null) {
	request.setAttribute("auth", auth);
	String email = request.getParameter("email");
} 

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if (cart_list != null) {
	
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	
	//int product_id = cartProduct.getId();
	//cart toto =pDao.addProduct(product_id, "email");
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart page </title>
<%@include file="includes/head.jsp"%>

<style type="text/css">
.table tbody td {
	vertical-align: middle;
}

.btn-incre, btn-decre {
	box-shadow: none;
	front-size: 25px;
}
</style>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<div class="d-flex py-3">
		
			<h3>Price : ${(total>0)?dcf.format(total):0}€</h3>
<!-- 		<a class="mx-3 btn btn-primary" href="cart-check-out">Checkout</a>
			<a class="mx-3 btn btn-primary" href="pay-stripe">Checkout</a>
			Stripe -->
			<form action ="cart-check-out" method="post">
 			<script 
			src="https://checkout.stripe.com/checkout.js"
			class="mx-3 stripe-button"
			data-key="pk_test_51KsMRKJtAklxDm4Bv0MYbaUPvnRjPaGdcVJs4IJmXjyoivN6szIMVJXTiBuqwCdTU71lvxWa5BIOM6Q8DzJHOeXt009HsWe9KP"
			data-name="RATP Connect Shop"
			data-description="checkout with RATP Connect paiement"
			data-image="product-image/logo-RATP.png"
			data-amount="${(total>0)?dcf.format(total*100):0}"
			data-currency="eur"
			data-biling_adress="true"
			data-label="Checkout & pay"
			></script>
			</form>

		</div>

		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
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
							<input type="hidden" name="id"value="<%=c.getId()%>"
								class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn btn-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i
									class="fas fa-plus-square"></i></a> 
									<input type="text"
									name="quantity" class="form-control" value="<%=c.getQuantity()%>"readonly>
									
								<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>">
								
								<i class="fas fa-minus-square"></i></a>
							</div>
							<button type="submit" class="btn btn-primary btn-sm">Buy</button>


						</form>

					</td>
					<td><a href="remove-from-cart?id=<%=c.getId()%>" class="btn btn-sm btn-danger">Remove</a></td>
				</tr>



				<%
				}
				}
				%>
			
</tbody>
</table>
</div>
</body>
</html>