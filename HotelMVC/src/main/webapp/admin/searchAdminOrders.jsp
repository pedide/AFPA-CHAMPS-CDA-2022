<%@page import="com.hotelmvc.connection.DbCon"%>
<%@page import="com.hotelmvc.model.*"%>
<%@page import="com.hotelmvc.dao.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

ReservationDAO od = new ReservationDAO(DbCon.getConnection());
String search = request.getParameter("search");
List<Reservation> orders = od.getAllSearchOrders(search);

%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

<%@include file="adminHeader.jsp"%>

<title>Clients Orders</title>

</head>
<body style="margin-top: 8em">
		<div class="container">
		<div class="card-header my-3">List of ordershh for: <h2><%=search%></h2></div>
		<div class="row">

	<table style="text-align: center;">
		<thead>
			<th style="background: white; text-align: center" colspan="9">
				<div class="search-container" colspan="9">
					<form action="searchAdminOrders.jsp" method="post">
						<input type="text" placeholder="search" name="search">
						<button type="submit">
							<i class="fa fa-search"></i>
						</button>
					</form>
				</div>
			</th>
		</thead>
		<thead style="position: sticky; top: 99px;">
			<tr>
				<th scope="col">Id Orders</th>
				<th scope="col">Id Produits</th>
				<th scope="col">Id users</th>
				<th scope="col">Quantity <i class="fas fa-euro-sign"></i></th>
				<th scope="col">Date Orders</th>
				<th scope="col">Price UTTC</th>
				<th scope="col">Total Orders</th>
				<th scope="col">Email</th>

				<th scope="col">Edit<i class="fas fa-pen-fancy"></i></th>

			</tr>
		</thead>
		<tbody>
			<%
			if (!orders.isEmpty()) {

				for (Reservation o : orders) {
			%>
			<tr>
				<td><%=o.getReservationId()%></td>
				<td><%=o.getRoomId()%></td>
				<td><%=o.getUid()%></td>
				<td><%=o.getQuantity()%></td>
				<td><%=o.getDate()%></td>
				<td><%=o.getPrice()%><i class="fa fa-euro-sign"></i></td>
				<td><%=o.getTotal()%><i class="fa fa-euro-sign"></i></td>
				<td><%=o.getEmail()%></td>

				<td><a href="">Edit
						<i class="fas fa-pen-fancy"></i>
				</a></td>
			</tr>
			<%
			}
			}
			%>
		</tbody>

	</table>

</body>
</html>