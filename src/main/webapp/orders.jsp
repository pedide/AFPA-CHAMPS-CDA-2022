<%@page import="com.xprodmvc.dao.OrderDao"%>
<%@page import="com.xprodmvc.model.Order"%>
<%@page import="com.xprodmvc.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.xprodmvc.model.User" %>   
<%@page import="java.text.DecimalFormat"%>

<%
	User auth = (User)request.getSession().getAttribute("auth");
	List<Order> orders = null;

	if(auth != null){
		request.setAttribute("person", auth);
		OrderDao orderDao = new OrderDao(DbCon.getConnection());
		orders = orderDao.userOrders(auth.getId());
	}else{
		//response.sendRedirect("login.jsp");
	}
	
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	//List<Cart> cartProduct = null;

	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
%>    
    
<!DOCTYPE html>
<html>
<head>
<title>XPROD orders</title>
<%@include file = "includes/head.jsp" %>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class = "container">
	<div class = "cart-header my-3">
		<h2>Mes Achats</h2>
		<table class = "table table-light">
			<thead>
				<tr>
					<th scope = "col">Date</th>
					<th scope = "col">Nom</th>
					<th scope = "col">Catégorie</th>
					<th scope = "col">Quantité</th>
					<th scope = "col">Prix</th>
					<th scope = "col">Annulé</th>
				</tr>
				
			</thead>
			<tbody>
			 <%if(orders != null){
						for(Order o : orders){%>
							<tr>
								<td><%=o.getDate()%></td>
								<td><%=o.getName()%></td>
								<td><%=o.getCategorie()%></td>
								<td><%=o.getQuantity()%></td>
								<td><%=dcf.format(o.getPrixU())%></td>
								<td><a class = "btn btn-sm btn-danger" href = "cancel-order?id=<%=o.getOrderId()%>">Annuler la commande</a></td>
					
							</tr>
					<%}
						}%>
			
			</tbody>
		</table>
	</div> 
</div>


<%@include file = "includes/footer.jsp" %>
</body>
</html>