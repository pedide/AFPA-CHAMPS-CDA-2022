<%@ page import="com.xprodmvc.model.User" %>
<%@ page import ="com.xprodmvc.model.*"%>
<%@ page import ="com.xprodmvc.model.Order"%>
<%@ page import="com.xprodmvc.connection.DbCon"%>
<%@ page import="com.xprodmvc.dao.OrderDao" %>
<%@ page import ="java.util.*"%>
<%@ page import ="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	
	User auth = (User)request.getSession().getAttribute("auth"); 
		
	List<Order> orders = null;
	
	if(auth != null){
			request.setAttribute("person", auth);//setattribue va stocker 1 attribue ds notre requete
			OrderDao orderDao = new OrderDao(DbCon.getConnection());
			orders = orderDao.userOrders(auth.getId());
	}else{
		response.sendRedirect("login.jsp");
		
	}
	//je rajoute ma liste de produits
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	//List<Cart> cartProduct = null;//je cree un panier de produits

	if (cart_list != null) {
		//le nb produits s'affiche à coté btn de panier
		request.setAttribute("cart_list", cart_list);//on recuper notre liste de produits
	}%>
	

	
<html>


	<title>Diablement Bon Order</title>
	<%@include file="includes/head.jsp" %>

<body>
	<%@include file="includes/navbar.jsp"%>
	
	<div class="container">
		<div class="cart-header my-3">Historique de vos commandes</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Nom</th>
					<th scope="col">Catégorie</th>
					<th scope="col">Quantité</th>
					<th scope="col">Prix</th>
<!-- 					<th scope="col">Annuler</th> -->
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
<!-- 					<td><a class="btn btn-sm btn-danger" -->
<%-- 					<td><a class="btn btn-info" href="cancel-order?id=<%=o.getOrderId()%>">Annuler l'achat</a></td> --%>
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