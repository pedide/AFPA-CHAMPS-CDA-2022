<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.xprodmvc.connection.DbCon"%>
<%@ page import="com.xprodmvc.model.*"%>
<%@ page import="java.util.*"%>
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
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;

if (cart_list != null) {
	
	ProductsDao pDao = new ProductsDao(DbCon.getConnection());//se connecte a la bd
	cartProduct = pDao.getCartProducts(cart_list);
	
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);//on recuper notre liste de produits
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>XPROD Cart</title>
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
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<div class="d-flex py-3">
			<h3>Prix Total : ${(total>0)?dcf.format(total):0}€</h3>
			<a class="mx-3 btn btn-primary" href="cart-check-out">Check out</a>
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Nom</th>
					<th scope="col">Catégorie</th>
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
					<td><%=dcf.format(c.getPrice())%></td>
					<td>
						<form action="order-now" method="post" class="form-inline">
							<input type="hidden" name="id" value="<%=c.getId()%>"
								class="form-input">
							<div class="form-group d-flex justify-content-between w-50">
								<a class="btn btn-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"> 
									<i class="fas fa-plus-square"></i>
								</a> 
								<input type="text" name="quantity" class="form-control w-50"
									value="<%=c.getQuantity()%>"readonly>
								<div class="form-group d-flex justify-content-between">
									<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"> 
									<i class="fas fa-minus-square"></i>
									</a>
								</div>
								<td>
									<button type="submit" class="btn btn-primary btn-sm">Payer</button>
								</td>
						</form>
					</td>
					<td><a class="btn btn-sm btn-danger" href="remove-from-cart?id=<%=c.getId()%>" >Supprimer</a></td>
				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
	</div>
<footer>
	<div><%@include file="includes/footer.jsp"%></div>
</footer>
</body>
</html>