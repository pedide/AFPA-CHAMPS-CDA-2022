<%@page import="com.hotelmvc.model.User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hotelmvc.model.*"%>
<%@page import="com.hotelmvc.dao.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.hotelmvc.connection.DbCon"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
List<Reservation> reservations = null;
if (auth != null) {

	request.setAttribute("person", auth);
	ReservationDAO resaDao = new ReservationDAO(DbCon.getConnection());
	reservations = resaDao.userReservation(auth.getIduser());
} else {
	response.sendRedirect("login.jsp");
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
//List<Cart> cartProduct = null;
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>XPROD ORDERS</title>

</head>
<body style="margin: 8em">
	<%@include file="includes/navbar.jsp"%>

	<div class="container">
		<div class="cart-header my-3">All Orders</div>
		<table class="table table-light">
		<thead>
		<tr>
				<th scope="col">Date</th>
				<th scope="col">Name</th>
				<th scope="col">Category</th>
				<th scope="col">Quantity</th>
				<th scope="col">Price</th>
				<th scope="col">Cancel</th>
					
		</tr>
		
		</thead>
		<tbody>
		<% 
		if(reservations != null){
			for(Reservation r : reservations){
			%>
				<tr>
				<td><%=r.getDate()%></td>
				<td><%=r.getRoomName()%></td>
				<td><%=r.getRoomCategory()%></td>
				<td><%=r.getQuantity()%></td>
				<td><%=dcf.format(r.getPrice())%></td>
				<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=r.getReservationId()%>">Cancel Order</a></td>	
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
</footer>
</html>