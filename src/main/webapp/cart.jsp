<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.xprodmvc.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.xprodmvc.dao.*"%>
<%@ page import="com.xprodmvc.connection.DbCon"%>

<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);

User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
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
<style type="text/css">
.table tbody td {
	vertical-align: middle;
}

.btn-incre, btn-decre {
	box-shadow: none;
	font-size: 25px;
}
/* .form-inline .form-control {
  width: 50px;
 }
 .form-inline {
  width: 50px;
 } */
.fa, .fas {
	color: orange;
}

.btn-paye {
	background-color: orange;
	color: white;
}

.btn-paye:hover {
	background-color: #fd7e04;
	color: white;
}

</style>
<%@include file="includes/head.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<div class="d-flex py-3">
			<h3>Total : ${(total>0)?dcf.format(total):0}€</h3> <!-- peut etre à zéro -->
			<a class="mx-3 btn btn-paye" href="cart-check-out">Check out</a>
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
											<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"> <!-- récupere l'icone de la page "https://fontawesome.com/v5/icons/plus-square?s=solid" -->
											<i class="fas fa-minus-square"></i></a>
											<a class="btn btn-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"> <!-- récupere l'icone de la page "https://fontawesome.com/v5/icons/plus-square?s=solid" -->
											<i class="fas fa-plus-square"></i></a>
											
											
										</div>
									
								</td>
								<td><%=dcf.format(c.getPrix())%>€</td>
								<td>
									<button type="submit" class="btn btn-paye btn-sm">Payer</button>
			
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

	<%@include file="includes/footer.jsp"%>

</body>

</html>