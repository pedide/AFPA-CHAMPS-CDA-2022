<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.gaiaconsulting.connection.DbCon"%>
<%@page import="com.gaiaconsulting.dao.OrderDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.gaiaconsulting.model.*"%>

<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);

User auth = (User) request.getSession().getAttribute("auth");

List<Order> orders = null;

if (auth != null) {
	request.setAttribute("auth", auth);
	OrderDao orderDao = new OrderDao(DbCon.getConnection());
	orders = orderDao.userOrders(auth.getId());
} else {
	response.sendRedirect("login.jsp");

}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
//List<Cart> cartProduct = null;

if (cart_list != null) {

	//total = pDao.getTotalCartProducts(cart_list);

	request.setAttribute("cart_list", cart_list);
}
%>
<%
%>
<!DOCTYPE html>

<html>

<head>
	<title>Gaia consulting orders</title>
	<%@include file="includes/navbar.jsp"%>
	
</head>

<body style="margin-top:20px">

	<div class="container ">
		<div class="cart-header my-3">Commandes</div>
			<table class="table table-light">
				<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Nom</th>
					<th scope="col">Categorie</th>
					<th scope="col">quantité</th>
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
					<%-- je recupere ma date  --%>
					<td><%=o.getName()%></td>
					<%-- je recupere le nom --%>
					<td><%=o.getCategory()%></td>
					<%-- je recupere la categorie --%>
					<td><%=o.getQuantity()%></td>
					<%-- je recupere la quantité --%>
					<td><%=dcf.format(o.getPrice())%></td>
					<%-- je recupere le prix --%>
					<td><a class="btn btn-sm btn-danger"
						href="cancel-order?id=<%=o.getOrderId()%>">Cancel</a></td>
				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
	</div>
	<footer>
		<%@include file="includes/footer.jsp"%>	
	</footer>
</body>
</html>