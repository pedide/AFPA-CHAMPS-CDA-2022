<%@page errorPage="error.jsp" %>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.pokepok.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.pokepok.dao.*"%>
<%@ page import="com.pokepok.connection.DbCon"%>

<%
DecimalFormat dcf = new DecimalFormat("#.##");
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
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
	//double total = pDao.getTotalCartPrice(cart_list);
}
%>

<!DOCTYPE html>
<html>
<head>
<title>XPROD Panier</title>
<link rel ="stylesheet" href="css/signup-style.css">
<style type="text/css">
/* body{
	font:em Helvetiva;
	background-image: url(background/fondEcranPoke.png)!important;
	background-attachment:fixed;
} 
.table tbody td {
	vertical-align: middle;
}*/

.btn-incre, btn-decre {
	box-shadow: none;
	font-size: 28px;
}
.fa, .fas {
	color: orange;
}
.btn-val {
	background-color: #004040;
	color: white;
	border-color : blue;
}
.btn-val:hover {
	background-color: #167508;
	color: white;
}
[type=submit]{
	background-color: #004040 !important;
	color: white;
}
[type=submit]:hover{
	background-color: #167508 !important;
	color: white;
}
.stripe-button-el span {
  background: #004040 !important;
 /*  background-image:none !important; */
  width:140px !important;
  height : 15px !important;
  margin : 3px !important;
}
.stripe-button-el{
	background: #004040 !important;
  	background-image:none !important;
  	width:150px !important;
  	height : 35px !important;
  	margin-left : 5px !important;
}
.container{
	margin-top:10px;
	padding-bottom:10px;
	background-color:#ffffffc4 !important;
}
.table thead th{
	vertical-align:inherit !important;
}
.table td, .table th{
	vertical-aligne:inherit ! important;
	padding: 10px !important;
}
.form-group{
	margin : inherit !important;
}
</style>
<%@include file="includes/head.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<div class="d-flex py-3">
			<h3>Total : ${(total>0)?dcf.format(total):0}€</h3> <!-- peut etre à zéro -->
			<!-- <a  class = "btn btn-aj " href="cart-check-out">CheckOut</a> -->
			<!-- script qu'on récupére comme le link pour css -->
			<form action = "cart-check-out" method = "post">
			<% if(auth == null) {%>
				<p><button class="mx-3 btn btn-val btn-sm">Valider la commande</button></p>
			<%}else{ %>
			<script
				src="https://checkout.stripe.com/checkout.js" 
				class="stripe-button"
				data-key ="pk_test_51KsMMgBVONHwYaOuUKM7qv0brXZhmDc7g0zXvZ6rv1UU5DtEUFrIfZSjNqrwKWTurvTFkCOZ2miaH9PVU5iRUQIl00kWaIaM60"
				data-name="Sneakers"
				data-description="Checkout with paiement"
				data-image="https://as2.ftcdn.net/v2/jpg/02/39/77/21/1000_F_239772156_jvUq11j6FU97o1iKeGQGpGILxfStONAx.jpg"
				data-amount="${(total>0)?dcf.format(total*100):0}"
				data-local="auto"
				data-currency="eur"
				data-billing-adress="false"
				data-label="CheckOut"
			></script>
		</form>
		<%} %>
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Nom</th>
					<th scope="col">Categorie</th>
					<th scope="col">Prix Unitaire</th>
					<th scope="col">Quantité</th>
					<th scope="col">Sous total</th>
					<th scope="col">Acheter maintenant</th>
					<th scope="col">Annuler</th>
				</tr>
			</thead>
			<tbody>
				<%
				int total = 0;
				if (cart_list != null) {
					for (Cart c : cartProduct) {
				%>
						<%-- <%=c.getId()%>
						<%
						System.out.println("Id");
						
						%> --%>
							<tr>
								<td><%=c.getName()%></td>
								<td><%=c.getCategorie()%></td>
								<td><%=dcf.format(c.getPrixU())%>€</td>
								
								<td>
									<form action="order-now" method="post" class="form-inline">
										<input type="hidden" name="id" value="<%=c.getId()%>" class="form-input">
										<div class="form-group d-flex justify-content-between w-50">
											<input type="text" name="quantity" class="form-control w-50" value="<%=c.getQuantity() %>" readonly> 
											<a class="btn btn-sm btn-decre" style="background-color: #1f97df"; href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"> <!-- récupere l'icone de la page "https://fontawesome.com/v5/icons/plus-square?s=solid" -->
											<i class="fas fa-minus-square"></i></a>
											<a class="btn btn-sm btn-incre" style="background-color: #1f97df"; href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"> <!-- récupere l'icone de la page "https://fontawesome.com/v5/icons/plus-square?s=solid" -->
											<i class="fas fa-plus-square"></i></a>
											
											
										</div>
									
								</td>
								<td><%=dcf.format(c.getPrix())%>€</td>
								<td>
									<button type="submit" class="btn btn-paye btn-sm" style="height: 35px !important";>Payer</button>
			
								</td>
								</form>
								<td><a href="remove-from-cart?id=<%=c.getId()%>" class="btn btn-sm btn-danger">Supprimer</a></td>
							</tr>
							
						<%
							
						
					}
				}
				%>
							
			</tbody>
		</table>
	</div>

	

</body>
<%@include file="includes/footer.jsp"%>
</html>