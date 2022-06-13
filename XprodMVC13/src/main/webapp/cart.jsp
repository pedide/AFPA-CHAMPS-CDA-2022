<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.nio.charset.StandardCharsets"%>
<%@ page import="java.util.*"%>
<%@ page import="com.xprodmvc.connection.DbCon"%>
<%@ page import="com.xprodmvc.model.*"%>
<%@ page import="com.xprodmvc.dao.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");

if (auth != null) {
	//response.sendRedirect("index.jsp");
	request.setAttribute("auth", auth);
	String email = request.getParameter("email");
}
Cart cart = new Cart();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if (cart_list != null) {
	
	ProductsDao pDao = new ProductsDao(DbCon.getConnection());//se connecte a la bd
	cartProduct = pDao.getCartProducts(cart_list);
	int product_id = cart.getId();
	
	Cart test = pDao.addToCartTotal(product_id, "email");//on a crée une Cart qui est test
	
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);//on recuper notre liste de produits
}
%>
<html>


<title>Diablement Bon Cart</title>
<style type="text/css">
.table tbody td {
	vertical-align: middle;
}

.btn-incre, bnt-decre {
	box-shadow: none;
	font-size: 25px;
}
</style>
<%@include file="includes/head.jsp"%>

<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<div class="d-flex py-3">
			<h3 style="color:#B39188 ;margin-right:10%">Prix Total : ${(total>0)?dcf.format(total):0}€</h3>
<!-- 			<a class="mx-3 btn btn-primary" href="cart-check-out">Valider la commande</a> -->
		
  		<form action="cart-check-out" method="post"> 
<!--  		<form action="addressPaymentForOrder.jsp" method="post">  -->
		<% 
		if(auth == null){%>
			<p><button class="btn btn-outline-light" style="background-color:#B39188 ; margin-left: 10%">Confirmer votre panier</button></p>
			
		<%}else{%>
<!-- 			<p><button class="btn btn-outline-light" style="background:#B39188; margin-left: 10%">Info livraison et paiement</button></p> -->
			
<!-- 							data-image="https://i.pinimg.com/originals/6b/36/9a/6b369a65fcad2279f358b0bca56b3cda.png" -->
				
				
		<script
				src="https://checkout.stripe.com/checkout.js"
				class="mx-3 stripe-button"
				data-key="pk_test_51KsMNVLKYS2bssV2pv0ZUc8PvK4ziQKAAnSPwoh05b5uAaOslrAeO2AipLfOfzn1TALWgWeCZW1TbRlX9I409bdB00CJ0QpuNZ"
				data-name="Diablement Bon E-shopping"
				data-description="Checkout et Diablement Bon paiement"
				data-image="images/toqueIcon.png"
				data-amount="${(total>0)?dcf.format(total*100):0}"
				data-local = "auto"
				data-currency="eur"
				data-billing-adress="false"
				data-label="Payer maintenant">
		</script>
		
	
		</form>
		<%} %>
		</div>
		
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Nom</th>
					<th scope="col">Catégorie</th>
					<th scope="col">Prix</th>
					<th scope="col">Quantité</th>
<!-- 					<th scope="col">Acheter maintenant</th> -->
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
							<input type="hidden" name="id" value="<%=c.getId()%>"
								class="form-input">
							<div class="form-group d-flex justify-content-between w-50">
								<a class="btn btn-sm btn-incre" style="color:#B39188 ; vertical-align: middle;" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"> 
									<i class="fas fa-plus-square"></i>
								</a> 
								<input type="text" name="quantity" class="form-control w-50"
									value="<%=c.getQuantity()%>"readonly>
							<div class="form-group d-flex justify-content-between w-50">
								<a class="btn btn-sm btn-decre" style="color:#B39188" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"> 
									<i class="fas fa-minus-square"></i>
								</a>
							</div>
							<!-- <td>
								<button type="submit" class="btn btn-outline-light" style="background:#B39188";>Payer</button>
							</td> -->
						</form>
					</td>
					<td><a class="btn btn-info" href="remove-from-cart?id=<%=c.getId()%>" >Supprimer</a></td>
				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
	</div>

</body>
<footer>
	<div><%@include file="includes/footer.jsp"%></div>
</footer>
</html>